//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartEducation
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attendance
    {
        public int LecturesId { get; set; }
        public int eId { get; set; }
        public string InfoType { get; set; }
        public string Value { get; set; }
    
        public virtual Enroll Enroll { get; set; }
    }
}
