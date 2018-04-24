package com.baz.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baz.example.bo.PersonaBO;
import com.baz.example.dominio.Persona;

@RestController
public class PersonaController 
{
	@Autowired
	PersonaBO personaBO;
	
	@RequestMapping("/persona/list")
	public List<Persona> list()
	{
		return personaBO.list();
	}
}
