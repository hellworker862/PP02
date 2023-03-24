using PP02.Controls;
using PP02.Data.Models;
using PP02.Data.Repositories;
using PP02.Forms.Base;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace PP02.Forms
{
    public partial class AddEditServiceForm : PatternForm
    {
        private ServiceRepository repository;
        private bool isChange = false;
        private readonly int idService;
        private readonly string nameFolder = "Услуги школы\\";
        private readonly string ImagePath = Environment.CurrentDirectory + "\\..\\..\\Images\\";
        private string newFileName = "";

        public AddEditServiceForm()
        {
            InitializeComponent();
            this.Text = "Создание услуги";
            panel3.Visible = false;
            button1.Text = "Добавить осн. изображение";
            repository = new ServiceRepository();
            panel1.AutoScroll = true;
            panel1.VerticalScroll.Minimum = 0;
            panel1.VerticalScroll.Maximum = 0;
            DialogResult = DialogResult.Cancel;
        }

        public AddEditServiceForm(int id)
        {
            InitializeComponent();
            this.Text = "Редактирование услуги";
            button1.Text = "Изменить осн. изображение";
            idService = id;
            textBoxId.Text = idService.ToString();
            repository = new ServiceRepository();
            panel1.AutoScroll = true;
            panel1.VerticalScroll.Minimum = 0;
            panel1.VerticalScroll.Maximum = 0;
            DialogResult = DialogResult.Cancel;
        }

        private async void AddEditServiceForm_LoadAsync(object sender, EventArgs e)
        {
            if (idService != 0)
            {
                var model = await repository.GetServiceByIdWithPhotosAsync(idService);
                textBoxTitle.Text = model.Title;
                textBoxDescription.Text = model.Description;
                numericUpDownCoast.Value = model.Cost;
                numericUpDownDiscount.Value = (decimal)(model.Discount * 100);
                numericUpDownDuration.Value = model.DuraDurationInSeconds;
                if (!String.IsNullOrEmpty(model.MainImagePath))
                {
                    var path = model.MainImagePath[0] == ' ' ? model.MainImagePath.Remove(0, 1) : model.MainImagePath;
                    pictureBox1.ImageLocation = Path.Combine(ImagePath, path);
                }

                foreach (ServicePhotoModel photo in model.Photos)
                {
                    photo.Path = Path.Combine(ImagePath, photo.Path);
                    var tmp = CreatePhotoItem(photo);
                    panel1.Controls.Add(tmp);
                }
            }
        }

        private async void button2_Click(object sender, EventArgs e)
        {
            string title = textBoxTitle.Text;
            string description = textBoxDescription.Text;
            decimal cost = numericUpDownCoast.Value;
            double discount = (double)numericUpDownDiscount.Value;
            int duration = (int)numericUpDownDuration.Value;

            errorProvider1.Clear();
            if (String.IsNullOrWhiteSpace(title)) errorProvider1.SetError(textBoxTitle, "Не указано название!");
            if (!(await repository.CheckTitleUniquenessAsync(title))) errorProvider1.SetError(textBoxTitle, "Название уже используется!");
            if (cost <= 0) errorProvider1.SetError(numericUpDownCoast, "Стоимость не может быть меньше или равна 0!");
            if (pictureBox1.Image is null) errorProvider1.SetError(pictureBox1, "Выберите основное изображение!");
            if (errorProvider1.GetError(textBoxTitle) != string.Empty ||
                errorProvider1.GetError(numericUpDownCoast) != string.Empty ||
                errorProvider1.GetError(pictureBox1) != string.Empty) return;

            if (idService != 0)
            {
                var updatedService = new ServiceModel()
                {
                    Id = idService,
                    Title = title,
                    Description = description,
                    Cost = cost,
                    Discount = discount / 100,
                    DuraDurationInSeconds = duration,
                };
                await repository.UpdateServiceAsync(updatedService);
            }
            else
            {
                var newService = new ServiceModel()
                {
                    Title = title,
                    Description = description,
                    Cost = cost,
                    Discount = discount / 100,
                    DuraDurationInSeconds = duration,
                    MainImagePath = String.IsNullOrEmpty(newFileName) ? "" : Path.Combine(nameFolder, newFileName),
                };
                await repository.CreateServiceAsync(newService);

                if (!String.IsNullOrEmpty(newFileName))
                {
                    var path = Path.Combine(ImagePath, nameFolder, newFileName);
                    pictureBox1.Image.Save(path);
                }
                var id = await repository.GetLastIdAsync();

                foreach (PhotoItem photoItem in panel1.Controls)
                {
                    var type = "jpeg";
                    var fileName = $"{Guid.NewGuid()}.{type}";
                    var path = Path.Combine(ImagePath, nameFolder, fileName);
                    photoItem.pictureBox1.Image.Save(path);
                    await repository.AddPhotoServiceAsync(id, Path.Combine(nameFolder, fileName));
                }
            }

            isChange = true;
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            var openDialog = new OpenFileDialog();
            openDialog.Filter = "Файлы изображений (*.bmp, *.jpg, *.png)|*.bmp;*.jpg;*.png";

            if (openDialog.ShowDialog() == DialogResult.Cancel) return;
            var type = openDialog.FileName.Split('.');
            var fileName = $"{Guid.NewGuid()}.{type[type.Length - 1]}";

            if (idService != 0)
            {
                if (!String.IsNullOrEmpty(pictureBox1.ImageLocation))
                {
                    var pathOld = pictureBox1.ImageLocation;
                    FileInfo fileInf = new FileInfo(pathOld);

                    if (fileInf.Exists)
                    {
                        fileInf.Delete();
                    }
                }
                var path = Path.Combine(ImagePath, nameFolder, fileName);
                pictureBox1.Image = Image.FromFile(openDialog.FileName);
                pictureBox1.Image.Save(path);
                await repository.UpdateImageServiceAsync(idService, Path.Combine(nameFolder, fileName));
            }
            else
            {
                newFileName = fileName;
                pictureBox1.Image = Image.FromFile(openDialog.FileName);
            }

            isChange = true;
        }

        private async void button3_Click(object sender, EventArgs e)
        {
            var openDialog = new OpenFileDialog();
            openDialog.Filter = "Файлы изображений (*.bmp, *.jpg, *.png)|*.bmp;*.jpg;*.png";

            if (openDialog.ShowDialog() == DialogResult.Cancel) return;
            var type = openDialog.FileName.Split('.');
            var fileName = $"{Guid.NewGuid()}.{type[type.Length - 1]}";

            if (idService != 0)
            {
                var path = Path.Combine(ImagePath, nameFolder, fileName);
                var newServicePhoto = new ServicePhotoModel()
                {
                    Path = openDialog.FileName,
                };
                var tmp = CreatePhotoItem(newServicePhoto);
                panel1.Controls.Add(tmp);
                tmp.pictureBox1.Image.Save(path);
                await repository.AddPhotoServiceAsync(idService, Path.Combine(nameFolder, fileName));
            }
            else
            {
                var newServicePhoto = new ServicePhotoModel()
                {
                    Path = openDialog.FileName,
                };
                var tmp = CreatePhotoItem(newServicePhoto);
                panel1.Controls.Add(tmp);
            }
        }

        private PhotoItem CreatePhotoItem(ServicePhotoModel model)
        {
            var photoItem = new PhotoItem(model);
            photoItem.Dock = DockStyle.Top;

            return photoItem;
        }

        private void AddEditServiceForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(isChange)
                DialogResult = DialogResult.OK;
        }
    }
}
