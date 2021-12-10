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
    /// Interaction logic for ChaufferKopelen.xaml
    /// </summary>
    public partial class ChaufferKopelen : Window
    {
        taxidb taxidb = new taxidb();
        public ChaufferKopelen()
        {
            InitializeComponent();
            UpdateChauffeurs();
            UpdateAanvragen();
        }

        private void UpdateAanvragen()
        {
            cmbAanvraag.ItemsSource = taxidb.getAanvraag().DefaultView;
            cmbAanvraag.DisplayMemberPath = "gebruikersnaam";
            cmbAanvraag.SelectedValuePath = "id";
        }

        private void UpdateChauffeurs()
        {
            cmbChauffeur.ItemsSource = taxidb.getFreeChauffeur().DefaultView;
            cmbChauffeur.DisplayMemberPath = "naam";
            cmbChauffeur.SelectedValuePath = "id";
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void CmbAanvraag_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(cmbAanvraag.SelectedItem != null)
            {
                DataRowView aanvraag = (DataRowView)cmbAanvraag.SelectedItem;

                txtAantalPassagiers.Text = aanvraag["passagiers"].ToString();
                txtDatumTijd.Text = aanvraag["datum_tijd"].ToString();
                txtEmail.Text = aanvraag["email"].ToString();
                txtLaadruimte.Text = aanvraag["minimale_laadruimte"].ToString();
                txtTelefoon.Text = aanvraag["mobiel"].ToString();
            }
            
        }

        private void BtnKoppel_Click(object sender, RoutedEventArgs e)
        {
            if(cmbAanvraag.SelectedItem != null && cmbChauffeur.SelectedItem != null)
            {
                try
                {
                    DataRowView aanvraag = (DataRowView)cmbAanvraag.SelectedItem;
                    DataRowView chauffeur = (DataRowView)cmbChauffeur.SelectedItem;

                    taxidb.UpdateAanvraag((int)chauffeur["id"], aanvraag["gebruikersnaam"].ToString(), 1);
                    taxidb.UpdateFreeChauffeur((int)chauffeur["id"]);
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
                    UpdateAanvragen();
                    UpdateChauffeurs();
                }
                

            }
            else if(cmbAanvraag.SelectedItem == null)
            {
                MessageBox.Show("Selecteer een aanvraag.", "Geen selectie", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                MessageBox.Show("Selecteer een chauffeur.", "Geen selectie", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
