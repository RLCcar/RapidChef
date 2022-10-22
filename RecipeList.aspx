<%@ Page Title="Recipe List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipeList.aspx.cs" Inherits="RapidChef.RecipeList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <title>Recipes</title>
    <h1>Recipes</h1>

    <asp:label id="Message"
        forecolor="Red"
        runat="server"
        AssociatedControlID="GridView1"/>

        <div>
            <asp:SqlDataSource ID="RecipeDS" runat="server"
                ConnectionString="<%$ ConnectionStrings:Ingredients %>"
                ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>"
                SelectCommand="SELECT * FROM recipe"></asp:SqlDataSource>

            <asp:GridView
                ID="GridView1" runat="server" DataSourceID="RecipeDS"
                AutoGenerateColumns ="True"
                onrowcommand="GridView1_RowCommand">

                <Columns>
                    <asp:ButtonField buttontype="Button"
                        commandname="View"
                        headertext="View Recipe"
                        text="View"/>
                </Columns>

            </asp:GridView>

            <div></div>

            <script runat="server">
                protected void Add_Click(object sender, EventArgs e)
                {
                    Response.Redirect("RecipeCreate.aspx");
                    //or
                    //Server.Transfer("RecipeCreate.aspx");
                }
            </script>
            <asp:Button ID="Button1" runat="server" Text="Add Recipe" OnClick="Add_Click"/>
        </div>
</asp:content>
