<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RapidChef._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="font-size: large; color: red">
<div> Meats </div>
     <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name">
     </asp:CheckBoxList>
     <asp:SqlDataSource ID="Ingredients" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'meat')"></asp:SqlDataSource>
</div>
<div>
</div>
<div style="font-size: large; color: green">
<p> Plants </p>
<asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name">
     </asp:CheckBoxList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'plant')"></asp:SqlDataSource>
</div>
</asp:Content>
