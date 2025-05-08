using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace clau_saborgourmet_and_nails
{
    public partial class frm_splash : Form
    {
        public frm_splash()
        {
            InitializeComponent();
        }

        private void frm_splash_Shown(object sender, EventArgs e)
        {
            this.Refresh();

            for (int i = 0; i < 101; i++)
            {
                barCarregamento.Value = i;
                Thread.Sleep(15);
            }
            barCarregamento.Value = 99;
            Thread.Sleep(20);

            this.Hide();
            var menu = new frmMenu();
            menu.ShowDialog();


        }

        private void frm_splash_Load(object sender, EventArgs e)
        {

        }

    }
}
