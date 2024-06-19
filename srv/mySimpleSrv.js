const cds = require('@sap/cds');


module.exports = cds.service.impl(async srv => {


srv.on('getCoursesForStudent', async (req, res) => {
  const { View,Enrollment, Course } = cds.entities('myNamespace');
  let studentEmail = req.data.studentEmail;
  let result;

  try {
    const courses = await SELECT
        .from(View)
        .where({ student_email : studentEmail });

    if (courses.length>0){
    const arrayOfIds = courses.map(obj => obj.course_ID);
    }

    if(arrayOfIds.length>0){
    result = await SELECT.from(Course).where({ID : {in:arrayOfIds}})
    }
    
    if(result){  return result; }
       
} catch (error) {
    console.error('Error retrieving courses for student:', error);
    req.error(500, 'Failed to retrieve courses for student');
}


});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

})
