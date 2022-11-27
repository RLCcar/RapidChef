using CefSharp;
using javax.swing.text;
using MySql.Data.MySqlClient;
using org.w3c.dom;
using RapidChef.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class AI_Recipe_R : System.Web.UI.Page
    {
        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" + "pwd=Sce7269680!!; database=senf22g7");
        static string title = "";
        static string directions = "";
        static string Returningredients = "";                                       
        static string datePosted = DateTime.Now.ToString("yyyy-MM-dd");
        static String ingredients = "";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            ApiHelper.InitializeClient();

            if (Session["ingr"] != null)
            {
                ingredients = Session["ingr"].ToString();
                TextBox1.Text = ingredients;
            }
            
            

            gifHidden();
        }

        protected void gifVisible()
        {
            gif1Picture.Visible = true;
        }

        protected void gifHidden()
        {
            gif1Picture.Visible = false;
        }

        protected async void GenerateAI_Click(object sender, EventArgs e)

        {
            gifVisible();
            title = "";
            Returningredients = "";
            directions = "";
            Label1.Visible = false;

            ingredients = TextBox1.Text;
            string recipe = await ApiProcessor.LoadComic(ingredients);
            string[] SplitRec = recipe.Split();
            SplitRec[SplitRec.Length - 1] = (SplitRec[SplitRec.Length - 1].Split('"'))[0];
            int i = 1;
            
            while (!SplitRec[i].Equals("ingredients:"))
            {
                title = title + " " + SplitRec[i];
                i = i + 1;
            }
            i = i + 1;
            while (!SplitRec[i].Equals("directions:"))
            {
                Returningredients = Returningredients + " " + SplitRec[i];
                i = i + 1;
            }
            i = i + 1;
            while (i < SplitRec.Length)
            {
                directions = directions + " " + SplitRec[i];

                i = i + 1;
            }
            
                Label5.Text = " ";
                Label3.Text = " ";
                Label4.Text = " ";
            

            Label5.Text = "Title: " + title;
            Label3.Text = "Ingredients: " + Returningredients;
            Label4.Text = "Directions: " + directions;



            Button1.Visible = true;
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            bool upload = UploadRecipe();
            if (upload)
            {
                Label1.Visible = true;
            }
        }

        public bool UploadRecipe()
        {
            bool uploaded = false;

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = server;
            cmd.CommandText = "INSERT INTO senf22g7.recipe (recipeName, datePosted, postedByuser, description, directions, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10, Ingredient11, Ingredient12, Ingredient13, Ingredient14, Ingredient15) VALUES(?recipeName, ?datePosted,?postedByuser, ?description, ?directions, ?ingredient1, ?ingredient2," +
                " ?ingredient3, ?ingredient4, ?ingredient5, ?ingredient6, ?ingredient7, ?ingredient8, ?ingredient9, ?ingredient10, ?ingredient11, ?ingredient12, ?ingredient13, ?ingredient14, ?ingredient15)";
            //cmd.Prepare();




            //   if (tag1 != null)
            // {
            //   cmd_top += ", tag1";
            // cmd_bottom += ", @tag1";
            //}

            //if (tag2 != null)
            //{
            //  cmd_top += ", tag2";
            //cmd_bottom += ", @tag2";
            //}

            //if (tag3 != null)
            //{
            //  cmd_top += ", tag3";
            //cmd_bottom += ", @tag3";
            //}

            /* DEBUG: Set up some preset ingrIDs and test later */

            string[] spliIngr = ingredients.Split();
           // for (int i = 0; i < spliIngr.Length; i++)
           // {
           //     if (String.IsNullOrEmpty(spliIngr[i]))
            //        break;

            //    cmd_top += "Ingredient" + Convert.ToString(i + 1);
            //    cmd_bottom += "@Ingredient" + Convert.ToString(i + 1);
            //}

            //System.Diagnostics.Debug.WriteLine(cmd_top + cmd_bottom + ");"); // Test if the script is built correctly

            /* Complete the cmd with parameters */
            //MySqlCommand cmd = new MySqlCommand(cmd_top + cmd_bottom + ");", server);

            //Required
            cmd.Parameters.AddWithValue("@recipeName", title);
            cmd.Parameters.AddWithValue("@datePosted", datePosted);
            cmd.Parameters.AddWithValue("@description", "Good");
            cmd.Parameters.AddWithValue("@directions", directions);
            cmd.Parameters.AddWithValue("@postedByuser", 888);
            // if (tag1 != null)
            //   cmd.Parameters.AddWithValue("@tag1", tag1);

            //   if (tag2 != null)
            //    cmd.Parameters.AddWithValue("@tag2", tag2);

            // if (tag3 != null)
            // cmd.Parameters.AddWithValue("@tag3", tag3);


            if (spliIngr.Length < 15)
            {
                int i = 15 - spliIngr.Length;

                for (int j = 0; j < i; j++)
                {
                    ingredients = ingredients + " ";
                }
                spliIngr = ingredients.Split();
            }
           
                cmd.Parameters.AddWithValue("@Ingredient1", spliIngr[0]);
                cmd.Parameters.AddWithValue("@Ingredient2", spliIngr[1]);
                cmd.Parameters.AddWithValue("@Ingredient3", spliIngr[2]);
                cmd.Parameters.AddWithValue("@Ingredient4", spliIngr[3]);
                cmd.Parameters.AddWithValue("@Ingredient5", spliIngr[4]);
                cmd.Parameters.AddWithValue("@Ingredient6", spliIngr[5]);
                cmd.Parameters.AddWithValue("@Ingredient7", spliIngr[6]);
                cmd.Parameters.AddWithValue("@Ingredient8", spliIngr[7]);
                cmd.Parameters.AddWithValue("@Ingredient9", spliIngr[8]);
                cmd.Parameters.AddWithValue("@Ingredient10", spliIngr[9]);
                cmd.Parameters.AddWithValue("@Ingredient11", spliIngr[10]);
                cmd.Parameters.AddWithValue("@Ingredient12", spliIngr[11]);
                cmd.Parameters.AddWithValue("@Ingredient13", spliIngr[12]);
                cmd.Parameters.AddWithValue("@Ingredient14", spliIngr[13]);
                cmd.Parameters.AddWithValue("@Ingredient15", spliIngr[14]);
               
                try
            {
                server.Open();

                int lines = cmd.ExecuteNonQuery();

                if (lines > 0)
                    uploaded = true;
            }
            finally
            {
                server.Close();
            }

            // TODO: How do I get the new recipe's ID?

            return uploaded;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            ingredients = TextBox1.Text;
        }
    }
}