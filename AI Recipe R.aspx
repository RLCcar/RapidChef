<%@ Page Title="AI Recipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AI Recipe R.aspx.cs" Inherits="RapidChef.AI_Recipe_R" Async ="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="contentwidth">
          
        <br />
        <br />
          
        <br />
          
        <br />
        <br />

        <br />
    <div class="contentcenter">
        <asp:Label ID="Label2" runat="server" Text="Use AI to find a Recipe" Font-Size="XX-Large"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Enter your ingredients and search" Font-Size="X-Large"></asp:Label>

        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

        <br />
        <br />
        <div>
            <asp:Button ID="GenerateAI" runat="server" Text="Generate AI Recipe" OnClick="GenerateAI_Click" />
        </div>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>

        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Save this Recipe" Visible="False" OnClick="Button1_Click" />
        <br />
        <br />
    </div>
        <asp:Label ID="Label1" runat="server" Text="Receipt Uploaded" Visible ="False"></asp:Label>
        
 </div>
</asp:Content>
