using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class RecipeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RecipeDS.SelectParameters.Add("ID", Request.QueryString["ID"]);

            GridView1.DataBind();
        }
    }
}