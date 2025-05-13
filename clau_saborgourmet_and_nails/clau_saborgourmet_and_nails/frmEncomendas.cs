using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.Hosting;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace clau_saborgourmet_and_nails
{
    public partial class frmEncomendas : Form
    {
        public frmEncomendas()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

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
    }
}
