using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using RapidChef.Models;

namespace RapidChef.Controllers
{
    public class RecipeController : Controller
    {
        private static MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
                                                             "pwd=Sce7269680!!; database=senf22g7");
        //private string SQLConnectStr = "";

        // GET: Recipe
        MySqlCommand list_cmd = new MySqlCommand("SELECT * FROM recipe", server);

        public string Index() // ActionResult Index()
        {
            string output = "";

            try
            {
                server.Open();

                // When do I need this?
                //MySqlTransaction transaction = server.BeginTransaction();
                //list_cmd.Transaction = transaction;

                // Recieve the contents
                MySqlDataReader rdr = list_cmd.ExecuteReader();
                
                //Convert output to a Recipe Object
                while (rdr.Read() )
                {
                    output += rdr[0] + " " + rdr[1] + " " + rdr[2] + " " + rdr[3] + "\n";
                }

                rdr.Close();
            }
            catch (MySqlException ex)
            {
                output = ex.Message;
                // Do we have a webpage for errors?
            }
            finally
            {
                server.Close();
            }

            return output;
            //return View();
        }

        // GET: Recipe/Details/5
        MySqlCommand detail_cmd = new MySqlCommand("SELECT * FROM recipe WHERE recipeID = @ID", server);

        public string Details(int id) // ActionResult Details(int id)
        {
            detail_cmd.Parameters.AddWithValue("@ID", id);

            string output = "";

            try
            {
                server.Open();

                // When do I need this?
                //MySqlTransaction transaction = server.BeginTransaction();
                //list_cmd.Transaction = transaction;

                // Recieve the contents
                MySqlDataReader rdr = detail_cmd.ExecuteReader();

                //Convert output to a Recipe Object
                while (rdr.Read())
                {
                    output += rdr[0] + " " + rdr[1] + " " + rdr[2] + " " + rdr[3] + "\n";
                }

                rdr.Close();
            }
            catch (MySqlException ex)
            {
                output = ex.Message;
                // Do we have a webpage for errors?
            }
            finally
            {
                server.Close();
            }

            return output;
            //return View();
        }

        // GET: Recipe/Create
        MySqlCommand create_cmd; /* Work In Progress */

        public ActionResult Create()
        {
            return View();
        }

        // POST: Recipe/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                // Add an extra warning message
                return View();
            }
        }

        // GET: Recipe/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Recipe/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Recipe/Delete/5
        MySqlCommand delete_cmd; /* Work In Progress */

        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Recipe/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
