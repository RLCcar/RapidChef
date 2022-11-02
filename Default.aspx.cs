using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RapidChef
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		public string queryConcat(ListItemCollection list)
			{

			// Tail string of query
			string words = "";

			ListItemCollection selectedItems = new ListItemCollection();

			// itemCount number of the selected items in the list
			// and idx to control the loop
			int itemCount = 0;
			int idx = 0;

			// Count items selected within the list
			foreach(ListItem item in list)
				{
				if(item.Selected == true)
					{
					itemCount += 1;
					}
				}

			// Base case
			if(itemCount == 0)
				{
				string SelectCommand = "SELECT recipeID FROM senf22g7" + ";";
				Label1.Text = SelectCommand;
				return SelectCommand;
				}
			else
				{
				// Iterate through selected items and add it to the string
				foreach(ListItem item in list)
					{
					if(item.Selected == true)
						{
						if(idx <= itemCount)
							{
							if(idx == 0)
								{
								words = words + " WHERE (ingredients = '" + item.Text;
								}
							else if(idx < itemCount)
								{
								words = words + "') AND (ingredients = '" + item.Text;
								}
							else
								{
								words = words + item.Text;
								}
							}
						idx += 1;
						}
					}
				// Just for on browser debugging to test edge cases of the search button
				string SelectCommand = "SELECT recipeID FROM senf22g7" + words + "');";
				Label1.Text = SelectCommand;
				return SelectCommand;
				}
			}

		protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
			{

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
			// These lists do not exist yet
			/*ListItemCollection starches = CheckBoxList3.Items;
			ListItemCollection dairy = CheckBoxList4.Items;*/

			ListItemCollection allItems = new ListItemCollection();

			foreach(ListItem item in meats)
				{
				allItems.Add(item);
				}
			foreach(ListItem item in plants)
				{
				allItems.Add(item);
				}
			// These lists are not implemented yet
			/*foreach(ListItem item in starches)
				{
				allItems.Add(item);
				}
			foreach(ListItem item in dairy)
				{
				allItems.Add(item);
				}*/

			queryConcat(allItems);

			}
		}
}