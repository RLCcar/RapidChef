<%@ Page Title="AI Recipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AI Recipe R.aspx.cs" Inherits="RapidChef.AI_Recipe_R" Async ="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>


    <style>
    body {background-color: rgb(253, 241, 214);} 
    </style>


        <br />
        <br />
        <h3><font size="+2"><color = rgb(145, 9, 30)><center>TRY AI RECIPE FOR YOUR INGREDIENTS</center></h3>
        
        <center><asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></center>
      
        <br />
        <br />
        <div><center>
            <asp:Button ID="GenerateAI" runat="server" Text="Generate AI Recipe" OnClick="GenerateAI_Click" /></center>
        </div>
        <br />
        <br />
        <center><asp:Label ID="Label5" runat="server" Text=" "></asp:Label></center>
  
        <br />
        <br />
        <center><asp:Label ID="Label3" runat="server" Text=" "></asp:Label></center>
        <br />
        <br />
        <center><asp:Label ID="Label4" runat="server" Text=" "></asp:Label></center>
        <br />
        <br />
        <center><asp:Button ID="Button1" runat="server" Text="Save this Recipe" Visible ="False" OnClick="Button1_Click" /></center>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Receipt Uploaded" Visible ="False"></asp:Label>
  
</asp:Content>
