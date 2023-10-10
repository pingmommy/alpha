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
	
	
	//double comm;  
	/*primitive타입으로 타입을 정할 경우 null이 0.0으로 취급하는데, 현재의 경우는 null을 0으로 취급하면 의미가 달라져서 안 된다. 
	 * 이 경우에 null은 커미션을 못받은(0) 직원이 아닌 커미션을 안 받는 부서의 직원이기 때문이다. */
	
	Integer deptno;

 

}

 // DB는 null이 저장되므로 참조타입으로 하는 것이 좋다. 만약 not null 설정이 되어 있으면 primitive타입으로 해도 된다.


//@Builder 빌터패턴을 만든다. 
 

 