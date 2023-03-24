using PP02.Extensions;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace PP02.Forms.Base
{
    public partial class PatternForm : Form
    {
        public PatternForm()
        {
            InitializeComponent();
        }

        private void PatternForm_Load(object sender, System.EventArgs e)
        {
            List<Button> buttons = this.FindAllChildrenByType<Button>().ToList();
            buttons.ForEach(x =>
            {
                x.BackColor = Colors.EmphasisColor;
                x.ForeColor = Color.White;
                x.FlatStyle = FlatStyle.Flat;
                x.FlatAppearance.BorderSize = 0;
            });
        }
    }
}
