using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;

namespace RapidChef.Models
{
    public static class ApiHelper
    {
        public static HttpClient ApiClient { get; set; }

        public static void InitializeClient()
        {
            ApiClient = new HttpClient();
            ApiClient.BaseAddress = new Uri("https://lga7d2j3bbzakctb.us-east-1.aws.endpoints.huggingface.cloud");
            ApiClient.DefaultRequestHeaders.Accept.Clear();
            ApiClient.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("applicaltion/json"));
        }
    }
}