package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.Language;

@Mapper
public interface LanguageMapper {

	@Select("""
			select name,countrycode,language,IsOfficial,percentage
			from countrylanguage,country 
			where code=countrycode
			""")
	List<Language> selectAll();
}
