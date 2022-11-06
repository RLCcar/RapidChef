<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RapidChef._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="customtheme\jquery-ui-1.13.2.custom\jquery-ui.css" >

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
      $(function () {
          $("#accordion").accordion({
              heightStyle: "content"
          });
      });
  </script>

    <div id="accordion">
        <h3>Meat</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name" CssClass="checkboxlist">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="Ingredients" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'meat')"></asp:SqlDataSource>
            </p>
        </div>


        <h3>Vegetables</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" RepeatColumns="5">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'vegetable')"></asp:SqlDataSource>
            </p>
        </div>
        <h3>Fruit</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" CssClass="checkboxlist">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'fruit')"></asp:SqlDataSource>
            </p>
        </div>
        <h3>Dairy</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="name" CssClass="checkboxlist">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'dairy')"></asp:SqlDataSource>
            </p>
        </div>
    </div>
	<div>
	 <asp:Button ID="Button" runat="server" OnClick="Button1_Click1" Text="Search" />
	 	 <br />
		 <br />
	 <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding" Text="Query Stringbuilder Results"></asp:Label>
	 </div>
	 <br />

</asp:Content>
