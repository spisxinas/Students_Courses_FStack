namespace myNamespace;


entity Course{
   key ID: Integer;
   courseName: String(400);
   courseDuration:DecimalFloat;
   coursePrice:Decimal(5,2);
   publishedStatus: Boolean;
   enrollment: Association to many Enrollment on enrollment.course = $self 
}

entity Enrollment{
   key ID: Integer;
   course: Association to Course;
   student: Association to Student;
}

entity Student{
   key email: String(70);
   firstName: String(40);
   lastName: String(40);
   dateSignUp: Date;
   enrollment: Association to many Enrollment on enrollment.student = $self;
}

 entity View as SELECT E.ID,*
    from  Course as C 
    inner join Enrollment as E
    on C.ID = E.course.ID;
    