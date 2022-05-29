using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TkaniPrep.Pages;

namespace TkaniPrep
{
    /// <summary>
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        Products products = new Products();

        public ProductPage()
        {
            InitializeComponent();

            productsGrid.ItemsSource = TkaniBaseEntities.GetContext().Products.ToList<Products>();

        }

        private void removeBtn_Click(object sender, RoutedEventArgs e)
        {

            TkaniBaseEntities.GetContext().Products.Remove((sender as Button).DataContext as Products);
            TkaniBaseEntities.GetContext().SaveChanges();
            productsGrid.ItemsSource = TkaniBaseEntities.GetContext().Products.ToList<Products>();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.mainFrame.Navigate(new ProductEdit(null));
        }

        private void editBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.mainFrame.Navigate(new ProductEdit((sender as Button).DataContext as Products));

        }
    }
}
