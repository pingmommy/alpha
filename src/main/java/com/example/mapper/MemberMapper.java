package com.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.model.Dept;
import com.example.model.Member;

@Mapper
public interface MemberMapper {
	
	@Select("select * from member where id = #{id}")
	Member selectById(String id);
	
	@Insert ("""
			insert into member
			values(
				 #{id},#{password},#{roles}
			)
			
		""")
	int insert(@Param("id") String id,@Param("password")String password,@Param("roles") String roles);

}
