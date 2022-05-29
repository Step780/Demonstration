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
    /// Логика взаимодействия для Enter.xaml
    /// </summary>
    public partial class Enter : Page
    {
        List<Users> users = new List<Users>();
        public int role;
        public Enter()
        {
            InitializeComponent();
        }

        private void enterBtn_Click(object sender, RoutedEventArgs e)
        {
            users = TkaniBaseEntities.GetContext().Users.Where(x => x.Login == loginBox.Text && x.Password == passwordBox.Text).ToList();

            if (users != null)
            {
                role = users[0].ID_Role;
                MainWindow.mainFrame.Navigate(new AllTables(role));
            }
            else
            {

            }
        }
    }
}
