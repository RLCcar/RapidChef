<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="RapidChef.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        Meat</p>
    <asp:Panel ID="Panel1" runat="server">
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
        </asp:CheckBoxList>
    </asp:Panel>
    <p>
        Grains</p>
    <asp:Panel ID="Panel4" runat="server">
        <asp:CheckBoxList ID="CheckBoxList4" runat="server">
        </asp:CheckBoxList>
    </asp:Panel>
    <p>
        Vegetables</p>
    <asp:Panel ID="Panel2" runat="server">
        <asp:CheckBoxList ID="CheckBoxList2" runat="server">
        </asp:CheckBoxList>
    </asp:Panel>
    <p>
        Fruit</p>
    <asp:Panel ID="Panel3" runat="server">
        <asp:CheckBoxList ID="CheckBoxList3" runat="server">
        </asp:CheckBoxList>
    </asp:Panel>
    <p>
        Other</p>
    <asp:Panel ID="Panel5" runat="server">
        <asp:CheckBoxList ID="CheckBoxList5" runat="server">
        </asp:CheckBoxList>
    </asp:Panel>
    <p>
        Selected Ingredients:</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
    </p>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [recipe] WHERE (([recipeName] = ?) AND ([directions] = ?) AND ([description] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="recipeName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label2" Name="directions" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label3" Name="description" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
    </asp:DataList>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>

</asp:Content>
