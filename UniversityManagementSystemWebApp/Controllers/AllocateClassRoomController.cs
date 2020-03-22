using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Manager;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.ViewModel;

namespace UniversityManagementSystemWebApp.Controllers
{
    public class AllocateClassRoomController : Controller
    {
        private AllocateClassRoomManager allocateClassRoomManager;


        public AllocateClassRoomController()
        {
            allocateClassRoomManager = new AllocateClassRoomManager();

        }



        [HttpGet]
        public ActionResult Save()
        {

            ViewBag.Departments = allocateClassRoomManager.GetDepartmentsForDropdown();
            ViewBag.Rooms = allocateClassRoomManager.GetRoomForDropdown();
            ViewBag.WeekDays = allocateClassRoomManager.GetWeekDaysForDropdown();
            return View();
        }

        [HttpPost]
        public ActionResult Save(AllocateClassRoom allocateClassRoom)
        {
           

            if (ModelState.IsValid)
            {
                if (allocateClassRoom.FromTime.Length == 7)
                {
                    allocateClassRoom.FromTime = "0" + allocateClassRoom.FromTime;
                }
                if (allocateClassRoom.ToTime.Length == 7)
                {
                    allocateClassRoom.ToTime = "0" + allocateClassRoom.ToTime;
                }


                ViewBag.Departments = allocateClassRoomManager.GetDepartmentsForDropdown();
                ViewBag.Rooms = allocateClassRoomManager.GetRoomForDropdown();
                ViewBag.WeekDays = allocateClassRoomManager.GetWeekDaysForDropdown();
                ViewBag.Message = allocateClassRoomManager.saveAllocateClass(allocateClassRoom);
                if (ViewBag.Message == "Save Successful")
                {
                    ModelState.Clear();
                }
                return View();

            }
            else
            {
                ViewBag.Departments = allocateClassRoomManager.GetDepartmentsForDropdown();
                ViewBag.Rooms = allocateClassRoomManager.GetRoomForDropdown();
                ViewBag.WeekDays = allocateClassRoomManager.GetWeekDaysForDropdown();
                string message = "Validation Error";
                ViewBag.Message = message;
                return View();
            }

        }

        public JsonResult GetCourseByDepartmentId(int deptId)
        {
            List<SelectListItem> courseList = allocateClassRoomManager.GetCourseByDeparmentId(deptId);
            return Json(courseList, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ViewClassShedule()
        {
            ViewBag.Departments = allocateClassRoomManager.GetDepartmentsForDropdown();
            return View();
        }

        public JsonResult GetViewClassSheduleByDeptId(int DeptId)
        {
            List<ViewClassSheduleViewModel> viewClassShedulelist = allocateClassRoomManager.showClassDetails(DeptId);
            return Json(viewClassShedulelist, JsonRequestBehavior.AllowGet);
        }
    }
}