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
    public class RecipeVM
    {
        public int recipeID { get; set; }

        [Required]
        [StringLength(45)]
        [DisplayName("Name")]
        public string recipeName { get; set; }

        public int? postedByuser { get; set; }

        [DisplayName("Posted By")]
        public string creator { get; set; }

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

        [DisplayName("Tag 1")]
        public string tag1 { get; set; }

        [DisplayName("Tag 2")]
        public string tag2 { get; set; }

        [DisplayName("Tag 3")]
        public string tag3 { get; set; }

        //[Remote("VerifyIngredient", "Recipe")]
        [DisplayName("Ingredients")]
        public List<string> ingrIDs { get; set; }

        public IEnumerable<review> reviews { get; set; }

        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                                    "pwd=Sce7269680!!; database=senf22g7");

        /* SELECT recipeID, recipeName, CONCAT(user.firstname, ' ', user.lastname) as "creator", datePosted, recipe.description, directions,
         * T1.name AS tag1, T2.name AS tag2, T3.name AS tag3,
         * Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5,
         * Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10,
         * Ingredient11, Ingredient12, Ingredient13, Ingredient14, Ingredient15
         * FROM senf22g7.recipe
         * LEFT JOIN senf22g7.user ON recipe.postedByUser = user.userID
         * LEFT JOIN senf22g7.tag T1 ON recipe.tag1 = T1.tagID
         * LEFT JOIN senf22g7.tag T2 ON recipe.tag2 = T2.tagID
         * LEFT JOIN senf22g7.tag T3 ON recipe.tag2 = T3.tagID;
         */

        static MySqlCommand list_cmd   = new MySqlCommand("SELECT recipeID, recipeName, postedByuser, CONCAT(user.firstname, ' ', user.lastname) as \"creator\", datePosted, recipe.description, directions, " +
                                                          "T1.name AS tag1, T2.name AS tag2, T3.name AS tag3, " +
                                                          "Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, " +
                                                          "Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10, " +
                                                          "Ingredient11, Ingredient12, Ingredient13, Ingredient14, Ingredient15 " +
                                                          "FROM senf22g7.recipe " +
                                                          "LEFT JOIN senf22g7.user ON recipe.postedByUser = user.userID " +
                                                          "LEFT JOIN senf22g7.tag T1 ON recipe.tag1 = T1.tagID " +
                                                          "LEFT JOIN senf22g7.tag T2 ON recipe.tag2 = T2.tagID " +
                                                          "LEFT JOIN senf22g7.tag T3 ON recipe.tag2 = T3.tagID order by recipeName", server);

        static MySqlCommand detail_cmd = new MySqlCommand("SELECT recipeID, recipeName, postedByuser, CONCAT(user.firstname, ' ', user.lastname) as \"creator\", datePosted, recipe.description, directions, " +
                                                          "T1.name AS tag1, T2.name AS tag2, T3.name AS tag3, " +
                                                          "Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, " +
                                                          "Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10, " +
                                                          "Ingredient11, Ingredient12, Ingredient13, Ingredient14, Ingredient15 " +
                                                          "FROM senf22g7.recipe " +
                                                          "LEFT JOIN senf22g7.user ON recipe.postedByUser = user.userID " +
                                                          "LEFT JOIN senf22g7.tag T1 ON recipe.tag1 = T1.tagID " +
                                                          "LEFT JOIN senf22g7.tag T2 ON recipe.tag2 = T2.tagID " +
                                                          "LEFT JOIN senf22g7.tag T3 ON recipe.tag2 = T3.tagID WHERE recipeID = @ID order by recipeName", server);

        public RecipeVM()
        {
            ingrIDs = new List<string> { null, null, null, null, null, null, null, null, null, null, null, null, null, null, null };
            ingrIDs.Capacity = 15;

            reviews = null;
        }

        /* Grab single Recipe from database using recipeID */
        public RecipeVM(int id)
        {
            ingrIDs = new List<string>();
            ingrIDs.Capacity = 15;

            detail_cmd.Parameters.AddWithValue("@ID", id);

            server.Open();

            MySqlDataReader rdr = detail_cmd.ExecuteReader();

            try
            {
                if (rdr.Read())
                {
                    recipeID = id; //rdr.GetInt32(0);
                    recipeName = rdr.GetString(1);

                    if (!rdr.IsDBNull(2))
                        postedByuser = rdr.GetInt32(2);
                    if (!rdr.IsDBNull(3))
                        creator = rdr.GetString(3);
                    if (!rdr.IsDBNull(4))
                        datePosted = rdr.GetString(4);

                    description = rdr.GetString(5);
                    directions = rdr.GetString(6);

                    if (!rdr.IsDBNull(7))
                        tag1 = rdr.GetString(7);
                    if (!rdr.IsDBNull(8))
                        tag2 = rdr.GetString(8);
                    if (!rdr.IsDBNull(9))
                        tag3 = rdr.GetString(9);

                    for (int i = 0; i < 15; i++)
                    {
                        if (rdr.IsDBNull(i + 10))
                            ingrIDs.Add("");
                        else
                            ingrIDs.Add(rdr.GetString(i + 10));
                    }
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
                detail_cmd.Parameters.Clear();
            }

            reviews = review.GetAllReviews(id);
        }

        /* GetAllRecipes - Get all the recipes in the database */
        public static IEnumerable<RecipeVM> GetAllRecipes()
        {
            List<RecipeVM> list = new List<RecipeVM>();

            server.Open();

            MySqlDataReader rdr = list_cmd.ExecuteReader();

            try
            {
                while (rdr.Read())
                {
                    RecipeVM next = ReadRecipe(rdr);

                    list.Add(next);
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
            }

            return (list);
        }

        public static IEnumerable<RecipeVM> GetRecipes(string str_cmd)
        {
            List<RecipeVM> list = new List<RecipeVM>();

            server.Open();

            MySqlCommand cmd = new MySqlCommand(str_cmd, server);

            MySqlDataReader rdr = cmd.ExecuteReader();

            try
            {
                while (rdr.Read())
                {
                    RecipeVM next = ReadRecipe(rdr);

                    list.Add(next);
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
            }

            return (list);
        }

        /* ReadRecipe() - Reads a recipe from an executed MySqlDataReader (must have executed Read() first) */
        private static RecipeVM ReadRecipe(MySqlDataReader rdr)
        {
            RecipeVM r = new RecipeVM();

            r.recipeID = rdr.GetInt32(0);
            r.recipeName = rdr.GetString(1);

            if (!rdr.IsDBNull(2))
                r.postedByuser = rdr.GetInt32(2);
            if (!rdr.IsDBNull(3))
                r.creator = rdr.GetString(3);
            if (!rdr.IsDBNull(4))
                r.datePosted = rdr.GetString(4);

            r.description = rdr.GetString(5);
            r.directions = rdr.GetString(6);

            //Tags
            if (!rdr.IsDBNull(7))
                r.tag1 = rdr.GetString(7);
            if (!rdr.IsDBNull(8))
                r.tag2 = rdr.GetString(8);
            if (!rdr.IsDBNull(9))
                r.tag3 = rdr.GetString(9);

            //Ingredients
            for (int i = 0; i < 15; i++)
            {
                if (rdr.IsDBNull(i + 10))
                    r.ingrIDs.Add("");
                else
                    r.ingrIDs.Add(rdr.GetString(i + 10));
            }

            return r;
        }
    }
}