using PP02.Controls;
using PP02.Data.Enums;
using PP02.Data.Models;
using PP02.Data.Repositories;
using PP02.Extensions;
using PP02.Forms;
using PP02.Forms.Base;
using System;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PP02
{
    public partial class MainForm : PatternForm
    {
        private bool _isAdmin = false;
        private ServiceRepository repository;
        public MainForm(bool isAdmin)
        {
            InitializeComponent();
            panelMenu.BackColor = Colors.AdditionalBackgroundColor;
            panelFooter.BackColor = Colors.AdditionalBackgroundColor;
            _isAdmin = isAdmin;
            labelTypeSignIn.Text = _isAdmin ? "Режим администратора" : "Обычный режим";
            var comboBox1Model = Enum.GetValues(typeof(Sort)).Cast<Sort>().Select(x =>
                                new { Value = x, Title = x.GetAttributeOfType<DescriptionAttribute>()?.Description }).ToList();
            comboBox1.ValueMember = "Value";
            comboBox1.DisplayMember = "Title";
            comboBox1.DataSource = comboBox1Model;
            var comboBox2Model = Enum.GetValues(typeof(FilterDiscount)).Cast<FilterDiscount>().Select(x =>
                               new { Value = x, Title = x.GetAttributeOfType<DescriptionAttribute>()?.Description }).ToList();
            comboBox2.ValueMember = "Value";
            comboBox2.DisplayMember = "Title";
            comboBox2.DataSource = comboBox2Model;
            repository = new ServiceRepository();
            UpdateContainerAsync();
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            comboBox2.SelectedIndexChanged += comboBox2_SelectedIndexChanged;
            textBoxSearch.TextChanged += textBoxSearch_TextChanged;

            if (_isAdmin)
            {
                button1.Visible = true;
                buttonAddService.Visible = true;
            }
        }

        private async Task<ServiceItem> CreateServiceItemAsync(ServiceModel service)
        {
            var serviceItem = new ServiceItem(service, _isAdmin);
            serviceItem.Dock = DockStyle.Top;
            serviceItem.UpdateDelegate = UpdateContainerAsync;

            return await Task.FromResult(serviceItem);
        }

        private async void UpdateContainerAsync()
        {
            Sort sort = (Sort)((int)comboBox1.SelectedValue);
            FilterDiscount filterDiscount = (FilterDiscount)((int)comboBox2.SelectedValue);
            string searchString = textBoxSearch.Text;

            var result = await repository.GetServicesByFilterAndSearchStringAsync(filterDiscount, searchString, sort);
            panelContainer.SuspendLayout();
            panelContainer.Controls.Clear();
            var length = result.Count > 50 ? 50 : result.Count;
            result.GetRange(result.Count - length, length).ForEach(async x =>
            {
                panelContainer.Controls.Add(await CreateServiceItemAsync(x));
            });
            panelContainer.ResumeLayout();
            labelFooter.Text = $"загружено {panelContainer.Controls.Count} из {result.Count} услуг";
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Owner.Show();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateContainerAsync();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateContainerAsync();
        }

        private void textBoxSearch_TextChanged(object sender, EventArgs e)
        {
            UpdateContainerAsync();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var fr = new UpcomingEntriesForm();
            fr.Show();
        }

        private void buttonAddService_Click(object sender, EventArgs e)
        {
            var fr = new AddEditServiceForm();
            fr.ShowDialog();
        }
    }
}
