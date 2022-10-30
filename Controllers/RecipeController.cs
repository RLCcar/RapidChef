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
            return View(new Recipe(id));
        }

        // GET: Recipe/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Recipe/Create
        [HttpPost]
        public ActionResult Create(Recipe newRecipe)
        {
            System.Diagnostics.Debug.WriteLine("Beginning Try");

            /* TODO: Create the Recipe Object (to hold FormCollection contents??) */
            //Recipe newRecipe = new Recipe(collection);

            try
            {
                TryUpdateModel<Recipe>(newRecipe);

                if (!ModelState.IsValid)
                {
                    System.Diagnostics.Debug.WriteLine("Failed; Returning View");
                    return View(newRecipe);
                }

                System.Diagnostics.Debug.WriteLine("Validated; Adding to Database");

                /* Add the Recipe to the database */
                newRecipe.AddRecipe();

                /* Grab the new recipe's ID number */

                return RedirectToAction("Details"); /* Include the new recipe ID (How?) */
            }
            catch
            {
                // Add an extra warning message
                System.Diagnostics.Debug.WriteLine("ERROR: An exception occurred!");
                return View(newRecipe);
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
            return View(new Recipe(id));
        }

        // POST: Recipe/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Recipe.DeleteRecipe(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View(id);
            }
        }

        //public ActionResult VerifyIngredient(string[] ingrIDs)
        //{
        //    //MySqlConnection server = new MySqlConnection("server=dcm.uhcl.edu; uid=senf22g7;" +
        //    //                                             "pwd=Sce7269680!!; database=senf22g7");
        //    int cnt = 0;
        //    foreach (string ingr in ingrIDs)
        //    {
        //        cnt++;
        //    }

        //    if (cnt < 3)
        //        return Json("You need at least 3 ingredients in the recipe");
        //    else
        //        return Json(true);
        //}
    }
}
