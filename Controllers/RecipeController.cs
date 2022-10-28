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
        public ActionResult Index() // string Index()
        {
            return View(Recipe.GetAllRecipes());
        }

        // GET: Recipe/Details/5
        public ActionResult Details(int id)
        {
            Recipe recipe = new Recipe(id);

            return View(recipe);
        }

        // GET: Recipe/Create
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
                if (!ModelState.IsValid)
                {
                    return View(collection);
                }

                /* Create the Recipe Object */

                /* Add the Recipe to the database */

                return RedirectToAction("Details"); /* How to include the new recipe ID? */
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

                return RedirectToAction("Details");
            }
            catch
            {
                return View();
            }
        }

        // GET: Recipe/Delete/5
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

        public ActionResult VerifyIngredient(string[] ingrIDs)
        {
            //MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
            //                                             "pwd=Sce7269680!!; database=senf22g7");
            int cnt = 0;
            foreach (string ingr in ingrIDs)
            {
                cnt++;
            }

            if (cnt < 3)
                return Json("You need at least 3 ingredients in the recipe");
            else
                return Json(true);
        }
    }
}
