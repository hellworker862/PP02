using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace PP02.Data.Enums
{
    public enum Sort
    {
        [Description("По стоимости - возрастание")]
        OrderByCost = 1,
        [Description("По стоимости - убывание")]
        OrderByDescendingCost = 2
    }
}
