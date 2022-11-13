using System;
using System.Collections.Generic;
using System.Linq;

using System.Web;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Threading.Tasks;

namespace RapidChef.Models
{
    public static class ApiProcessor
    {
        public static async Task<string> LoadComic(String ingredients)
        {
            HttpClient client = new HttpClient();

            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, "https://lga7d2j3bbzakctb.us-east-1.aws.endpoints.huggingface.cloud");

            request.Headers.Add("Authorization", "Bearer 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");

            request.Content = new StringContent("{\"inputs\": \"" + ingredients + "\"}");
            request.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            HttpResponseMessage response = await client.SendAsync(request);
            response.EnsureSuccessStatusCode();
            string recepie = await response.Content.ReadAsStringAsync();

            return recepie;
        }

        internal static Task<string> LoadComic(Func<string> toString)
        {
            throw new NotImplementedException();
        }
    }
}