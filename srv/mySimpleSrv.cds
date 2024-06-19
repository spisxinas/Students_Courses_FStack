using myNamespace from '../db/schema';

service mysrvdemoapp{
    
    entity GetCourse as projection on myNamespace.Course;
    entity GetEnrollment as projection on myNamespace.Enrollment;
    entity GetStudents as projection on myNamespace.Student;
    entity GetView as projection on  myNamespace.View;

    action getCoursesForStudent(studentEmail: String) returns array of GetCourse;
}

