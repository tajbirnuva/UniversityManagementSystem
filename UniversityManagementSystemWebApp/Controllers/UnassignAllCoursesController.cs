﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Manager;

namespace UniversityManagementSystemWebApp.Controllers
{
    public class UnassignAllCoursesController : Controller
    {
        public UnAssignAllCourseManager AunAllCourseManager = new UnAssignAllCourseManager();

        public ActionResult UnAssignCourse(bool? confirm)
        {
            if (confirm == true)
            {
                AunAllCourseManager.UnAssignEnroll();
                string message=AunAllCourseManager.UnAssignCourseAssignToTeacher();
                ViewBag.Message = message;
            }

            return View();
        }
    }
}