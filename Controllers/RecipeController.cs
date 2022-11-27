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
        public ActionResult Index()
        {
            ViewBag.Title = "Recipes";

            return View(RecipeVM.GetAllRecipes());
        }

        // GET: Recipe/Results
        public ActionResult Results()
        {
            if (Session["cond"] != null)
            {
                string cmd_cond = Session["cond"].ToString();
                //Session.Remove("cmd");

                if (!string.IsNullOrEmpty(cmd_cond))
                    return View(RecipeVM.GetRecipes(cmd_cond));
            }

            // TODO: Return an error if we get here
            return View("Index");
        }

        // GET: Recipe/Details/5
        public ActionResult Details(int id)
        {
            RecipeVM recipe = new RecipeVM(id);
            ViewBag.Title = recipe.recipeName;

            return View(recipe);
        }

        // GET: Recipe/Create
        public ActionResult Create()
        {
            ViewBag.Title = "Create Recipe";

            return View();
        }

        // POST: Recipe/Create
        [HttpPost]
        public ActionResult Create(Recipe newRecipe)
        {
            ViewBag.Title = "Create Recipe";

            /* Get postedByuser if logged in (using session variables) */
            if (Session["userID"] != null)
                newRecipe.postedByuser = (int?)Session["userID"];

            /* Validate the uploaded Recipe Object */
            System.Diagnostics.Debug.WriteLine("Validating Recipe...");

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
            ViewBag.Title = "Edit Recipe";

            return View(new Recipe(id));
        }

        // POST: Recipe/Edit/5
        [HttpPost]
        public ActionResult Edit(Recipe recipe)
        {
            ViewBag.Title = "Edit Recipe";

            System.Diagnostics.Debug.WriteLine("Validating Recipe...");

            try
            {
                TryUpdateModel<Recipe>(recipe);

                if (!ModelState.IsValid)
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(recipe);
                }

                System.Diagnostics.Debug.WriteLine("Success; Updating the Database...");

                /* Does HTML.ErrorFor have functionality to detect when an item has been changed? */

                /* Upload the Recipe to the database */
                if (recipe.UpdateRecipe())
                {
                    System.Diagnostics.Debug.WriteLine("Success; Returning View...");

                    return RedirectToAction("Details", new { id=recipe.recipeID });
                }
                else /* Uploading Failed */
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(recipe);
                }
            }
            catch (Exception ex)
            {
                // Post the exception error to the form
                ViewBag.Exception = ex.Message;

                return View(recipe);
            }
        }

        // GET: Recipe/Delete/5
        public ActionResult Delete(int id)
        {
            ViewBag.Title = "Delete Recipe";

            return View(new Recipe(id));
        }

        // POST: Recipe/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            ViewBag.Title = "Delete Recipe";

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

        protected void btnLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("AI Recipe R");
        }

        [HttpGet]
        public JsonResult VerifyIngredient(List<string> ingrIDs)
        {
            //MySqlConnection server = Recipe.server;
            foreach (string ingr in ingrIDs)
            {
                if (!string.IsNullOrEmpty(ingr))
                    return Json(true);
            }

            return Json("At least one ingredient is required."); //(false);
        }
    }
}
