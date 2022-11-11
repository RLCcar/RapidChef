<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RapidChef._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--Styles and Scripts--%>
     <link rel="stylesheet" href="customtheme\jquery-ui-1.13.2.custom\jquery-ui.css" >
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%--Accordion jquery--%>
    <script>
      $(function () {
          $("#accordion").accordion({
              heightStyle: "content"
          });
      });
  </script>
<%-- End of Accordion jquery--%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script type="text/javascript">
      $(document).ready(function () {
          $("#txtSearch").on("keyup", function () {
              debugger;
              var g = $(this).val().toLowerCase();
              $("#CheckBoxList2 tr td input").each(function () {
                  var s = $(this).val().toLowerCase();
                  $(this).parent().parent()[s.indexOf(g) !== -1 ? 'show' : 'hide']();
              });
          });
      });
  </script>
     <br />
     <br />
<p>
    <input  type="text" id='txtSearch' placeholder="Search for ingredients.." onInput="return Search();" />
</p>

    <asp:Label ID="Label2" runat="server" Text="Check which ingredients you want to use:"></asp:Label>
<%--Accordion do not touch--%>
    <div <%--style='float:left'--%> id="accordion">
        <h3>Meat</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="Ingredients" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="Ingredients" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'meat')"></asp:SqlDataSource>
            </p>
        </div>


        <h3>Vegetables</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">          
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'vegetable')"></asp:SqlDataSource>
            </p>
        </div>
        <h3>Fruit</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'fruit')"></asp:SqlDataSource>
            </p>
        </div>
        <h3>Dairy</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'dairy')"></asp:SqlDataSource>
            </p>
        </div>
    </div>
<%--   End of Accordion --%>

<%--Ingredients Selected List--%>
    <div <%--style='float:right'--%>>

    </div>

<%--Query Search Button	--%>
    <div >
	 <asp:Button ID="Button" runat="server" OnClick="Button1_Click1" Text="Search" />
	 	 <br />
		 <br />
	 <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding" Text="Query Stringbuilder Results"></asp:Label>
	 </div>
	 <br />

</asp:Content>
