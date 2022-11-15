// using codenames go here when referencing recipes; should the same be applied here??

namespace RapidChef.Models
{
    using System;
    using System.Collections.Generic;
    using MySql.Data.MySqlClient;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class review
    {
        public int recipeID { get; set; }

        public int userID { get; set; }

        [Required]
        [StringLength(45)]
        public string title { get; set; }

        [StringLength(500)]
        public string content { get; set; }

        [DisplayName("Rating")]
        [Required]
        [Range(1, 5, ErrorMessage = "Value for {0} must be between {1} and {2}.")]
        public int? stars { get; set; } // Nullable<int>
        public int? tagID { get; set; } // Nullable<int>

        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                                    "pwd=Sce7269680!!; database=senf22g7");

        static MySqlCommand list_cmd = new MySqlCommand("SELECT * FROM senf22g7.review WHERE recipeID = @RID", server);
        static MySqlCommand detail_cmd = new MySqlCommand("SELECT * FROM senf22g7.review WHERE recipeID = @RID AND userID = @UID", server);

        public review()
        {

        }

        /* Constructor - Grabs Review from database using recipeID (RID) and userID (UID) */
        public review(int RID, int UID)
        {
            detail_cmd.Parameters.AddWithValue("@RID", RID);
            detail_cmd.Parameters.AddWithValue("@UID", UID);

            server.Open();

            MySqlDataReader rdr = detail_cmd.ExecuteReader();

            try
            {
                if(rdr.Read())
                {
                    recipeID = RID;
                    userID = UID;

                    title = rdr.GetString(2);

                    if (!rdr.IsDBNull(3))
                        content = rdr.GetString(3);

                    stars = rdr.GetInt32(4);

                    if (!rdr.IsDBNull(5))
                        tagID = rdr.GetInt32(5);
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
                detail_cmd.Parameters.Clear();
            }

        }

        /* GetAllRecipes - Get all the recipes in the database */
        public static IEnumerable<review> GetAllReviews(int RID)
        {
            List<review> list = new List<review>();

            list_cmd.Parameters.AddWithValue("@RID", RID);

            server.Open();

            MySqlDataReader rdr = list_cmd.ExecuteReader();

            try
            {
                while (rdr.Read())
                {
                    review next = new review();

                    next.recipeID = RID;

                    next.userID = rdr.GetInt32(1);
                    next.title = rdr.GetString(2);

                    if (!rdr.IsDBNull(3))
                        next.content = rdr.GetString(3);

                    next.stars = rdr.GetInt32(4);

                    if (!rdr.IsDBNull(5))
                        next.tagID = rdr.GetInt32(5);

                    list.Add(next);
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
                detail_cmd.Parameters.Clear();
            }

            return (list);
        }

        public bool PostReview()
        {
            bool uploaded = false;

            string cmd_top = "INSERT INTO senf22g7.review (recipeID, userID, title, stars";
            string cmd_bottom = ") VALUES (@recipeID, @userID, @title, @stars";

            if (!string.IsNullOrEmpty(content))
            {
                cmd_top += ", content";
                cmd_bottom += ", @content";
            }

            if (tagID != null)
            {
                cmd_top += ", tagID";
                cmd_bottom += ", @tagID";
            }

            /* Complete the cmd with parameters */
            MySqlCommand cmd = new MySqlCommand(cmd_top + cmd_bottom + ");", server);

            cmd.Parameters.AddWithValue("@recipeID", recipeID);
            cmd.Parameters.AddWithValue("@userID", userID);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@stars", stars);

            if (!string.IsNullOrEmpty(content))
                cmd.Parameters.AddWithValue("@content", content);

            if (tagID != null)
                cmd.Parameters.AddWithValue("@tagID", tagID);

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

            return uploaded;
        }

        static MySqlCommand edit_cmd = new MySqlCommand("UPDATE senf22g7.review SET title = @title, stars = @stars, content = @content, tagID = @tagID WHERE (recipeID = @RID) AND (userID = @UID)", server);

        public bool UpdateRecipe()
        {
            bool uploaded = false;

            edit_cmd.Parameters.AddWithValue("@title", title);
            edit_cmd.Parameters.AddWithValue("@stars", stars);

            if (string.IsNullOrEmpty(content))
                edit_cmd.Parameters.AddWithValue("@content", DBNull.Value);
            else
                edit_cmd.Parameters.AddWithValue("@content", content);

            if (tagID == null)
                edit_cmd.Parameters.AddWithValue("@tagID", DBNull.Value);
            else
                edit_cmd.Parameters.AddWithValue("@tagID", tagID);

            try
            {
                server.Open();

                int lines = edit_cmd.ExecuteNonQuery();

                if (lines > 0)
                    uploaded = true;
            }
            finally
            {
                server.Close();
                edit_cmd.Parameters.Clear();
            }

            return uploaded;
        }

        static MySqlCommand delete_cmd = new MySqlCommand("DELETE FROM senf22g7.review WHERE recipeID = @RID AND userID = @UID", server);
        public static void DeleteRecipe(int RID, int UID)
        {
            server.Open();

            delete_cmd.Parameters.AddWithValue("@RID", RID);
            delete_cmd.Parameters.AddWithValue("@UID", UID);

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
