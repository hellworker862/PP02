using PP02.Data.Models;
using PP02.Data.Repositories;
using PP02.Extensions;
using PP02.Forms;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace PP02.Controls
{
    public partial class ServiceItem : UserControl
    {
        public delegate void UpdateDel();
        private readonly int serviceId;
        private readonly string ImagePath = Environment.CurrentDirectory + "\\..\\..\\Images\\";
        private readonly Color AdditionalBackgroundColor = Color.FromArgb(231, 250, 191);
        public UpdateDel UpdateDelegate;

        public ServiceItem(ServiceModel model, bool isAdmin)
        {
            InitializeComponent();

            buttonDelete.BackColor = Colors.EmphasisColor;
            buttonDelete.ForeColor = Color.White;
            buttonDelete.FlatStyle = FlatStyle.Flat;
            buttonDelete.FlatAppearance.BorderSize = 0;
            buttonEdit.BackColor = Colors.EmphasisColor;
            buttonEdit.ForeColor = Color.White;
            buttonEdit.FlatStyle = FlatStyle.Flat;
            buttonEdit.FlatAppearance.BorderSize = 0;
            buttonSapis.BackColor = Colors.EmphasisColor;
            buttonSapis.ForeColor = Color.White;
            buttonSapis.FlatStyle = FlatStyle.Flat;
            buttonSapis.FlatAppearance.BorderSize = 0;

            serviceId = model.Id;
            int discount = (int)((model.Cost * (decimal)model.Discount));
            int coast = (int)(model.Cost - discount);
            labelDis.Text = discount > 0 ? ((int)model.Cost).ToString() : "";
            labelTitle.Text = model.Title;
            labelDescription.Text = $"{coast} рублей за {Math.Round((double)model.DuraDurationInSeconds / 60, 1)} минут";
            labelDiscount.Text = $"* скидка {model.Discount * 100}%";
            if (model.Discount > 0)
            {
                labelDiscount.Visible = true;
                panelBody.BackColor = AdditionalBackgroundColor;
            }

            if (!String.IsNullOrEmpty(model.MainImagePath))
            {
                var path = model.MainImagePath[0] == ' ' ? model.MainImagePath.Remove(0, 1) : model.MainImagePath;
                pictureBox1.ImageLocation = Path.Combine(ImagePath, path);
            }

            if (!isAdmin)
            {
                panel2.Dispose();
                panel3.Dispose();
            }
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            var fr = new AddEditServiceForm(serviceId);
            var reuslt = fr.ShowDialog();

            if (reuslt == DialogResult.OK)
                UpdateDelegate();
        }

        private async void buttonDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите удалить услугу?", "Предупреждение", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                return;
            var repository = new ServiceRepository();

            if(await repository.CanBeDeleteServiceAsync(serviceId))
            {
                var photos = (await repository.GetServiceByIdWithPhotosAsync(serviceId)).Photos;
                await repository.DeleteServiceAsync(serviceId);
                var pathMain = pictureBox1.ImageLocation;
                FileInfo fileInf = new FileInfo(pathMain);

                if (fileInf.Exists)
                    fileInf.Delete();

                foreach (ServicePhotoModel item in photos)
                {
                    var path= Path.Combine(ImagePath, item.Path);
                    FileInfo fileInfo = new FileInfo(path);

                    if (fileInfo.Exists)
                        fileInfo.Delete();
                }
                this.Dispose();
            }
            else
            {
                MessageBox.Show("Услугу нельзя удалить", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private async void buttonSapis_Click(object sender, EventArgs e)
        {
            var repository = new ServiceRepository();
            var service = await repository.GetServiceByIdAsync(serviceId);
            var fr = new AddEntryForm(service);
            fr.ShowDialog();

        }
    }
}
