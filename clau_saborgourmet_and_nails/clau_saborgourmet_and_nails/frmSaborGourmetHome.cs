using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace clau_saborgourmet_and_nails
{
    public partial class frmSaborGourmetHome : Form
    {
        public frmSaborGourmetHome()
        {
            InitializeComponent();
        }

        private void frmSaborGourmetHome_Load(object sender, EventArgs e)
        {

        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnProdutos_Click(object sender, EventArgs e)
        {
            this.Close();
            var sgProdutos = new frmSaborGourmetProdutos();
            sgProdutos.Show();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            var previousForm = new frmMenu();
            previousForm.Show();
            this.Close();
        }

        private void btnVendas_Click(object sender, EventArgs e)
        {
            this.Close();
            var sgVendas = new frmSaborGourmetVendas();
            sgVendas.Show();
        }

        private void btnEncomendas_Click(object sender, EventArgs e)
        {
            this.Close();
            var sgVendas = new frmEncomendas();
            sgVendas.Show();
        }
    }
}
