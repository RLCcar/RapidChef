﻿using System;
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

namespace RapidChef.Models
{
    public class Recipe
    {
        public int recipeID { get; set; }
        public string recipeName { get; set; }
        public int postedByuser { get; set; }
        public string datePosted { get; set; }
        public string description { get; set; }
        public string directions { get; set; }
        public int? tag1 { get; set; }
        public int? tag2 { get; set; }
        public int? tag3 { get; set; }
        public string[] ingrIDs { get; set; }

        //static ConnectionStringSettings conn = ConfigurationManager.ConnectionStrings["Ingredients"];

        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                                    "pwd=Sce7269680!!; database=senf22g7");

        static MySqlCommand list_cmd   = new MySqlCommand("SELECT * FROM senf22g7.recipe", server);
        static MySqlCommand detail_cmd = new MySqlCommand("SELECT * FROM senf22g7.recipe WHERE recipeID = @ID", server);
        static MySqlCommand create_cmd = new MySqlCommand("INSERT INTO `senf22g7`.`recipe` (`recipeName`) "); /* Work In Progress */
        static MySqlCommand delete_cmd = new MySqlCommand(""); /* Work In Progress */

        public Recipe()
        {
            ingrIDs = new string[15];
        }

        public Recipe(int id)
        {
            ingrIDs = new string[15];

            // Using Microsoft's way
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

            // Using MySQL's way
            detail_cmd.Parameters.AddWithValue("@ID", id);

            server.Open();

            MySqlDataReader rdr = detail_cmd.ExecuteReader();
            if (rdr.Read())
            {
                recipeID = id;
                recipeName = rdr.GetString(1);
                postedByuser = rdr.GetInt32(2);
                if (rdr.IsDBNull(3))
                    datePosted = rdr.GetString(3);

                description = rdr.GetString(4);
                directions = rdr.GetString(5);

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
        }

        public static IEnumerable<Recipe> GetAllRecipes()
        {
            List<Recipe> list = new List<Recipe>();

            server.Open();

            MySqlDataReader rdr = list_cmd.ExecuteReader();

            while (rdr.Read())
            {
                Recipe next = new Recipe();

                next.recipeID = rdr.GetInt32(0);
                next.recipeName = rdr.GetString(1);
                next.postedByuser = rdr.GetInt32(2);
                if (rdr.IsDBNull(3))
                    next.datePosted = rdr.GetString(3);

                next.description = rdr.GetString(4);
                next.directions = rdr.GetString(5);

                if (!rdr.IsDBNull(6))
                    next.tag1 = rdr.GetInt32(6);
                if (!rdr.IsDBNull(7))
                    next.tag2 = rdr.GetInt32(7);
                if (!rdr.IsDBNull(8))
                    next.tag3 = rdr.GetInt32(8);

                for (int i = 1; i < 15; i++)
                {
                    if (rdr.IsDBNull(i + 8))
                        break;

                    next.ingrIDs[i] = rdr.GetString(i + 8);
                }

                list.Add(next);
            }

            rdr.Close();
            server.Close();

            return (list);
        }

        public void AddRecipe() /* Work In Progress */
        {
            
        }

        public void DeleteRecipe() /* Work In Progress */
        {

        }
    }
}