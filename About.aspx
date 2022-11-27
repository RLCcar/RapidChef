<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="RapidChef.About" %>

<%--Color Codes:
    #91091E Red
    #DA723C Orange
    #C39E5C Brown
    #FDF1D6 Creame

--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />    
    <h2><%: Title %></h2>
    <h3>About RapidChef</h3>
    <p>RapidChef is a senior project created at University of Houston: Clear Lake by a team of six students in the Fall 2022 Semester.</p>

    <h4>Concept</h4>
    <p>
        The main goal of the site was for users to be able to find recipe ideas using only ingredients they had in their home.
        The users could use this site for immediate recipe ideas when meal plans went bad, ways to use ingredients that are about to go bad, or encouragement to try something new.
    </p>

    <h4>Challenges and Obstacles</h4>
    <p>The biggest challenge of the project was how to integrate the MySQL database with the website.</p>
    <p>
        Once we can interact with the database and get the data we need, the biggest problem is how we interpret this data. How do we view this data? How do we allow the user to add data or modify exisitng data?
        The solution we decided on was to use Model-view-controller code, defined in the system architecture.
    </p>

    <h4>System Architecture</h4>
    <p>The webpage uses mostly MVC (Model-View-Controller) code to directly communicate with the database about users, recipes, reviews, etc.</p>
    <p>
        Basically, every table in the database is represented by a model in the website to hold, interpret, and validate data between the user and the database.
        Controllers are used to utilize these models and pass them on to Views, which use the model data to craft the webpage.
    </p>

    <p>
        AI Recipes uses an artifical intelligence tool to generate recipes based on the given set of ingredients (either from an ingredient query or by typing a comma list).
        When completed, the recipe is printed out and can be posted onto the website as a new recipe!
    </p>
</asp:Content>
