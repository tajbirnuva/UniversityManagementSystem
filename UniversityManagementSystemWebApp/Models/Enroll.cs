﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemWebApp.Models
{
    public class Enroll
    {
        
        public int EnrollId { get; set; }
        [DisplayName("Student Reg No.")]
        [Required(ErrorMessage = "Please Select Student Reg No")]
        public int StudentId { get; set; }

        [DisplayName("Select Course")]
        [Required(ErrorMessage = "Please Select Course")]
        public int CourseId { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:/dd/MM/yyyy}")]
        public string Date { get; set; }

        [DisplayName("Select Grade Letter")]
        [Required(ErrorMessage = "Please Select Grade Letter")]
        public int GradeId { get; set; }

        public string Action { get; set; }

       
    }
}