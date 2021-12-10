using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for ChauffeurOntkoppel.xaml
    /// </summary>
    public partial class ChauffeurOntkoppel : Window
    {
        taxidb taxidb = new taxidb();
        int ID;

        public ChauffeurOntkoppel()
        {
            InitializeComponent();
            UpdateAanvraag();
        }

        private void UpdateAanvraag()
        {
            cmbAanvraag.ItemsSource = taxidb.getAanvraag2().DefaultView;
            cmbAanvraag.DisplayMemberPath = "gebruikersnaam";
            cmbAanvraag.SelectedValuePath = "id";
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnOntkoppel_Click(object sender, RoutedEventArgs e)
        {
            if(cmbAanvraag.SelectedItem != null)
            {
                try
                {
                    DataRowView aanvraag = (DataRowView)cmbAanvraag.SelectedItem;
                    taxidb.OntkoppelChauffeur(ID);
                    taxidb.UpdateChauffeur((int)aanvraag["chauffeur_id"]);
                }
                catch (Exception)
                {
                    MessageBox.Show("Er is iets fout gegaan", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                finally
                {
                    txtAantalPassagiers.Text = "";
                    txtDatumTijd.Text = "";
                    txtEmail.Text = "";
                    txtLaadruimte.Text = "";
                    txtTelefoon.Text = "";
                    cmbAanvraag.SelectedValue = null;
                    UpdateAanvraag();
                }
            }
            else
            {
                MessageBox.Show("Maak eerst een selectie.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
            
            
        }

        private void CmbAanvraag_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataRowView aanvraag = (DataRowView)cmbAanvraag.SelectedItem;

            if(cmbAanvraag.SelectedItem != null)
            {
                txtAantalPassagiers.Text = aanvraag["passagiers"].ToString();
                txtDatumTijd.Text = aanvraag["datum_tijd"].ToString();
                txtEmail.Text = aanvraag["email"].ToString();
                txtLaadruimte.Text = aanvraag["minimale_laadruimte"].ToString();
                txtTelefoon.Text = aanvraag["mobiel"].ToString();
                cmbChauffeur.ItemsSource = aanvraag["chauffeur_id"].ToString();
                ID = (int)aanvraag["id"];
            }
            
        }
    }
}
