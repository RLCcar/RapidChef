<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RapidChef._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--Styles and Scripts--%>
     <link rel="stylesheet" href="customtheme\jquery-ui-1.13.2.custom\jquery-ui.css" >
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
            <img src="Images/Logo.png" width="200px" />
        </div>
        <div class="col-md-4">

        </div>
    </div>
     <div class="row">
         <div class="col-md-12">
            <h1>Welcome to RapidChef</h1>
        </div>
    </div>
     <div class="row">
         <div class="col-md-12">
             <h2>Start Cooking Today! </h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>RapidChef was made to help save users time and money from buying extra groceries or eating out by convincing them to cook their own meals with what they have left at home, teaching users to become flexible in their meal plans. In this way, RapidChef also helps users discover creative new ways to prepare dishes and strengthen their cooking skills and confidence. </h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="Home.aspx" class="btn btn-info">
                Get Started
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <span class="pull-right" style="margin-right:20px;">
                <a href="Privacy.aspx" style="color:#000000">Privacy</a>
            </span>
        </div>
    </div>


</asp:Content>
