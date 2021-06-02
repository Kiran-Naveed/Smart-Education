using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartEducation.Models
{
    public class ClassSchaduleModel
    {
        public String CourseName { get; set; }
        public String Day { get; set; }
        public TimeSpan startTime { get; set; }
        public TimeSpan endTime { get; set; }
    }
}