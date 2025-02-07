using System;
using System.Windows;

namespace TourCompany
{
    public partial class AddClientWindow : Window
    {
        private TourCompanyContext _context;

        public AddClientWindow(TourCompanyContext context)
        {
            InitializeComponent();
            _context = context;
        }

        private void AddClient_Click(object sender, RoutedEventArgs e)
        {
            var client = new Client
            {
                LastName = LastNameBox.Text,
                FirstName = FirstNameBox.Text,
                MiddleName = MiddleNameBox.Text,
                Address = AddressBox.Text,
                Phone = PhoneBox.Text
            };

            _context.Clients.Add(client);
            _context.SaveChanges();
            MessageBox.Show("Клиент добавлен!");

            this.Close(); // Закрыть окно после добавления
        }
    }
}
