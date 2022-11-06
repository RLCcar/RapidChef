using RapidChef.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class AI_Recipe_R : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ApiHelper.InitializeClient();
        }

        protected async void GenerateAI_Click(object sender, EventArgs e)

        {
            string recipe = await ApiProcessor.LoadComic("potato, butter, egg");
            string[] SplitRec = recipe.Split();
            SplitRec[SplitRec.Length - 1] = (SplitRec[SplitRec.Length - 1].Split('"'))[0];
            int i = 1;
            string title = "";
            string directions = "";
            string ingredients = "";
            while (!SplitRec[i].Equals("ingredients:"))
            {
                title = title + " " + SplitRec[i];
                i = i + 1;
            }
            i = i + 1;
            while (!SplitRec[i].Equals("directions:"))
            {
                ingredients = ingredients + " " + SplitRec[i];
                i = i + 1;
            }
            i = i + 1;
            while (i < SplitRec.Length)
            {
                directions = directions + " " + SplitRec[i];

                i = i + 1;
            }

            Label5.Text = "Title: " + title;
            Label3.Text = "Ingredients: " + ingredients;
            Label4.Text = "Directions: " + directions;



            Button1.Visible = true;
        }
        }
}