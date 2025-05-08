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
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();
        }

        private void frmMenu_Shown(object sender, EventArgs e)
        {
            
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnSaborGourmetHome_Click(object sender, EventArgs e)
        {
            this.Hide();
            var SaborHome = new frmSaborGourmetHome();
            SaborHome.ShowDialog();
            this.Close();
        }

    }
}
