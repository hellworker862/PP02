using PP02.Data.Models;
using PP02.Data.Repositories;
using PP02.Forms;
using PP02.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PP02.Controls
{
    public partial class PhotoItem : UserControl
    {
        private readonly int id;

        public PhotoItem(ServicePhotoModel photoModel)
        {
            InitializeComponent();
            id = photoModel.Id;
            pictureBox1.Image = Image.FromFile(photoModel.Path);
            button1.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button1.FlatAppearance.MouseOverBackColor = Color.FromArgb(100, Color.Black);
            button1.Parent = pictureBox1;
            button2.Parent = button1;
        }

        private void button1_MouseMove(object sender, MouseEventArgs e)
        {
            button1.BackgroundImage = Resources.magnifier_icon_icons_com_49240;
        }

        private void button1_MouseLeave(object sender, EventArgs e)
        {
            button1.BackgroundImage = null;
        }

        private void button2_MouseMove(object sender, MouseEventArgs e)
        {
            button1.BackColor = Color.FromArgb(120, Color.Black);
        }

        private void button2_MouseLeave(object sender, EventArgs e)
        {
            button1.BackColor = Color.Transparent;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var fr = new PhotoForm(pictureBox1.Image);
            fr.Show();
        }

        private async void button2_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите удалить?", "Предупреждение", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
                return;

            var repository = new ServiceRepository();
            await repository.DeletePhotoServiceAsync(id);
            this.Dispose();
        }
    }
}
