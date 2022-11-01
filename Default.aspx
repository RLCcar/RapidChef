<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RapidChef._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<button class="collapsible">Meats</button>
<div class="content">
     <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name" CssClass="checkboxlist">
     </asp:CheckBoxList>
     <asp:SqlDataSource ID="Ingredients" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'meat')"></asp:SqlDataSource>
</div>

<button class="collapsible">Plants</button>
<div class="content">
<asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
     </asp:CheckBoxList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'plant')"></asp:SqlDataSource>
	 </div>
	<div>
	 <asp:Button ID="Button" runat="server" OnClick="Button1_Click1" Text="Search" />
	 	 <br />
		 <br />
	 <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding" Text="Query Stringbuilder Results"></asp:Label>
	 </div>
	 <br />

</asp:Content>
