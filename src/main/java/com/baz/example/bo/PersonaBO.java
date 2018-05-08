package com.baz.example.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.baz.example.dominio.Persona;

@Component
public class PersonaBO 
{
	/**
	 * Contruye una lista de Objetos Persona y lo devuleve
	 * @return
	 */
	public List<Persona> list()
	{
		Persona p1 = new Persona();
		p1.setNombre("Agustin");
		p1.setApellidoPaterno("Morales");
		p1.setApellidoMaterno("Lorenzo");
		p1.setEdad(26);
		p1.setSexo('H');
		
		List<Persona> personas = new ArrayList<Persona>();
		personas.add(p1);
		personas.add(p1);
		personas.add(p1);
		
		return personas;
	}
}
