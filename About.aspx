<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="RapidChef.About" %>

<%--Color Codes:
    #91091E Red
    #DA723C Orange
    #C39E5C Brown
    #FDF1D6 Creame

--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>About RapidChef</h3>
    <p>RapidChef is a senior project created at University of Houston: Clear Lake by a team of six students in the Fall 2022 Semester.</p>

    <h4>Concept</h4>
    <p>The main goal of the site was for users to be able to find recipe ideas using only ingredients they had in their home. The users could use this site for immediate recipe ideas when former meal plans go awry or need to save money.</p>

    <h4>Challenges and Obstacles</h4>
    <p>The biggest challenge of the project was how to integrate the MySQL database with the website.</p>

    <h4>System Architecture</h4>
    <p>To communicate with the database, the webpage uses mostly MVC (Model-View-Controller) code to control all the recipes and reviews on the site, as well as registered users.</p>
</asp:Content>
