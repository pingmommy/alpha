package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.Dept;

@Mapper
public interface DeptMapper {
	
	@Select("select * from dept")
	List<Dept> selectAll();
	
	
	@Select("""
			select * 
			  from dept 
			 where dname like '%${search}%' 
		 """)
	List<Dept> selectByDname(String search);
	
	//int형 메소드인 이후는 row의 갯수를 반환해주기 때문

	@Insert ("""
			insert into dept
			values(
				 #{deptno},#{dname},#{loc}
			)
			
		""")
	int insert(Dept dept);
	
	@Update("""
			update dept
			        set dname = #{dname},
						loc   = #{loc}
					where deptno = #{deptno}	
			""")
	int update(Dept dept);
	
	@Delete("delete from dept where deptno=#{deptno}")
	int delete(Dept dept);

}
