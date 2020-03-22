using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemWebApp.Gateway;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.ViewModel;

namespace UniversityManagementSystemWebApp.Manager
{
    public class EnrollCourseManager
    {
        EnrollCourseGateway aEnrollCourseGateway = new EnrollCourseGateway();
        StudentGateway aStudentGateway = new StudentGateway();
        public string EnrollCourse(Enroll enroll)
        {
            if (!aEnrollCourseGateway.IsEnrollExixts(enroll))
            {
                int rowAffect = aEnrollCourseGateway.EnrollCourse(enroll);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";
                }
            }
            else
            {
                return "A Student Can Enroll a Course Only One Time";
            }
        }

        public List<Student> GetAllStudentRegNo()
        {
            return aStudentGateway.GetAllStudentRegNo();
        }

        public StudenResultViewModel GetAllStudentInfoByStudentId(int studentId)
        {
            return aStudentGateway.GetAllStudentInfoByStudentId(studentId);
        }


    }
}