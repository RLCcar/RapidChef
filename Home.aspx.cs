using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class Home : System.Web.UI.Page
    {
		static ListItemCollection selectItems;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		// Can we port this code to Recipe Controller, and just pass a list of ingredients in Session?
		public string queryConcat(ListItemCollection list)
		{
			ListItemCollection selectedItems = new ListItemCollection();

			// itemCount number of the selected items in the list
			// and idx to control the loop
			int itemCount = 0;
			int idx = 0;
			String ingr = "";

			// Count items selected within the list
			foreach (ListItem item in list)
			{
				if (item.Selected == true)
				{
					itemCount += 1;
					if (ingr.Equals(""))
					{
						ingr = item.Text;
					}
					else
					{
						ingr = ingr + ", " + item.Text;
					}
				}
			}
			Session["ingr"] = ingr;
			string SelectCommand = "SELECT * FROM senf22g7.recipe";

			// Base case
			if (list.Count > 0)
			{
				// Iterate through selected items and add it to the string
				foreach (ListItem item in list)
				{
					#region Shawn's Old Method (Unused)
					//if (idx == 0)
					//{
					//    SelectCommand += " WHERE (ingredients = '" + item.Text + "')";
					//}
					//else if (idx < itemCount)
					//{
					//    SelectCommand += " OR (ingredients = '" + item.Text + "')";
					//}
					//else
					//{
					//    SelectCommand += item.Text;
					//}
					#endregion

					#region Ryan's Intended Method (Unused)
					//This code can only used if we can create the "has_ingredient()" command
					//if (idx == 0)
					//{
					//    SelectCommand += " WHERE (has_ingredient('" + item.Text + "', recipeID))";
					//}
					//else
					//{
					//    SelectCommand += " OR (has_ingredient('" + item.Text + "', recipeID))";
					//}
					#endregion

					#region Vlada's Method
					if (idx == 0)
					{
						SelectCommand += " WHERE ('" + item.Text + "' IN (Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, " +
									 "Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10, Ingredient11, " +
									 "Ingredient12, Ingredient13, Ingredient14, Ingredient15))";
					}
					else
					{
						SelectCommand += " OR ('" + item.Text + "' IN (Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, " +
									 "Ingredient6, Ingredient7, Ingredient8, Ingredient9, Ingredient10, Ingredient11, " +
									 "Ingredient12, Ingredient13, Ingredient14, Ingredient15))";
					}
					#endregion

					idx++;
				}
			}
			SelectCommand += " LIMIT 3;";

			//Label1.Text = SelectCommand;
			return SelectCommand;
		}

		protected void Label1_DataBinding(object sender, EventArgs e)
		{

		}

		public IEnumerator GetEnumerator()
		{
			throw new NotImplementedException();
		}

		// Collect the ingredients from CheckBoxLists into a single ListItemCollection
		protected void Button1_Click1(object sender, EventArgs e)
		{

			ListItemCollection meats = CheckBoxList1.Items;
			ListItemCollection plants = CheckBoxList2.Items;
			ListItemCollection fruit = CheckBoxList3.Items;
			ListItemCollection dairy = CheckBoxList4.Items;
			ListItemCollection grain = CheckBoxList5.Items;
			ListItemCollection spice = CheckBoxList6.Items;
			ListItemCollection other = CheckBoxList7.Items;

			// These lists are not implemented yet
			//ListItemCollection starches = CheckBoxList3.Items;


			selectItems = new ListItemCollection();

			foreach (ListItem item in meats)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in plants)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in fruit)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in dairy)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in grain)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in spice)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			foreach (ListItem item in other)
			{
				if (item.Selected == true)
					selectItems.Add(item);
			}
			// These lists are not implemented yet
			//foreach(ListItem item in starches)
			//{
			//	selectItems.Add(item);
			//}

			Session["cmd"] = queryConcat(selectItems);

			Response.RedirectToRoute(new { controller = "Recipe", action = "Results" });
		}
	}
}