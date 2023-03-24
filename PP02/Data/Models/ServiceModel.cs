using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP02.Data.Models
{
    public class ServiceModel
    {
        public int Id { get; set; } = 0;
        public string Title { get; set; }
        public decimal Cost { get; set; }
        public int DuraDurationInSeconds { get; set; }
        public string Description { get; set; }
        public double Discount { get; set; } = 0;
        public string MainImagePath { get; set; }
        public List<ServicePhotoModel> Photos { get; set; }

        public override string ToString()
        {
            return Title;
        }
    }
}
