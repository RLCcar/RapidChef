<%@ Page Title="AI Recipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AI Recipe R.aspx.cs" Inherits="RapidChef.AI_Recipe_R" Async ="true" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >   

    <br/>
    <br/>
    <br/>
<contentcenter><asp:Label ID="Label2" runat="server" Text="Use AI to Create a Recipe" Font-Size="XX-Large"></asp:Label></contentcenter>
<br />
<br />
<br />
<contentcenter><asp:Label ID="Label6" runat="server" Text="Enter your ingredients and search" Font-Size="X-Large"></asp:Label><contentcenter>
    

<br />
<br />
<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

        <br />
        <br />
        <div>
         <asp:Button ID="GenerateAI" runat="server" Text="Generate AI Recipe" OnClick="GenerateAI_Click" CssClass="btn btn-default" />
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
        <asp:Button ID="Button1" runat="server" Text="Save this Recipe" Visible="False" OnClick="Button1_Click" CssClass="btn btn-default" />
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="Receipt Uploaded" Visible ="False"></asp:Label>
        <div visible="false" runat="server" id="gif1Picture" name= "gif1Picture" style="width:15%;height:0;padding-bottom:25%"><iframe src="https://giphy.com/embed/demgpwJ6rs2DS" width="50%" height="50%" style="position:absolute" frameBorder="0" class="giphy-embed" ></iframe></div>
        <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <a href="https://giphy.com/gifs/perfectloops-chef-melons-demgpwJ6rs2DS">via GIPHY</a>
         
        
</asp:Content>
