package com.collaboration.json;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;

public class HibernateAwareObjectMapper extends ObjectMapper {
 	private static final long serialVersionUID = 1L;

	public HibernateAwareObjectMapper() {
        Hibernate5Module hm = new Hibernate5Module();
        registerModule(hm);
    }
	
}