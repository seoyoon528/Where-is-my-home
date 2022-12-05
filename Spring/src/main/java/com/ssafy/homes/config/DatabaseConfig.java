package com.ssafy.homes.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration	// spring bean configuration file (root-context.xml, servlet-context.xml 파일을 대신하는 자바. 스프링 객체 저장소)
@MapperScan(basePackages = "com.ssafy.homes.model.dao")	// 인터페이스 매퍼(DAO) 스캔
public class DatabaseConfig {

}
