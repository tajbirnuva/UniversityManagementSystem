﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Manager;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.ViewModel;

using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.text.html.simpleparser;
using Microsoft.Ajax.Utilities;

namespace UniversityManagementSystemWebApp.Controllers
{

    public class StudentController : Controller
    {
        private DepartmentManager aDepartmentManager;
        private StudentManager aStudentManager;
        private CourseManager aCourseManager;
        private EnrollCourseManager aEnrollCourseManager;
        //
        // GET: /Student/

        public StudentController()
        {
            aDepartmentManager = new DepartmentManager();
            aStudentManager = new StudentManager();
            aEnrollCourseManager = new EnrollCourseManager();
            aCourseManager = new CourseManager();
        }
        [HttpGet]
        public ActionResult Register()
        {
            ViewBag.Departments = aDepartmentManager.GetAllDepartments();
            //  ViewBag.Students = aStudentManager.GetAllStudents();
            return View();
        }
        [HttpPost]
        public ActionResult Register(Student student)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Departments = aDepartmentManager.GetAllDepartments();
                student.RegistrationNo = GenerateRegNo(student);
                ViewBag.Message = aStudentManager.Save(student);
                if (ViewBag.Message == "Save Successful")
                {
                    ModelState.Clear();
                }

                string deptCode = aDepartmentManager.GetDepartmentbyId(student.DepartmentId).Code;
                string deptName = aDepartmentManager.GetDepartmentbyId(student.DepartmentId).Name;
                StudentDetailsViewModel studentDetails = new StudentDetailsViewModel();
                studentDetails.StudentName = student.StudentName;
                studentDetails.StudentEmail = student.Email;
                studentDetails.StudentRegNo = student.RegistrationNo;
                studentDetails.StudntContactNo = student.ContactNo;
                studentDetails.StudentAddress = student.Address;
                studentDetails.StudentDeptCode = deptCode;
                studentDetails.StudentDeptName = deptName;
                studentDetails.StudentDate = student.Date;

                ViewBag.StudentDetails = studentDetails;
                return View();
            }

            else
            {
                ViewBag.Departments = aDepartmentManager.GetAllDepartments();
                ViewBag.Message = "Validation Error";
                return View();
            }
        }


        [HttpGet]
        public ActionResult Result()
        {
            ViewBag.RegNoList = aEnrollCourseManager.GetAllStudentRegNo();
            return View();
        }

        [HttpPost]
        public ActionResult Result(Student student)
        {
            ViewBag.RegNoList = aEnrollCourseManager.GetAllStudentRegNo();
            return View();
        }

        private string GenerateRegNo(Student student)
        {
            string Year = GetYearFromDate(student.Date);
            string Department = aDepartmentManager.GetDepartmentbyId(student.DepartmentId).Code;
            string Serial = GetSerialFromRowCount(aStudentManager.GetRowCount(student.DepartmentId, Convert.ToInt32(GetYearFromDate(student.Date))));

            return Department + "-" + Year + "-" + Serial;
        }


        public JsonResult GetStudentResultById(int studentId)
        {
            List<ShowResultViewModel> resultList = aStudentManager.GetStudentResultById(studentId);
            return Json(resultList, JsonRequestBehavior.AllowGet);
        }

        private string GetSerialFromRowCount(int rowCount)
        {
            rowCount++;
            string Serial = rowCount.ToString("D3");
            return Serial;
        }

        private string GetYearFromDate(string datefromdatepicker)
        {
            DateTime date = DateTime.ParseExact(datefromdatepicker, "dd/MM/yyyy", null);
            string year = date.Year.ToString();
            return year;
        }


        //pdf generation code for student Result
        [HttpPost]
        [ValidateInput(false)]
        public FileResult Export(string GridHtml)
        {
            

            using (MemoryStream stream = new System.IO.MemoryStream())
            {
                 
                StringReader sr = new StringReader(GridHtml);
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
                pdfDoc.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                pdfDoc.Close();
                return File(stream.ToArray(), "application/pdf", "Grid.pdf");
            }
            
        }

    }
}
