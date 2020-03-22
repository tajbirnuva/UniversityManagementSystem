using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemWebApp.Models
{
    public class AllocateClassRoom
    {
        public int ClassId { get; set; }

        [DisplayName("Department")]
        [Required(ErrorMessage = "Please Select Department")]
        public int DeptId { get; set; }

        [DisplayName("Course")]
        [Required(ErrorMessage = "Please Select Course")]
        public int CourseId {get;set;}


        [DisplayName("Room No.")]
        [Required(ErrorMessage = "Please Select Room")]
        public int  RoomId {get;set;}

        [DisplayName("Day")]
        [Required(ErrorMessage = "Please Select a Day")]
        public int  DayId {get;set;}


        [DisplayName("From")]
        [Required(ErrorMessage = "Insert From Time")]
        public string FromTime { get; set; }


        [DisplayName("To")]
        [Required(ErrorMessage = "Insert To Time")]
        public string ToTime { get; set; }
        public string Action { get; set; }
    }
}