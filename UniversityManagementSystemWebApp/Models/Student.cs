using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemWebApp.Models
{
    public class Student
    {

        public int StudentId { get; set; }
        [Required(ErrorMessage = "Please Type Student Name")]
        public string StudentName { get; set; }
        [Required(ErrorMessage = "Please Type Contact Number")]
        [RegularExpression("([0-9]*)", ErrorMessage = "Type a Valid Number")]
        [StringLength(11, MinimumLength = 11, ErrorMessage = "Contact Number Must Be 11 Digit Long")]
        public string ContactNo { get; set; }
        [Required(ErrorMessage = "Please Type E-mail Address")]
        [EmailAddress(ErrorMessage = "Please Type Correct E-mail Format")]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:/dd/MM/yyyy}")]
        public string Date { get; set; }
        [Required(ErrorMessage = "Please Type Address")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please Select a Department")]
        public int DepartmentId { get; set; }
        public string RegistrationNo { get; set; }



    }
}