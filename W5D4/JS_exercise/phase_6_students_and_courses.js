function Student(first, last) {
  this.first = first;
  this.last = last;
  this.courses = [];
}

Student.prototype.name = function(){
  return `${this.first} ${this.last}`; 
};
Student.prototype.enroll = function(course){
  this.courses.push(course);
};

Student.prototype.courseLoad = function(){
  let courseLoad = {};
  this.courses.forEach(function(course){
    courseLoad[course.dept] = course.cred;
  });
  return courseLoad;
};

const Monica = new Student('Monica', 'Kornis');
const AA = new Courses('js', 'ny','1000', 2, ['mon']);
const AA2 = new Courses('js', 'ny','1000', 2, ['tues']);
const AA3 = new Courses('js', 'ny','1000', 2, ['tues']);


function Courses(name, dept, cred, time, days){
  this.name = name;
  this.dept = dept;
  this.cred = cred;
  this.students = [];
  this.time = time;
  this.days = days;
}

Courses.prototype.addStudent = function(student){
  this.students.push(student);
  student.enroll(this);
};

AA.addStudent(Monica);
AA2.addStudent(Monica);


Courses.prototype.conflictsWith = function(course){
  let result = false;
  this.days.forEach((day) => {
    if (course.days.includes(day) && course.time === this.time){
      result = true;
    }
  });
  return result;
};

Courses.prototype.conflictsWith = function(course){
  
  for (var i = 0; i < this.days.length; i++) {
    if(course.days.includes(this.days[i]) && course.time === this.time){
      return true;
    }
  }
  return false;
};