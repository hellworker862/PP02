using PP02.Data.Repositories;
using PP02.Forms.Base;
using System;
using System.Drawing;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PP02.Forms
{
    public partial class UpcomingEntriesForm : PatternForm
    {
        private int counter = 0;
        private int time = 30;
        private EntryRepository _entryRepository;
        public UpcomingEntriesForm()
        {
            InitializeComponent();
            dataGridView1.RowTemplate.Height = 30;
            panel1.BackColor = Colors.AdditionalBackgroundColor;
            _entryRepository = new EntryRepository();
            UpdateData();
            var timer = new Timer();
            timer.Interval = 1000;
            timer.Enabled = true;
            timer.Tick += timer_Tick;
            timer.Start();
        }

        private async void timer_Tick(object sender, EventArgs e)
        {
            if (counter == 30)
            {
                await UpdateData();
                time = 30;
                counter = 0;
            }
            counter++;
            label1.Text = $"Обновление через: {--time} сек.";
        }

        private async Task UpdateData()
        {
            dataGridView1.DataSource = new BindingSource()
            {
                DataSource = await _entryRepository.GetUpcomingEntriesAsync(),
            };
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                var t = (string)row.Cells[dataGridView1.Columns.Count - 1].Value;
                var s = t.Split(' ')[0];
                var tmp = int.Parse(((string)row.Cells[dataGridView1.Columns.Count - 1].Value).Split(' ')[0]);

                if (tmp <= 1)
                {
                    row.Cells[dataGridView1.Columns.Count - 1].Style.ForeColor = Color.Red;
                }
            }
        }
    }
}
