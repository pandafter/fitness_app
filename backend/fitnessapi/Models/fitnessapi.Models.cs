namespace fitnessapi.Models
{
    public class PopularDietsModel
    {
        public string?  Name { get; set; }
        public string? IconPath { get; set; }
        public string? Level { get; set; }
        public string? Duration { get; set; }
        public string? Calorie { get; set; }
        public bool BoxIsSelected { get; set; }
    }

    public class DietModel
    {
        public string? Name { get; set; }
        public string? IconPath { get; set; }
        public string? Level { get; set; }
        public string? Duration { get; set; }
        public string? Calorie { get; set; }
        public string? BoxColor { get; set; }
        public bool ViewIsSelected { get; set; }
    }

    public class CategoryModel
    {
        public string? Name { get; set; }
        public string? IconPath { get; set; }
        public string? BoxColor { get; set; }
    }
}
