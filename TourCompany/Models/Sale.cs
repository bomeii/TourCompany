using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Sale
{
    [Key]
    public int ID { get; set; }

    [ForeignKey("Client")]
    public int ClientID { get; set; }

    public Client Client { get; set; }

    [ForeignKey("Tour")]
    public int TourID { get; set; }

    public Tour Tour { get; set; }

    [Required]
    public DateTime SaleDate { get; set; }

    public decimal Discount { get; set; } = 0;

    [Required]
    public decimal TotalPrice { get; set; }
}
