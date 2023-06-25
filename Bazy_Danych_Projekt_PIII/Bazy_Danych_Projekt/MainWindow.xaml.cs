using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

namespace Bazy_Danych_Projekt
{
    public partial class MainWindow : Window
    {
        public string connectionString = "Server=DESKTOP-84VM5PF\\SQLEXPRESS;Database=Bazy_Danych;Trusted_Connection=True; TrustServerCertificate=True";
        public MainWindow()
        {
            InitializeComponent();
        }
        // Przyciski
        public void Button_Praca_Odczyt(object sender, RoutedEventArgs e)
        {
            string query = "SELECT * FROM Praca";
            Odczyt(query);
        }
        private void Button_Projekt_Odczyt(object sender, RoutedEventArgs e)
        {
            string query = "SELECT * FROM Projekt";
            Odczyt(query);
        }
        private void Button_Uczen_Odczyt(object sender, RoutedEventArgs e)
        {
            string query = "SELECT * FROM Uczen";
            Odczyt(query);
        }
        private void Button_Grupa_Odczyt(object sender, RoutedEventArgs e)
        {
            string query = "SELECT * FROM Grupa";
            Odczyt(query);
        }
        private void Button_Prowadzancy_Odczyt(object sender, RoutedEventArgs e)
        {
            string query = "SELECT * FROM Prowadzancy";
            Odczyt(query);
        }

        private void Usun_Prace(object sender, RoutedEventArgs e)
        {
            string query = "DELETE FROM Praca WHERE Id_pracy = @Id_pracy";
            Usun(query);
        }
        private void Dodaj_Prace(object sender, RoutedEventArgs e)
        {
            string query = "INSERT INTO Praca (Id_pracy, Id_projekt, nr_etapu, Ocena, Zawartosc_pracy, Czy_Ukonczony) VALUES (@id_pracy, 1, 1, 3, 0, 0)";
            Dodaj(query);
        }
        private void Edytuj_Prace(object sender, RoutedEventArgs e)
        {
            string query = "UPDATE Praca SET Ocena = @NewEmail WHERE Id_pracy = @CustomerName";
            Edytuj(query);
        }


        private void Odczyt(string input)
        {
            string query = input;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                dataGrid.ItemsSource = dataTable.DefaultView;
            }
        }

        private void Dodaj(string input)
        {
            string query = input;
            int Id_pracy;
            if (int.TryParse(id_text_dodaj.Text, out Id_pracy))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id_pracy", Id_pracy);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Praca została dodana.");
                    }
                    else
                    {
                        MessageBox.Show("Nie udało się dodać pracy.");
                    }
                }
            }
        }


        private void Usun(string input)
        {
            string query = input;
            int Id_pracy;
            if (int.TryParse(id_text_usun.Text, out Id_pracy))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Id_pracy", Id_pracy);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Praca została usunięta");
                    }
                    else
                    {
                        MessageBox.Show("Nie znaleziono Pracy o takim Id.");
                    }
                }
            }
            else
            {
                MessageBox.Show("Nieporwane Id. Wprowadz cyfre");
            }
        }

        private void Edytuj(string input)
        {
            string query = input;
            string customerName = id_text_3.Text;
            string newEmail = id_text_4.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@NewEmail", newEmail);
                command.Parameters.AddWithValue("@CustomerName", customerName);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();

                if (rowsAffected > 0)
                {
                    // Update successful
                    MessageBox.Show("Email updated successfully.");
                }
                else
                {
                    // No customer found with the specified name
                    MessageBox.Show("No customer found with the specified name.");
                }
            }
        }

        private void id_text_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}