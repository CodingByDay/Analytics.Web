﻿
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="peptak.index" %>
<%@ Register assembly="DevExpress.Dashboard.v20.2.Web.WebForms, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <style>
        .container.body-content{
min-width: 100% !important;
}
    </style>
   
    <script>

        $(".navbar").mouseover(function () {
            $('.dx-overlay-content').show();
            console.log("Show");
            $(".dx-dashboard-surface").attr('style', 'left: 250px !important');
            $(".dx-dashboard-viewer-content").attr('style', 'min-width: 100% !important');

        });

        $(function () {
            $('.dx-overlay-content').click(function () {
                $(this).hide();
                console.log("hide");
                $(".dx-dashboard-surface").attr('style', 'left: 50px !important');
                $(".dx-dashboard-viewer-content").attr('style', 'min-width: 120% !important');

            });
        });

        function onBeforeRender(sender) {

            DevExpress.Dashboard.ResourceManager.embedBundledResources();
            var dashboardControl = sender.GetDashboardControl();
            // ...
            dashboardControl.registerExtension(new DevExpress.Dashboard.DashboardPanelExtension(dashboardControl));

        }

        $(document).keypress(function (e) { if (e.keyCode === 13) { e.preventDefault(); return false; } });
        $(function () {
            $(':text').bind('keydown', function (e) { // on keydown for all textboxes  
                if (e.keyCode == 13) // if this is enter key  
                    e.preventDefault();
            });
        });
    </script>
    <div class="row">
        <div class="col-sm-12">
        
        </div>
    </div>
    <div class="jumbotron">


    

   

        <dx:ASPxDashboard ID="ASPxDashboard3" runat="server" MobileLayoutEnabled="Auto" AllowCreateNewJsonConnection="True" AllowExecutingCustomSql="True" AllowInspectAggregatedData="True" AllowInspectRawData="True" EnableCustomSql="True" EnableTextBoxItemEditor="True" LimitVisibleDataMode="DesignerAndViewer">
                   <ClientSideEvents BeforeRender="onBeforeRender" />

        </dx:ASPxDashboard>
    </div>

   
      





</asp:Content>
