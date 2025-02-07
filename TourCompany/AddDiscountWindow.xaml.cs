using System.Linq;
using System.Windows;

namespace TourCompany
{
    public partial class AddDiscountWindow : Window
    {
        private TourCompanyContext _context;

        public AddDiscountWindow(TourCompanyContext context)
        {
            InitializeComponent();
            _context = context;
            LoadSales();
        }

        private void LoadSales()
        {
            SalesComboBox.ItemsSource = _context.Sales.ToList();
            SalesComboBox.DisplayMemberPath = "ID";
        }

        private void UpdateDiscount_Click(object sender, RoutedEventArgs e)
        {
            if (SalesComboBox.SelectedItem is Sale selectedSale)
            {
                selectedSale.Discount = decimal.Parse(DiscountBox.Text);
                selectedSale.TotalPrice -= selectedSale.Discount;

                _context.Sales.Update(selectedSale);
                _context.SaveChanges();
                MessageBox.Show("Скидка обновлена!");

                this.Close();
            }
        }
    }
}
