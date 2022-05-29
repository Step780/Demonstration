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

namespace TkaniPrep.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductEdit.xaml
    /// </summary>
    public partial class ProductEdit : Page
    {
        Products Products = new Products();

        public ProductEdit(Products products)
        {
           
            InitializeComponent();
            if (products != null)
            {
                Products = products;
            }
            
                DataContext = Products;
           
            orderBox.ItemsSource = TkaniBaseEntities.GetContext().Orders.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Products products = new Products()
            //{

            //    Name = nameBox.Text,
            //    Cost = Convert.ToInt32(costBox.Text),
            //    ID_Order = Convert.ToInt32(orderBox.SelectedValue)
            //};
            if (Products.Product_ID == 0)
            {
                TkaniBaseEntities.GetContext().Products.Add(Products);
            }

            TkaniBaseEntities.GetContext().SaveChanges();
            MainWindow.mainFrame.Navigate(new ProductPage());
        }
    }
}
