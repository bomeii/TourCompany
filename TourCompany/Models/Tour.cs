using System.ComponentModel.DataAnnotations;

public class Tour
{
    [Key]
    public int ID { get; set; }

    [Required]
    public string Country { get; set; }

    public string Climate { get; set; }

    [Range(1, 5)]
    public int HotelClass { get; set; }

    [Required]
    public int Duration { get; set; }

    [Required]
    public decimal Price { get; set; }
}
