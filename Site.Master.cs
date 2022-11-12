using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace RapidChef
{
    public partial class SiteMaster : MasterPage
    {

        private static string Thisemail;
        private static string Thispassword;
        private static int userID;
        private static string userName = "nope";
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Thisemail = TextBox1.Text;
            Thispassword = TextBox2.Text;
            getdata();
            TextBox1.Visible = false;
            TextBox2.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Text = userName;
            Button3.Visible = true;



        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void getdata()
        {
            MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" + "pwd=Sce7269680!!; database=senf22g7");
            MySqlCommand cmd = new MySqlCommand("SELECT userID, firstname FROM senf22g7.user where email = '" + Thisemail + "' and password = '" + Thispassword + "'");
            cmd.CommandType = CommandType.Text;
            cmd.Connection = server;
            server.Open();

            try
            {

                MySqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!(dr.Read()))
                {
                    MessageBox.Show("Invalid email/password");
                }
                else
                {
                    dr.Read();
                    userID = dr.GetInt32("userID");
                    userName = dr.GetString("firstname");

                    }
                 ///   MessageBox.Show(userName); test
                    dr.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
            finally
            {

                {
                    server.Close();
                }
            }
          
        }
    }
}