using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace clau_saborgourmet_and_nails
{
    public partial class frmAddProdutos : Form
    {
        public frmAddProdutos()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            var previousForm = new frmsaborGourmetProdutos();
            previousForm.Show();
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            var Nome = txtNome.Text;
            var PrecoText = txtPreco.Text;
            var Tipo = txtTipo.Text;

            if (!decimal.TryParse(PrecoText, out decimal Preco))
            {
                MessageBox.Show("Preço inválido.");
                return;
            }

            string connectionString = "Server=localhost;Database=bd_clauapp;User ID=root;Password=;";

            try
            {
                
                // Crie a conexão
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    
                    // Abra a conexão
                    conn.Open();
                    //MessageBox.Show("Conexão estabelecida com sucesso!");

                    
                    string query = "INSERT INTO produto (NM_PRODUTO, PRECO, TIPO) VALUES (@Nome, @Preco, @Tipo)";

                    // Crie o comando e adicione os parâmetros
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Nome", Nome);
                    cmd.Parameters.AddWithValue("@Preco", Preco);
                    cmd.Parameters.AddWithValue("@Tipo", Tipo);

                    // Execute o comando
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Verifique quantas linhas foram afetadas
                    // MessageBox.Show($"{rowsAffected} linha(s) inserida(s) com sucesso!");

                    txtNome.Text = "";
                    txtPreco.Text = "";
                    txtTipo.Text = "";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro: " + ex.Message);
            }
        }
    }
}
