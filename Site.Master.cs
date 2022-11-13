using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Microsoft.SqlServer.Management.XEvent;
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
            if (Session["userID"] != null && Session["userName"] != null)
            {
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                Button1.Visible = false;
                Button2.Visible = false;
                Button3.Text = userName;
                Button3.Visible = true;
                Button4.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session ses = new Session();
            Thisemail = TextBox1.Text;
            Thispassword = TextBox2.Text;
            getdata();

            Session["userID"] = userID;
            Session["userName"] = userName;
            //Session["TextBox1"] = TextBox1;
            //Session["TextBox2"] = TextBox2;
            //Session["Label1"] = Label1;
            //Session["Label2"] = Label2;
            //Session["Button1"] = Button1;
            //Session["Button2"] = Button2;
            //Session["Button3"] = Button3;
            //Session["Button4"] = Button4;

            TextBox1.Visible = false;
            TextBox2.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = true;
            Button4.Visible = true;

            Button3.Text = userName;
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
            MySqlCommand cmd = new MySqlCommand("SELECT userID, firstname FROM senf22g7.user where email = @Thisemail and password = @Thispassword");
            // Add email and password variables (prevents SQL injection)
            cmd.Parameters.AddWithValue("@Thisemail", Thisemail);
            cmd.Parameters.AddWithValue("@Thispassword", Thispassword);
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
                server.Close();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            try
            {
                Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Buffer = true;
                Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                Response.Expires = -1000;
                Response.CacheControl = "no-cache";
                //Response.Redirect("login.aspx", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Button1.Visible = true;
            Button2.Visible = true;
            Button3.Visible = false;
            Button4.Visible = false;

            Button3.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";

            //Remove user variables; otherwise, the website will think we're still logged in
            Session.Remove("userID");
            Session.Remove("userName");
        }
    }
}