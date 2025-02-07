using System;
using System.Windows;

namespace TourCompany
{
    public partial class AddTourWindow : Window
    {
        private TourCompanyContext _context;

        public AddTourWindow(TourCompanyContext context)
        {
            InitializeComponent();
            _context = context;
        }

        private void AddTour_Click(object sender, RoutedEventArgs e)
        {
            var tour = new Tour
            {
                Country = CountryBox.Text,
                Climate = ClimateBox.Text,
                HotelClass = int.Parse(HotelClassBox.Text),
                Duration = int.Parse(DurationBox.Text),
                Price = decimal.Parse(PriceBox.Text)
            };

            _context.Tours.Add(tour);
            _context.SaveChanges();
            MessageBox.Show("Путёвка добавлена!");

            this.Close();
        }
    }
}
