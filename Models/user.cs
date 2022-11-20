using System;
using MySql.Data.MySqlClient;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace RapidChef.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class user
    {
        
        public int userID { get; set; }

        [Required]
        [StringLength(45)]
        [DisplayName("First Name")]
        public string firstname { get; set; }

        [Required]
        [StringLength(45)]
        [DisplayName("Last Name")]
        public string lastname { get; set; }

        [Required]
        [StringLength(100)]
        public string email { get; set; }

        [Required]
        [StringLength(45)]
        public string password { get; set; }

        [StringLength(45)]
        public string status { get; set; }

        [DisplayName("User Type")]
        public string user_type { get; set; }

        [DisplayName("Registration Date")]
        public string registrationDate { get; set; }

        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                                    "pwd=Sce7269680!!; database=senf22g7");

        static MySqlCommand list_cmd = new MySqlCommand("SELECT * FROM senf22g7.user", server);
        static MySqlCommand detail_cmd = new MySqlCommand("SELECT * FROM senf22g7.user WHERE userID = @ID", server);

        public user()
        {

        }

        public user(int id)
        {
            detail_cmd.Parameters.AddWithValue("@ID", id);

            server.Open();

            MySqlDataReader rdr = detail_cmd.ExecuteReader();

            try
            {
                if (rdr.Read())
                {
                    userID = id; //rdr.GetInt32(0);
                    firstname = rdr.GetString(1);
                    lastname = rdr.GetString(2);
                    email = rdr.GetString(3);
                    password = rdr.GetString(4);

                    if (!rdr.IsDBNull(5))
                        status = rdr.GetString(5);
                    if (!rdr.IsDBNull(6))
                        user_type = rdr.GetString(6);
                    if (!rdr.IsDBNull(7))
                        registrationDate = rdr.GetString(7);
                }
            }
            finally
            {
                rdr.Close();
                server.Close();
                detail_cmd.Parameters.Clear();
            }
        }
    }
}
