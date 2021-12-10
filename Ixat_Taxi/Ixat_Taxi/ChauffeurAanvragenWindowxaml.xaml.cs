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
using System.Data;

namespace Ixat_Taxi
{
    /// <summary>
    /// Interaction logic for ChauffeurAanvragenWindowxaml.xaml
    /// </summary>
    public partial class ChauffeurAanvragenWindowxaml : Window
    {
        taxidb taxidb = new taxidb();
        string GebruikersNaam;
        
        public ChauffeurAanvragenWindowxaml()
        {
            InitializeComponent();
            getAanvraag();
        }

        public void getAanvraag()
        {
            cmbAanvraag.ItemsSource = taxidb.NieuweChauffeur().DefaultView;
            cmbAanvraag.DisplayMemberPath = "gebruikersnaam";
            cmbAanvraag.SelectedValuePath = "gebruikersnaam";
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void CmbAanvraag_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(cmbAanvraag.SelectedItem != null)
            {
                DataRowView chauffeur = (DataRowView)cmbAanvraag.SelectedItem;
                DataRow klant = taxidb.getKlant(cmbAanvraag.SelectedValue.ToString());
                DataRow auto = taxidb.getAuto(cmbAanvraag.SelectedValue.ToString());
                DataRow rijbewijs = taxidb.getRijbewijs(cmbAanvraag.SelectedValue.ToString());

                if (chauffeur["gebruikersnaam"].ToString() == klant["gebruikersnaam"].ToString())
                {
                    txtNaam.Text = klant["naam"].ToString();
                    txtMobiel.Text = klant["mobiel"].ToString();
                    txtEmail.Text = klant["email"].ToString();
                    cmbRijbewijs.ItemsSource = rijbewijs["rijbewijs_id"].ToString();
                    txtMerkAuto.Text = auto["merk"].ToString();
                    txtTypeAuto.Text = auto["type"].ToString();
                    txtKenteken.Text = auto["kenteken"].ToString();
                    txtAantalPassagiers.Text = auto["aantal_passagiers"].ToString();
                    txtLaadruimte.Text = auto["laadruimte"].ToString();
                    GebruikersNaam = chauffeur["gebruikersnaam"].ToString();
                }
            }
            
        }

        

        private void BtnAccepteer_Click(object sender, RoutedEventArgs e)
        {
            DataRow auto = taxidb.getAuto(cmbAanvraag.SelectedValue.ToString());
            try
            {
                Random r = new Random();

                double minLong = 51.384682;
                double maxLong = 51.617916;

                double minLat = 4.220087;
                double maxLat = 5.912104;

                var nextLong = r.NextDouble();
                var nextLat = r.NextDouble();
                var randShade = r.Next(1, 15);

                var RandomLong = minLong + (nextLong * (maxLong - minLong));
                var RandomLat = minLat + (nextLat * (maxLat - minLat));

                decimal LongDec = Convert.ToDecimal(RandomLong);
                decimal LatDec = Convert.ToDecimal(RandomLat);

                taxidb.NieuweChauffeur((int)auto["id"], randShade, LongDec, LatDec, 1);

                DataRow chauffeur = taxidb.getChauffeur((int)auto["id"]);


                MessageBoxResult result = MessageBox.Show("Klant is geupdate", "updaten", MessageBoxButton.OK, MessageBoxImage.Information);
                if (result == MessageBoxResult.OK)
                {
                    taxidb.UpdateKlant((int)chauffeur["id"], auto["gebruikersnaam"].ToString());
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Er is iets fout gegaan.","Error",MessageBoxButton.OK,MessageBoxImage.Error);
            }
            finally
            {
                taxidb.DeleteAanvraag(GebruikersNaam);
                txtNaam.Text = "";
                txtMobiel.Text = "";
                txtEmail.Text = "";
                cmbRijbewijs.ItemsSource = null;
                txtMerkAuto.Text = "";
                txtTypeAuto.Text = "";
                txtKenteken.Text = "";
                txtAantalPassagiers.Text = "";
                txtLaadruimte.Text = "";
                cmbAanvraag.SelectedValue = null;
                getAanvraag();
            }
            
            
            
        }

        private void BtnWeiger_Click(object sender, RoutedEventArgs e)
        {
            if(cmbAanvraag.SelectedItem != null)
            {
                DataRow auto = taxidb.getAuto(cmbAanvraag.SelectedValue.ToString());
                taxidb.DeleteAanvraag(GebruikersNaam);
                txtNaam.Text = "";
                txtMobiel.Text = "";
                txtEmail.Text = "";
                cmbRijbewijs.ItemsSource = null;
                txtMerkAuto.Text = "";
                txtTypeAuto.Text = "";
                txtKenteken.Text = "";
                txtAantalPassagiers.Text = "";
                txtLaadruimte.Text = "";
                getAanvraag();
            }
            else
            {
                MessageBox.Show("Selecteer eerst een aanvraag.", "Geen selectie", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
            
        }
    }
}
