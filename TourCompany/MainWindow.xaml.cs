using System;
using System.Linq;
using System.Windows;
using Microsoft.EntityFrameworkCore;

namespace TourCompany
{
    public partial class MainWindow : Window
    {
        private TourCompanyContext _context = new TourCompanyContext();

        public MainWindow()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            _context.Clients.Load();
            _context.Tours.Load();
            _context.Sales.Load();

            ClientsGrid.ItemsSource = _context.Clients.Local.ToBindingList();
            ToursGrid.ItemsSource = _context.Tours.Local.ToBindingList();
            SalesGrid.ItemsSource = _context.Sales
                .Include(s => s.Client)
                .Include(s => s.Tour) 
                .ToList();
        }

        private void AddClient_Click(object sender, RoutedEventArgs e)
        {
            var client = new Client
            {
                LastName = "Иванов",
                FirstName = "Иван",
                MiddleName = "Иванович",
                Address = "Москва, ул. Ленина 1",
                Phone = "123-456-789"
            };

            _context.Clients.Add(client);
            _context.SaveChanges();
            MessageBox.Show("Клиент добавлен");
            LoadData();
        }

        private void DeleteClient_Click(object sender, RoutedEventArgs e)
        {
            if (ClientsGrid.SelectedItem is Client selectedClient)
            {
                _context.Clients.Remove(selectedClient);
                _context.SaveChanges();
                LoadData();
            }
        }

        private void BuyTour_Click(object sender, RoutedEventArgs e)
        {
            if (ClientsGrid.SelectedItem is Client selectedClient && ToursGrid.SelectedItem is Tour selectedTour)
            {
                decimal discount = Math.Round(selectedTour.Price * 0.1m, 2);
                decimal finalPrice = Math.Round(selectedTour.Price - discount, 2);

                var sale = new Sale
                {
                    ClientID = selectedClient.ID,
                    TourID = selectedTour.ID,
                    SaleDate = DateTime.Now,
                    Discount = discount,
                    TotalPrice = finalPrice
                };

                _context.Sales.Add(sale);
                _context.SaveChanges();
                MessageBox.Show("Продажа успешна!");
                LoadData();
            }
        }

        private void UpdateDiscount_Click(object sender, RoutedEventArgs e)
        {
            if (SalesGrid.SelectedItem is Sale selectedSale)
            {
                var newDiscount = Math.Round(selectedSale.TotalPrice * 0.05m, 2);
                selectedSale.Discount = newDiscount;
                selectedSale.TotalPrice = Math.Round(selectedSale.TotalPrice - newDiscount, 2);

                _context.Sales.Update(selectedSale);
                _context.SaveChanges();
                MessageBox.Show("Скидка обновлена!");
                LoadData();
            }
        }
        private void OpenAddClientWindow(object sender, RoutedEventArgs e)
        {
            var addClientWindow = new AddClientWindow(_context);
            addClientWindow.ShowDialog();
            LoadData();
        }

        private void OpenAddTourWindow(object sender, RoutedEventArgs e)
        {
            var addTourWindow = new AddTourWindow(_context);
            addTourWindow.ShowDialog();
            LoadData();
        }

        private void OpenAddDiscountWindow(object sender, RoutedEventArgs e)
        {
            var addDiscountWindow = new AddDiscountWindow(_context);
            addDiscountWindow.ShowDialog();
            LoadData();
        }


    }
}
