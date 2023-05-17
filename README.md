# actividad3

# Trabajo para actividad de Lenguajes de Marcas y Sistemas de Gestión de Información. 1º curso de DAM.

# XSLT y XPATH

---Dado el siguiente XML---

< ite nombre="Instituto Tecnológico Edix" web="https://institutotecnologico.edix.com" >

    <empresa>Proeduca</empresa>
    <telefono>+34 91 787 39 91</telefono>
    <profesores>
        <profesor>
            <id>1</id>
            <nombre>Félix</nombre>
        </profesor>
        
        <profesor>
            <id>2</id>
            <nombre>Raúl</nombre>
        </profesor>

        <profesor>
            <id>3</id>
            <nombre>Raquel</nombre>
        </profesor>

        <profesor>
            <id>4</id>
            <nombre>Tomás</nombre>
        </profesor>
    </profesores>

    <director>
        <nombre>Chon</nombre>
        <despacho>Numero 31, 3ª Planta, Edificio A</despacho>
    </director>

    <jefe_estudios>
        <nombre>Dani</nombre>
        <despacho>Numero 27, 2ª Planta, Edificio B</despacho>
    </jefe_estudios>

    <ciclos>
        <ciclo id="ASIR">
            <nombre>Administración de Sistemas Informáticos en Red</nombre>
            <grado>Superior</grado>
            <decretoTitulo año="2009"/>
        </ciclo>

        <ciclo id="DAW">
            <nombre>Desarrollo de Aplicaciones Web</nombre>
            <grado>Superior</grado>
            <decretoTitulo año="2010" />
        </ciclo>

        <ciclo id="DAM">
            <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
            <grado>Superior</grado>
            <decretoTitulo año="2010" />
        </ciclo>

    </ciclos>

< /ite>

 

--Realizar las siguientes requerimientos--

# Requerimiento 1

Mediante XSLT y XPATH, crear una página web en HTML y CSS en la que se plasme toda la información del XML. Dicha páginaweb debe contener al menos los siguientes requisitos

1. Al menos dos tablas
2. Al menos dos enlaces
3. Al menos una lista ordenada o no ordenada
4. Al menos un formulario de contacto
5. A partir de estos requisitos, los alumnos podrán decidir hacer la página HTML a su gusto.

Nota: Se valorarán los estilos utilizados (CSS)

# Requerimiento 2

Mediante XSLT y XPATH, crear un nuevo documento XML el cual contenga la misma información, pero estructurada de forma diferente. Por ejemplo, poner atributos “id” como elementos, cambiar el nombre de las etiquetas, combinar valores de etiquetas en una sola, etc.
