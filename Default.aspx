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

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList2 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList3 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList4 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });

                }

            </script>
     <br />
     <br />

<p>
    <input  type="text" id='txtSearch' placeholder="Search for ingredients.." onInput="return Search();" />
</p>

    <asp:Label ID="Label2" runat="server" Text="Check which ingredients you want to use:"></asp:Label>
<%--Accordion do not touch--%>
    <div <%--style='float:left'--%> id="accordion" class="contentwidth">
        <h3>Meat</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="Ingredients" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'meat')"></asp:SqlDataSource>
            </p>
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