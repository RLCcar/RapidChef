<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipeDetails.aspx.cs" Inherits="RapidChef.RecipeDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="RecipeDS" runat="server"
        ConnectionString="<%$ ConnectionStrings:Ingredients %>"
        ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>"
        SelectCommand="SELECT * FROM recipe WHERE recipeID=@ID">

        <SelectParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <html>
        <title></title>
    </head>
    <body>
        <form id="form2">
            <h1>Recipe Name</h1>
            <div></div>

            <h3>Description</h3>
            <div></div>

            <h3>Ingredients</h3>
            <div></div>

            <h3>Steps</h3>
            <div></div>
        </form>
    </body>
    </html>
</asp:Content>
