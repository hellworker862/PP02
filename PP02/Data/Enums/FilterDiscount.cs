using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP02.Data.Enums
{
    public enum FilterDiscount
    {
        [Description("Все")]
        None = 0,
        [Description("от 0 до 5%")]
        From0To5,
        [Description("от 5% до 15%")]
        From5To15,
        [Description("от 15% до 30%")]
        From15To30,
        [Description("от 30% до 70%")]
        From30To70,
        [Description("от 70% до 100%")]
        From70To100,
    }
}
