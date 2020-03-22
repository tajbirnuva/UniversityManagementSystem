using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Gateway;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.ViewModel;

namespace UniversityManagementSystemWebApp.Manager
{
    public class StudentResultManager
    {
        public StudentResultGateway  AStudentResultGateway;
        public StudentResultManager()
        {
            AStudentResultGateway=new StudentResultGateway();
        }

       
        public List<SelectListItem> GetStudentRegNoForDropdown()
        {
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem() { Text = "---Select a Student Reg.No.---", Value = "" });

            List<Student> getAllStudentRegNo = AStudentResultGateway.GetAllStudentRegNo();


            foreach (Student aStudent in getAllStudentRegNo)
            {
                SelectListItem selectList = new SelectListItem();
                selectList.Text = aStudent.RegistrationNo;
                selectList.Value = aStudent.StudentId.ToString();
                selectListItems.Add(selectList);
            }
            return selectListItems;
        }

        //Grade load for dropdown
        public List<SelectListItem> GetAllGradeForDropdown()
        {
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem() { Text = "---Select a Grade---", Value = "" });

            List<Grade> getAllGradeList= AStudentResultGateway.GetAllGradeList();


            foreach (Grade aGrade in getAllGradeList)
            {
                SelectListItem selectList = new SelectListItem();
                selectList.Text = aGrade.GradeName;
                selectList.Value = aGrade.GradeId.ToString();
                selectListItems.Add(selectList);
            }
            return selectListItems;
        }

        
        public List<SelectListItem> GetAllCourseByStudentId(int studentId)
        {
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem() { Text = "---Select a Course---", Value = "" });

            List<Course> getAllCourseList = AStudentResultGateway.GetAllCourseByStudentId(studentId);


            foreach (Course aCourse in getAllCourseList)
            {
                SelectListItem selectList = new SelectListItem();
                selectList.Text = aCourse.CourseCode;
                selectList.Value = aCourse.CourseId.ToString();
                selectListItems.Add(selectList);
            }
            return selectListItems;
        }

 

        public StudenResultViewModel GetAllStudentInfoByStutnetId(int studentId)
        {
            return AStudentResultGateway.GetAllStudentInfoByStudentId(studentId);
        }

        public string SaveStudentResult(Enroll aEnroll )
        {
            int row = AStudentResultGateway.SaveStudentResult(aEnroll);
            if (row > 0)
            {
                return "Save Successfully";
            }
            else
            {
                return "Something Wrong";
            }
        }
         
    }
} 