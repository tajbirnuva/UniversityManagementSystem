using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemWebApp.Models
{
    public class Teacher
    {
        public int TeacherId { get; set; }
        [DisplayName("Teacher's Name")]
        [Required(ErrorMessage = "Please Provide Teacher's Name")]
        public string Name { get; set; }

        [DisplayName("Teacher's Address")]
        [Required(ErrorMessage = "Please Provide Teacher's Address")]
        public string Address { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Please Provide An Email Address")]
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please Provide Contact Number")]
        [RegularExpression("([0-9]*)", ErrorMessage = "Invalid Typing")]
        [StringLength(11, MinimumLength = 11, ErrorMessage = "Type A Valid Contact Number")]
        public string ContactNo { get; set; }

        [DisplayName("Designation")]
        [Required(ErrorMessage = "Please Select A Designation")]
        public int DesignationId { get; set; }

        [DisplayName("Department")]
        [Required(ErrorMessage = "Please Select A Department")]
        public int DepartmentId { get; set; }

        [DisplayName("Credit to be taken")]
        [Required(ErrorMessage = "Please Enter Credit")]
        [Range(0.0, Double.MaxValue, ErrorMessage = "Credit Must Be Non-Negative")]
        public double Credit { get; set; }
    }
}