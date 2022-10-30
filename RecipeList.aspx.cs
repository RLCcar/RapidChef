using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class RecipeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int row_ndx = Convert.ToInt32(e.CommandArgument);

            TableCell item = GridView1.Rows[row_ndx].Cells[1];

            int recipeID = Convert.ToInt32(item.Text);

            Response.Redirect("RecipeDetails.aspx?ID=" + recipeID);

            //Message.Text = "You selected " + item.Text + ".";
        }
    }
}