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
using System.Windows.Shapes;

namespace Ixat_Taxi
{
    /// <summary>
    /// Interaction logic for MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void BtnAanvraag_Click(object sender, RoutedEventArgs e)
        {
            ChauffeurAanvragenWindowxaml chauffeurAanvragen = new ChauffeurAanvragenWindowxaml();
            chauffeurAanvragen.Show();
        }

        private void BtnKoppel_Click(object sender, RoutedEventArgs e)
        {
            ChaufferKopelen kopelen = new ChaufferKopelen();
            kopelen.Show();
        }

        private void BtnOntkoppel_Click(object sender, RoutedEventArgs e)
        {
            ChauffeurOntkoppel ontkoppel = new ChauffeurOntkoppel();
            ontkoppel.Show();
        }
    }
}
