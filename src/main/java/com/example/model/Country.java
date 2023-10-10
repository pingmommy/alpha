package com.example.model;

//Value Object - 데이터베이스에서 데이터를 가져와서 처리하기 용이하게!
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Country {
  String code2;
  Long capital;
  String headOfState;
  String governmentForm;
  String localName;
  Double gnpOld;
  Double gnp;
  Double lifeExpectancy;
  Long population;
  Integer indepYear;
  Integer surfaceArea;
  String region;
  String continent;
  String name;
  String code;
}

// 자바는 상수를 정의할 때만 '_'를 쓴다. 
// 