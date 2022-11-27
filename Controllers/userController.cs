using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RapidChef.Models;

namespace RapidChef.Controllers
{
    public class userController : Controller
    {
        // GET: user
        public ActionResult Index()
        {
            return View();
        }

        // GET: user/Details/5
        public ActionResult Details()
        {
            ViewBag.Title = "Account Info";

            if (Session["userID"] == null)
            {
                return RedirectToAction("Register");
            }
            else
            {
                return View(new user((int)Session["userID"]));
            }
        }

        // GET: user/Register
        public ActionResult Register()
        {
            ViewBag.Title = "User Registration";

            return View();
        }

        // POST: user/Register
        [HttpPost]
        public ActionResult Register(user newuser)
        {
            ViewBag.Title = "User Registration";

            /* Validate the uploaded Recipe Object */
            System.Diagnostics.Debug.WriteLine("Validating User...");

            try
            {
                TryUpdateModel<user>(newuser);

                if (!ModelState.IsValid)
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(newuser);
                }

                System.Diagnostics.Debug.WriteLine("Success; Uploading to Database...");

                /* Upload user information to the database */
                if (newuser.register())
                {
                    /* Log in the user */
                    Session["userID"] = newuser.userID;
                    Session["userName"] = newuser.firstname;

                    System.Diagnostics.Debug.WriteLine("Success; Returning to Homepage");

                    return Redirect("~/Home");
                }
                else /* Uploading Failed */
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(newuser);
                }
            }
            catch (Exception ex)
            {
                // Post the exception error to the form
                ViewBag.Exception = ex.Message;
                System.Diagnostics.Debug.WriteLine("Fail; " + ex.Message + "\nReturning to Form...");

                return View(newuser);
            }
        }

        // GET: user/Edit/5
        public ActionResult Edit()
        {
            ViewBag.Title = "Edit User Info";

            if (Session["userID"] == null)
            {
                return RedirectToAction("Register");
            }
            else
            {
                return View(new user((int)Session["userID"]));
            }
        }

        // POST: user/Edit/5
        [HttpPost]
        public ActionResult Edit(user edited)
        {
            ViewBag.Title = "Edit User Info";

            System.Diagnostics.Debug.WriteLine("Validating User...");

            try
            {
                TryUpdateModel<user>(edited);

                if (!ModelState.IsValid)
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(edited);
                }

                System.Diagnostics.Debug.WriteLine("Success; Updating the Database...");

                /* Does HTML.ErrorFor have functionality to detect when an item has been changed? */

                /* Upload the Recipe to the database */
                if (edited.update())
                {
                    System.Diagnostics.Debug.WriteLine("Success; Returning View...");

                    return RedirectToAction("Details");
                }
                else /* Uploading Failed */
                {
                    System.Diagnostics.Debug.WriteLine("Fail; Returning to Form...");

                    return View(edited);
                }
            }
            catch (Exception ex)
            {
                // Post the exception error to the form
                ViewBag.Exception = ex.Message;

                return View(edited);
            }
        }

        // GET: user/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: user/Delete/5
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
