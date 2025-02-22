﻿using Dash.Log;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Dash.ORM
{



    public static class UserHelper
    {
        public static List<User> getAll ()
        {
            List<User> payload = new List<User>();



            return payload;
        }
    }

    public class GraphName
    {
        public string name { get; set; }
    }
    public class User
    {
        private string connection = ConfigurationManager.ConnectionStrings["graphsConnectionString"].ConnectionString;

        public string uname { get; set; }

        public string Pwd { get; set; }


        public string userRole { get; set; }


        public string ViewState { get; set; }


        public string email { get; set; }


        public string graphs { get; set; }

        public User(string uname, string Pwd, string userRole, string ViewState, string email)
        {
            this.uname = uname;
            this.Pwd = Pwd;
            this.userRole = userRole;
            this.ViewState = ViewState;
            this.email = email;
        }

        public User(string uname, string Pwd, string userRole, string ViewState, string email, string graphs)
        {
            this.uname = uname;
            this.Pwd = Pwd;
            this.userRole = userRole;
            this.ViewState = ViewState;
            this.email = email;
            this.graphs = graphs;
        }


        public List<GraphName> GetGraphNames()
        {
            List<GraphName> data = new List<GraphName>();
            var splitted = this.graphs.Split(',');
            foreach(string split in splitted)
            {
                data.Add(new GraphName {  name= split});
            }
            return data;
        }


        public void RemoveGraph(string name)
        {
            try
            {
                var graphs = GetGraphNames();
                var toRemove = graphs.Find(x => x.name == name);
                graphs.RemoveAt(graphs.IndexOf(toRemove));

                string returnValue = string.Empty;
                foreach(var x in graphs)
                {
                    returnValue += $"{x.name},"; 
                }
                this.graphs = returnValue;
            } catch
            {
            }
        }

        public bool IsPermited(string name)
        {
            bool isOk = false;

            try
            {
                var graphs = GetGraphNames();
                foreach(var graph in graphs)
                {
                    if(graph.name == name)
                    {
                        isOk = true;
                    }
                }

                return isOk;
            }   
            catch
            {
                isOk = false;
                return isOk;
            }
        }


        public void AddGraph(string name)
        {
            try
            {
                var graphs = GetGraphNames();
                graphs.Add(new GraphName {  name = name});

                string returnValue = string.Empty;
                foreach (var x in graphs)
                {
                    returnValue += $"{x.name},";
                }
                this.graphs = returnValue;
            }
            catch
            {
            }
        }

        public User(string uname, bool isSQL) 
        {
            if(isSQL)
            {
                using (SqlConnection conn = new SqlConnection(connection))
                {
                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"SELECT * FROM Users WHERE uname='{uname}'", conn);
                        SqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {                          
                            this.uname = sdr["uname"].ToString();
                            this.userRole = sdr["userRole"].ToString();
                            this.ViewState = sdr["ViewState"].ToString();
                            this.graphs = sdr["graphs"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogError(typeof(tenantadmin), ex.Message);
                    }
                }
            }
        }
    }
}