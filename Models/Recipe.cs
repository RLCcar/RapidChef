using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace RapidChef.Models
{
    public class Recipe
    {
        public int recipeID { get; set; }

        [Required]
        [StringLength(45)]
        [DisplayName("Name")]
        public string recipeName { get; set; }

        [DisplayName("Posted By")]
        public int? postedByuser { get; set; }

        //[DataType(DataType.Date)] // Currently unapplicable, as datePosted is a string in the Recipe table
        [DisplayName("Posted On")]
        public string datePosted { get; set; }

        [Required]
        [StringLength(500)]
        [DisplayName("Description")]
        public string description { get; set; }

        [Required]
        [StringLength(1000)]
        [DisplayName("Directions")]
        public string directions { get; set; }

        public int? tag1 { get; set; }

        public int? tag2 { get; set; }

        public int? tag3 { get; set; }

        //[Remote(action: "VerifyIngredient", controller: "Recipe")]
        [DisplayName("Ingredients")]
        public string[] ingrIDs { get; set; }

        //static ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["Ingredients"]; // Used with Microsoft SQL

        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                                    "pwd=Sce7269680!!; database=senf22g7");

        static MySqlCommand list_cmd   = new MySqlCommand("SELECT * FROM senf22g7.recipe", server);
        static MySqlCommand detail_cmd = new MySqlCommand("SELECT * FROM senf22g7.recipe WHERE recipeID = @ID", server);

        public Recipe()
        {
            ingrIDs = new string[15];
        }

        /* Constructor - Grabs Recipe from database using recipeID */
        public Recipe(int id)
        {
            ingrIDs = new string[15];

            #region Using Microsoft SQL (Unused)
            //SqlDataSource server = new SqlDataSource(conn.ConnectionString, "SELECT * FROM recipe WHERE recipeID=@ID");

            //try
            //{
            //    IEnumerable Recipes = server.Select(DataSourceSelectArguments.Empty);

            //    //Iterate to create a Recipe object for every Recipe
            //       foreach (DataRowView row in Recipes)
            //        {
            //            recipeID = (int)row["recipeID"];
            //            recipeName = (string)row["recipeName"];
            //            postedByuser = (int)row["postedByuser"];
            //            datePosted = (string)row["datePosted"];
            //            description = (string)row["description"];
            //            directions = (string)row["directions"];
            //            tag1 = (int)row["tag1"];
            //            tag2 = (int)row["tag2"];
            //            tag3 = (int)row["tag3"];

            //            for (int i = 0; i < 15; i++)
            //            {
            //                int ingr = (int)row["ingrID" + (i + 1)];

            //                if (ingr != 0) // NOT NULL
            //                    ingrIDs[i] = ingr;
            //                else
            //                    break;
            //            }
            //        }
            //}
            //finally
            //{
            //    server.Dispose();
            //}
            #endregion

            #region Using MySQL
            detail_cmd.Parameters.AddWithValue("@ID", id);

            server.Open();

            MySqlDataReader rdr = detail_cmd.ExecuteReader();
            if (rdr.Read())
            {
                recipeID = id;
                recipeName = rdr.GetString(1);

                if (!rdr.IsDBNull(2))
                    postedByuser = rdr.GetInt32(2);
                if (!rdr.IsDBNull(3))
                    datePosted   = rdr.GetString(3);

                description = rdr.GetString(4);
                directions  = rdr.GetString(5);

                if (!rdr.IsDBNull(6))
                    tag1 = rdr.GetInt32(6);
                if (!rdr.IsDBNull(7))
                    tag2 = rdr.GetInt32(7);
                if (!rdr.IsDBNull(8))
                    tag3 = rdr.GetInt32(8);

                for (int i = 1; i < 15; i++)
                {
                    if (rdr.IsDBNull(i + 8))
                        break;

                    ingrIDs[i] = rdr.GetString(i + 8);
                }
            }

            rdr.Close();
            server.Close();

            detail_cmd.Parameters.Clear();
            #endregion
        }

        //public Recipe(FormCollection collection)
        //{
        //    recipeName  = collection["recipeName"];
        //    description = collection["description"];
        //    directions  = collection["directions"];

        //    if (collection["tag1"] != null)
        //        tag1 = Convert.ToInt32(collection["tag1"]);

        //    if (collection["tag2"] != null)
        //        tag2 = Convert.ToInt32(collection["tag2"]);

        //    if (collection["tag3"] != null)
        //        tag3 = Convert.ToInt32(collection["tag3"]);

        //    ingrIDs = new string[15];
        //    /* Set up some preset ingrIDs for ease of testing */
        //    ingrIDs[0] = "lizard";
        //    ingrIDs[1] = "chicken";
        //    ingrIDs[2] = "apple";

        //    datePosted = DateTime.Now.ToString("yyyy-MM-dd"); //Gets current time in right format
        //}

        /* GetAllRecipes - Get all the recipes in the database */
        public static IEnumerable<Recipe> GetAllRecipes()
        {
            List<Recipe> list = new List<Recipe>();

            server.Open();

            MySqlDataReader rdr = list_cmd.ExecuteReader();

            while (rdr.Read())
            {
                Recipe next = new Recipe();

                next.recipeID   = rdr.GetInt32(0);
                next.recipeName = rdr.GetString(1);

                if (!rdr.IsDBNull(2))
                    next.postedByuser = rdr.GetInt32(2);
                if (!rdr.IsDBNull(3))
                    next.datePosted   = rdr.GetString(3);

                next.description = rdr.GetString(4);
                next.directions  = rdr.GetString(5);

                //Tags
                if (!rdr.IsDBNull(6))
                    next.tag1 = rdr.GetInt32(6);
                if (!rdr.IsDBNull(7))
                    next.tag2 = rdr.GetInt32(7);
                if (!rdr.IsDBNull(8))
                    next.tag3 = rdr.GetInt32(8);

                //Ingredients
                for (int i = 1; i < 15; i++)
                {
                    if (rdr.IsDBNull(i + 8))
                        break;

                    next.ingrIDs[i] = rdr.GetString(i + 8);
                }

                list.Add(next);
            }

            // Close the Reader and Server
            rdr.Close();
            server.Close();

            return (list);
        }

        public bool UploadRecipe()
        {
            bool uploaded = false;

            /* NOTE:
             * optional attributes may be left null, so the custom create script only adds those provided by the user.
             * 
             * We can try using another class like MySQLDataAdapter and MySQLCommandBuilder to build this command, if needed.
             */
            string cmd_top = "INSERT INTO senf22g7.recipe (recipeName, datePosted, description, directions";
            string cmd_bottom = ") VALUES (@recipeName, @datePosted, @description, @directions";

            //postedByuser = Session["userID"] // TODO: Get postedByuser if logged in (using session variables)
            //cmd_top += ", postedByuser";
            //cmd_bottom += ", \'" + Convert.ToString(postedByuser) + "\'";

            datePosted = DateTime.Now.ToString("yyyy-MM-dd"); // TODO: Will change if datePosted changes to DateTime type

            if (tag1 != null)
            {
                cmd_top += ", tag1";
                cmd_bottom += ", @tag1";
            }

            if (tag2 != null)
            {
                cmd_top += ", tag2";
                cmd_bottom += ", @tag2";
            }

            if (tag3 != null)
            {
                cmd_top += ", tag3";
                cmd_bottom += ", @tag3";
            }

            /* DEBUG: Set up some preset ingrIDs and test later */
            ingrIDs[0] = "lizard";
            ingrIDs[1] = "chicken";
            ingrIDs[2] = "apple";

            for (int i = 0; i < 15; i++)
            {
                if (ingrIDs[i] == null)
                    break;

                cmd_top += ", Ingredient" + Convert.ToString(i + 1);
                cmd_bottom += ", @Ingredient" + Convert.ToString(i + 1);
            }

            System.Diagnostics.Debug.WriteLine(cmd_top + cmd_bottom + ");"); // Test if the script is built correctly

            /* Complete the cmd with parameters */
            MySqlCommand cmd = new MySqlCommand(cmd_top + cmd_bottom + ");", server);

            //Required
            cmd.Parameters.AddWithValue("@recipeName", recipeName);
            cmd.Parameters.AddWithValue("@datePosted", datePosted);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@directions", directions);

            if (tag1 != null)
                cmd.Parameters.AddWithValue("@tag1", tag1);

            if (tag2 != null)
                cmd.Parameters.AddWithValue("@tag2", tag2);

            if (tag3 != null)
                cmd.Parameters.AddWithValue("@tag3", tag3);

            for (int i = 0; i < 15; i++)
            {
                if (ingrIDs[i] == null)
                    break;

                cmd.Parameters.AddWithValue("@Ingredient" + Convert.ToString(i + 1), ingrIDs[i]);
            }

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

        public void EditRecipe() /* Work In Progress */
        {
            /* NOTE:
             * not all attributes will be updated, so the custom edit script only edits those specified by the user.
             * 
             * We can try using another class like MySQLDataAdapter and MySQLCommandBuilder to build this command, if needed.
             */
            MySqlCommand edit_cmd = new MySqlCommand("", server); /* Work In Progress */

            server.Open();

            edit_cmd.ExecuteNonQuery();

            server.Close();
        }

        static MySqlCommand delete_cmd = new MySqlCommand("DELETE FROM senf22g7.recipe WHERE recipeID = @ID", server);
        public static void DeleteRecipe(int id)
        {
            server.Open();

            delete_cmd.Parameters.AddWithValue("@ID", id);

            int lines = delete_cmd.ExecuteNonQuery();

            //if (lines == 0)
            //{
            //    // An error occured; how to illustrate this error?
            //}

            server.Close();

            delete_cmd.Parameters.Clear();
        }

    }
}