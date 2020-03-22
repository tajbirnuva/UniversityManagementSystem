﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Gateway;
using UniversityManagementSystemWebApp.Models;

namespace UniversityManagementSystemWebApp.Manager
{
    public class DepartmentManager
    {
        public DepartmentGateway departmentGateway;

        public DepartmentManager()
        {
            departmentGateway = new DepartmentGateway();
        }
        public string Save(Department department)
        {
            if (department.Code.Length > 1 && department.Code.Length < 7)
            {
                if (departmentGateway.isExisted(department))
                {
                    return "Department Code or Name is already Existed";
                }
                else
                {
                    int rowAffect = departmentGateway.Save(department);
                    if (rowAffect > 0)
                    {
                        return "Save Successful";
                    }
                    else
                    {
                        return "Save Failed";
                    }
                }

            }
            else
            {
                return "Code must be 2 to 7 characters long";
            }
        }

        public List<Department> GetAllDepartments()
        {
            return departmentGateway.GetAllDepartments();
        }

        public List<SelectListItem> GetAllDepartmentForDropdown()
        {
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem() { Text = "---Select a Department---", Value = "" });
            foreach (Department department in GetAllDepartments())
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = department.Code;
                selectListItem.Value = department.DeptId.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public Department GetDepartmentbyId(int id)
        {
            return departmentGateway.GetDepartmentbyId(id);
        }
    }
}