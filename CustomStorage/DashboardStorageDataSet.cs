﻿using System;
using System.Data;

namespace WebDesigner_CustomDashboardStorage
{
    public class DashboardStorageDataSet : DataSet
    {
        public DashboardStorageDataSet()
        {
            DataTable table = new DataTable("Dashboards");
            DataColumn idColumn = new DataColumn("DashboardID", typeof(Int32));
            idColumn.AutoIncrement = true;
            idColumn.AutoIncrementSeed = 1;
            idColumn.Unique = true;
            idColumn.AllowDBNull = false;
            table.Columns.Add(idColumn);
            table.Columns.Add("DashboardXml", typeof(string));
            table.Columns.Add("DashboardName", typeof(string));
            table.PrimaryKey = new DataColumn[] { idColumn };
            Tables.Add(table);
        }
    }
}