using PP02.Forms.Base;
using System;

namespace PP02.Forms
{
    public partial class SignInForm : PatternForm
    {
        private const string password = "0000";

        public SignInForm()
        {
            InitializeComponent();
            panelHide.Visible = false;
            labelWarning.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var fr = new MainForm(false);
            fr.Owner = this;
            fr.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panelHide.Visible = true;
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void buttonSignIn_Click(object sender, EventArgs e)
        {
            var value = textBox1.Text;

            if (value == password)
            {
                var fr = new MainForm(true);
                fr.Owner = this;
                fr.Show();
                this.Hide();
                ClearForm();
            }
            else
            {
                labelWarning.Visible = true;
            }
        }

        private void ClearForm()
        {
            textBox1.Text = String.Empty;
            panelHide.Visible = false;
            labelWarning.Visible = false;
        }
    }
}
