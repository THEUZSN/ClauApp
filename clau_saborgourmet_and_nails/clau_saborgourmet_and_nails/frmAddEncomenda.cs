﻿using System;
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
    public partial class frmAddEncomenda : Form
    {
        public frmAddEncomenda()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            var previousForm = new frmEncomendas();
            previousForm.Show();
            this.Close();
        }
    }
}
