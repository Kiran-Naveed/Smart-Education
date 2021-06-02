
using SmartEducation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace SmartEducation.Controllers
{
    public class StudentAPIController : ApiController
    {
        [HttpPost]
        public bool RegisterStudent(StudentViewModel model) {
            try
            {
                SmartEducationEntities db = new SmartEducationEntities();
                StudentInfo studentObj = new StudentInfo();
                studentObj.Name = model.Name;
                studentObj.Email = model.Email;
                studentObj.RegNo = model.RegNo;
                studentObj.Password = model.Password;
                db.StudentInfoes.Add(studentObj);
                db.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }

        [HttpPost]
        public int LoginStudent(StudentLoginModel login)
        {
            
            int id = -1;
            try
            {
                SmartEducationEntities db = new SmartEducationEntities();
                var studentList = db.StudentInfoes.ToList();
                foreach (var student in studentList) {
                    if ((student.RegNo.Equals(login.RegNo) || student.Email.Equals(login.RegNo)) &&student.Password.Equals(login.Password)) {
                        id = student.StudentId;
                        break;
                    }
                }
                return id;
            }
            catch (Exception e)
            {
                return id;
            }
        }


        [HttpGet]
        public List<StudentViewModel> AllStudent()
        {
            List<StudentViewModel> list = new List<StudentViewModel>();
            SmartEducationEntities db = new SmartEducationEntities();
            var studentList = db.StudentInfoes.ToList();
            foreach (var student in studentList)
            {
                StudentViewModel obj = new StudentViewModel();
                obj.Name = student.Name;
                obj.Email = student.Email;
                obj.RegNo = student.RegNo;
                obj.Password = student.Password;
                list.Add(obj);
            }
            return list;
        }

        [HttpGet]
        public List<CourseModel> AllCourses()
        {
            List<CourseModel> list = new List<CourseModel>();
            SmartEducationEntities db = new SmartEducationEntities();
            var courseList = db.Courses.ToList();
            foreach (var course in courseList)
            {
                CourseModel obj = new CourseModel();
                obj.Id = course.cId;
                obj.CourseName = course.CourseName;
                obj.CourseCode = course.CourseCode;
                list.Add(obj);
            }
            return list;
        }

        [HttpPost]
        public bool Enroll(EnrollModel model) {
            try
            {
                SmartEducationEntities db = new SmartEducationEntities();
                Enroll enrollObj = new Enroll();
                enrollObj.cId = model.CourseId;
                enrollObj.StudentId = model.StudentId;
                db.Enrolls.Add(enrollObj);
                db.SaveChanges();
                return true; 
            }
            catch (Exception e) {
                return false;
            }
        }

        [HttpGet]
        public List<ClassSchaduleModel> getTimeTable() {
            List<ClassSchaduleModel> timeTable = new List<ClassSchaduleModel>();
            SmartEducationEntities db = new SmartEducationEntities();
            ClassSchaduleModel csm = new ClassSchaduleModel();
            var list = db.timeTable().ToList();
            for (int i = 0; i < list.Count(); i++) {
                csm.CourseName = list[i].CourseName;
                csm.Day = list[i].Day;
                csm.startTime = list[i].StartTime;
                csm.endTime = list[i].EndTime;
                timeTable.Add(csm);
            }
            return timeTable;
           
        }


        public bool SaveImage(StudentImagesModel imageModel) {
            bool flag = false;
            //byte[] imageArray = File.ReadAllBytes(@"D:\Pictures\Saved Pictures\baloons.jpg");
            //string base64ImageRepresentation = Convert.ToBase64String(imageArray);
            //var img = Image.FromStream(new MemoryStream(Convert.FromBase64String(base64ImageRepresentation)));
            try
            {
                SmartEducationEntities db = new SmartEducationEntities();
                StudentImage imageObj = new StudentImage();
                imageObj.StudentId = imageModel.StudentId;
                imageObj.ImageType = imageModel.ImageType;
                Image image = imageModel.image;
                
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }




            return flag;
        }

    


    }
}
