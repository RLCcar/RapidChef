<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AI Recipe R.aspx.cs" Inherits="RapidChef.AI_Recipe_R" Async ="true" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body {background-color: rgb(253, 241, 214);} 
    </style>
</head>
<body>


    <form id="form1" runat="server">
        <br />
        <br />
        <h3><font size="+2"><color = rgb(145, 9, 30)><center>TRY AI RECEPIE FOR YOUR INGREDIENTS</center></h3>
        <center><asp:Label ID="Label2" runat="server" Text="Ingredients"></asp:Label></center>
      
        <br />
        <br />
        <div><center>
            <asp:Button ID="GenerateAI" runat="server" Text="Generate AI Recepie" OnClick="GenerateAI_Click" /></center>
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
        <center><asp:Button ID="Button1" runat="server" Text="Save this Recipe" Visible ="False" /></center>
    </form>
</body>
</html>
