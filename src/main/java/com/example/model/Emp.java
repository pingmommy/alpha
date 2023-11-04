package com.example.model;

import java.time.LocalDate;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import util.Gender;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Emp {

	Integer empno;
	String ename;
	Gender gender;  //Enum
	String job;
	Integer mgr;
	LocalDate hiredate; //localdate
	Double sal;  //double
	Double comm;  //double
	Integer deptno;
	Integer grade;

 

}

 

 