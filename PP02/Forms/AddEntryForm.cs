using PP02.Data.Models;
using PP02.Data.Repositories;
using PP02.Forms.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PP02.Forms
{
    public partial class AddEntryForm : PatternForm
    {
        private int serviceId;
        private EntryRepository repository;
        public AddEntryForm(ServiceModel service)
        {
            InitializeComponent();
            monthCalendar1.MinDate = DateTime.Now.AddDays(1);
            monthCalendar1.MaxDate = DateTime.Now.AddYears(1);
            dateTimePicker2.MinDate = DateTime.Now.AddDays(1);
            dateTimePicker2.MaxDate = DateTime.Now.AddYears(1);
            serviceId = service.Id;
            labelService.Text = service.Title;
            labelTime.Text = $"{service.DuraDurationInSeconds / 60} минут";
            repository = new EntryRepository();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            int clientId = (int)comboBox1.SelectedValue;
            DateTime dateTime = monthCalendar1.SelectionRange.Start + dateTimePicker2.Value.TimeOfDay;
            var newEntry = new EntryModel()
            {
                ClientId = clientId,
                ServiceId = serviceId,
                StartTime = dateTime
            };

            await repository.CreateEntryAsync(newEntry);
        }

        private async void AddEntryForm_Load(object sender, EventArgs e)
        {
            var clients = await repository.GetAllClientAsync();
            comboBox1.ValueMember = "Id";
            comboBox1.DisplayMember = "Fio";
            comboBox1.DataSource = clients;
            comboBox1.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            comboBox1.AutoCompleteSource = AutoCompleteSource.ListItems;
        }
    }
}
