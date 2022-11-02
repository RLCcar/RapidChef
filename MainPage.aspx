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

</asp:Content>
