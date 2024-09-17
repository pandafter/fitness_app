using Microsoft.AspNetCore.Mvc;
using fitnessapi.Models;
using System.Collections.Generic;
using System.Drawing; // Para ColorTranslator

namespace fitnessapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FitnessDataController : ControllerBase
    {
        [HttpGet("popular-diets")]
        public ActionResult<IEnumerable<PopularDietsModel>> GetPopularDiets()
        {
            var popularDiets = new List<PopularDietsModel>
            {
                new PopularDietsModel
                {
                    Name = "Blueberry Pancake",
                    IconPath = "assets/icons/blueberry-pancake.svg",
                    Level = "Medium",
                    Duration = "30 mins",
                    Calorie = "230 kCal",
                    BoxIsSelected = true
                },
                new PopularDietsModel
                {
                    Name = "Salmon Nigiri",
                    IconPath = "assets/icons/salmon-nigiri.svg",
                    Level = "Easy",
                    Duration = "20 mins",
                    Calorie = "120 kCal",
                    BoxIsSelected = false
                },
                new PopularDietsModel
                {
                    Name = "Honey Pancakes",
                    IconPath = "assets/icons/honey-pancakes.svg",
                    Level = "Easy",
                    Duration = "30 mins",
                    Calorie = "180 kCal",
                    BoxIsSelected = false
                }
                
            };
            return Ok(popularDiets);
        }

        [HttpGet("diets")]
        public ActionResult<IEnumerable<DietModel>> GetDiets()
        {
            var diets = new List<DietModel>
            {
                new DietModel
                {
                    Name = "Honey Pancakes",
                    IconPath = "assets/icons/honey-pancakes.svg",
                    Level = "Easy",
                    Duration = "30 mins",
                    Calorie = "180 kCal",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(253, 180, 146)), // Solo RGB
                    ViewIsSelected = true
                },
                new DietModel
                {
                    Name = "Canai Bread",
                    IconPath = "assets/icons/canai-bread.svg",
                    Level = "Easy",
                    Duration = "20 mins",
                    Calorie = "230 kCal",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(251, 146, 253)), // Solo RGB
                    ViewIsSelected = false
                },
                new DietModel
                {
                    Name = "Strawberrie Pancakes",
                    IconPath = "assets/icons/honey-pancakes.svg",
                    Level = "Easy",
                    Duration = "30 mins",
                    Calorie = "180 kCal",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(146, 163, 253)), // Solo RGB
                    ViewIsSelected = false
                }
                
            };
            return Ok(diets);
        }

        [HttpGet("categories")]
        public ActionResult<IEnumerable<CategoryModel>> GetCategories()
        {
            var categories = new List<CategoryModel>
            {
                new CategoryModel
                {
                    Name = "Salad",
                    IconPath = "assets/icons/plate.svg",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(146, 163, 253)) // Solo RGB
                },
                new CategoryModel
                {
                    Name = "Cake",
                    IconPath = "assets/icons/pancakes.svg",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(214, 146, 253)) // Solo RGB
                },
                new CategoryModel
                {
                    Name = "Pie",
                    IconPath = "assets/icons/pie.svg",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(251, 243, 146)) // Solo RGB
                },
                new CategoryModel
                {
                    Name = "Smoothies",
                    IconPath = "assets/icons/orange-snacks.svg",
                    BoxColor = ColorTranslator.ToHtml(Color.FromArgb(148, 253, 146)) // Solo RGB
                }
            };
            return Ok(categories);
        }
    }
}
