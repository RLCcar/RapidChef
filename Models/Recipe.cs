using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RapidChef.Models
{
    public class Recipe
    {
        public int recipeID { get; set; }
        public string recipeName { get; set; }
        public int postedByuser { get; set; }
        public string datePosted { get; set; }
        public string description { get; set; }
        public string directions { get; set; }
        public int tag1 { get; set; }
        public int tag2 { get; set; }
        public int tag3 { get; set; }
        public int ingrID1 { get; set; }
        public int ingrID2 { get; set; }
        public int ingrID3 { get; set; }
        public int ingrID4 { get; set; }
        public int ingrID5 { get; set; }
        public int ingrID6 { get; set; }
        public int ingrID7 { get; set; }
        public int ingrID8 { get; set; }
        public int ingrID9 { get; set; }
        public int ingrID10 { get; set; }
        public int ingrID11 { get; set; }
        public int ingrID12 { get; set; }
        public int ingrID13 { get; set; }
        public int ingrID14 { get; set; }
        public int ingrID15 { get; set; }
    }
}