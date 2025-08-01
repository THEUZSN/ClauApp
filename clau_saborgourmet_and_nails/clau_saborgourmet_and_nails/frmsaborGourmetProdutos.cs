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
    public partial class frmsaborGourmetProdutos : Form
    {
        public frmsaborGourmetProdutos()
        {
            InitializeComponent();
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            var previousForm = new frmSaborGourmetHome();
            previousForm.Show();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var newForm = new frmAddProdutos();
            newForm.Show();
            this.Close();
        }
        private void ConsultarProdutos()
        {
            string connectionString = "Server=localhost;Database=bd_clauapp;User ID=root;Password=;";

            try
            {
                // Limpar o ListBox antes de adicionar novos produtos
                txtQuery.Items.Clear();

                // Cria a conexão com o banco
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();

                    // Consulta SQL para selecionar todos os produtos
                    string query = "SELECT ID_PRODUTO, NM_PRODUTO, PRECO, TIPO FROM Produto";

                    // Criação do comando SQL
                    MySqlCommand cmd = new MySqlCommand(query, conn);

                    // Execução da consulta
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Lê os dados retornados
                        while (reader.Read())
                        {
                            // Adiciona cada produto ao ListBox
                            string produto = $"{reader.GetInt32("ID_PRODUTO")} - {reader.GetString("NM_PRODUTO")} - {reader.GetDecimal("PRECO"):C} - {reader.GetString("TIPO")} \n";
                            txtQuery.Items.Add(produto);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao consultar produtos: " + ex.Message);
            }
        }

        private void frmsaborGourmetProdutos_Load(object sender, EventArgs e)
        {
            ConsultarProdutos();
        }
    }
}
