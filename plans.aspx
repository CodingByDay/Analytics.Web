﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="plans.aspx.cs" Inherits="Dash.plans" %>

<!DOCTYPE html>
<html>
   <head>
      <title>Dobrodošli na začetno stran</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <style>
         body {
         background-color: #17c0eb;
         font-family: Nunito Sans;
         }
         .btn {
         background-color: #17c0eb;
         width: 100%;
         color: #fff;
         padding: 10px;
         font-size: 18px;
         }
         .btn:hover {
         background-color: #2d3436;
         color: #fff;
         }
         input {
         height: 50px !important;
         }
         .form-control:focus {
         border-color: #18dcff;
         box-shadow: none;
         }
         h3 {
         color: #17c0eb;
         font-size: 36px;
         }
         .cw {
         width: 35%;
         }
         @media(max-width: 992px) {
         .cw {
         width: 60%;
         }
         }
         @media(max-width: 768px) {
         .cw {
         width: 80%;
         }
         }
         @media(max-width: 492px) {
         .cw {
         width: 90%;
         }
         }
      </style>
   </head>
   <body>
           <div class="wrapper fadeInDown">
      <div class="container d-flex justify-content-center align-items-center vh-100">
         <div class="bg-white text-center p-5 mt-3 center">

            <form class="pb-3" action="#" runat="server">
               <div class="form-group">
                   <h3>Planovi</h3>
                    <asp:Button ID="login" runat="server" Text="Prijava" type="submit" OnClick="login_Click" CssClass="btn" />
                   <br />

               </div>
 

            </form>
             </div>
         </div>
      </div>
   </body>
</html>
