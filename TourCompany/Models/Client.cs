using System.ComponentModel.DataAnnotations;

public class Client
{
    [Key]
    public int ID { get; set; }

    [Required]
    public string LastName { get; set; }

    [Required]
    public string FirstName { get; set; }

    public string MiddleName { get; set; }
    public string Address { get; set; }

    [Required]
    public string Phone { get; set; }
}
