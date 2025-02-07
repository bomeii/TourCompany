using Microsoft.EntityFrameworkCore;
using MySqlX.XDevAPI;

public class TourCompanyContext : DbContext
{
    public DbSet<Client> Clients { get; set; }
    public DbSet<Tour> Tours { get; set; }
    public DbSet<Sale> Sales { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseMySql("server=localhost;database=TourCompany;user=root;password=",
            new MySqlServerVersion(new Version(8, 0, 30)));
    }
}
