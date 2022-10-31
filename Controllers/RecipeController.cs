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
            System.Diagnostics.Debug.WriteLine("Validating Recipe...");

            /* Validate the uploaded Recipe Object */
            try
            {
                TryUpdateModel<Recipe>(newRecipe);

                if (!ModelState.IsValid)
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(newRecipe);
                }

                System.Diagnostics.Debug.WriteLine("Success; Uploading to Database...");

                /* Upload the Recipe to the database */
                if (newRecipe.UploadRecipe())
                {
                    /* Grab the new recipe's ID number */
                    //int id = 0;

                    System.Diagnostics.Debug.WriteLine("Success; Returning View...");

                    return RedirectToAction("Index"); //("Details", id);
                }
                else /* Uploading Failed */
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(newRecipe);
                }
            }
            catch (Exception ex)
            {
                // Post the exception error to the form
                ViewBag.Exception = ex.Message;

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
