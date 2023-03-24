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
    public partial class PhotoForm : PatternForm
    {
        public PhotoForm(Image image)
        {
            InitializeComponent();
            pictureBox1.Image = image;
        }
    }
}
