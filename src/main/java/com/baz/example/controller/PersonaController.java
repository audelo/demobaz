package com.baz.example.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baz.example.bo.PersonaBO;
import com.baz.example.dominio.Persona;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

@RestController
public class PersonaController 
{
	@Autowired
	PersonaBO personaBO;
	private static final Logger log = Logger.getLogger(PersonaController.class.getName());
	
	@Value("${mensaje}")
    private String saludo;
	
	@HystrixCommand(fallbackMethod = "getMxHystrixFallbackMethod")
	@RequestMapping("/persona/list")
	public List<Persona> list()
	{
		log.info(">>>Consumiendo Servicio GET LISTA PERSONAS<<<");
		return personaBO.list();
	}
	
	
	@RequestMapping(value = "/saludar", method = RequestMethod.GET)
    public String getUserAdmins() 
	{
		log.info(">>>Consumiendo Servicio GET SALUDAR<<<");
        return saludo;
    }
	
	
	
	
	
	private String getMxHystrixFallbackMethod()
	{
        return "El servicio NO se encuentra disponible. Inténtelo más tarde.";
    }
}