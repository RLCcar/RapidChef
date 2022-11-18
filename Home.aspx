<%@ Page Title="Home" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.cs" Inherits="RapidChef.Home" %>

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
            <script type="text/jscript">
                function Search() {

                    var t = document.getElementById("txtSearch").value;

                    $('#MainContent_CheckBoxList1 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList2 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList3 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList4 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList5 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList6 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                    $('#MainContent_CheckBoxList7 tbody td').each(function () {

                        var str = $(this).text();
                        if (str.toUpperCase().indexOf(t.toUpperCase()) >= 0) {

                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });

                }

            </script>
     <br />
     <br />
<p>
    <input  type="text" id='txtSearch' placeholder="Search for ingredients.." onInput="return Search();" style="width: 180px" />
</p>

    <asp:Label ID="Label2" runat="server" Text="Check which ingredients you want to use:" Font-Bold="True" Font-Italic="True" Font-Size="Larger"></asp:Label>
    <br />
<%--Accordion do not touch--%>
    <div <%--style='float:left'--%> id="accordion" class="contentwidth">
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
         <h3>Grains</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'grain')"></asp:SqlDataSource>
            </p>
        </div>
         <h3>Herbs and Spices</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList6" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'spice')"></asp:SqlDataSource>
            </p>
        </div>
         <h3>Other</h3>
        <div>
            <p>
                <asp:CheckBoxList ID="CheckBoxList7" runat="server" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="name" RepeatColumns="5" CssClass="paddingright">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Ingredients %>" ProviderName="<%$ ConnectionStrings:Ingredients.ProviderName %>" SelectCommand="SELECT name, category FROM ingredients WHERE (category = 'other')"></asp:SqlDataSource>
            </p>
        </div>
    </div>
<%--   End of Accordion --%>

<%--Ingredients Selected List--%>
    <div <%--style='float:right'--%>>
        <%--<asp:Label ID="selected" runat="server" Text="Label"></asp:Label>--%>
    </div>

<%--Query Search Button	--%>
    <div >
	 <asp:Button ID="Button" runat="server" OnClick="Button1_Click1" Text="Search" />
	 	 <br />
		 <br />
	 <%--<asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding" Text="Query Stringbuilder Results"></asp:Label>--%>
	 </div>
	 <br />

</asp:Content>