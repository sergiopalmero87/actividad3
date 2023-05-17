<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Las 2 tablas seran de profesores y de ciclos-->
<!-- Los 2 enlaces seran de algun nombre de algun ciclo-->
<!-- Lista ordenada de los nombres de los profes-->
<!-- formulario de contacto-->
<!-- html a mi gusto-->

<!-- Nos situamos en el nodo raíz-->
    <xsl:template match="/">
    <!-- Generamos un HTML-->
        <html>
            <head>
                <title>Instituto Edix.</title>
                <link rel="stylesheet" href="css/estilos.css" ></link>
            </head>

            <body>

            <!--Creamos h1 y h2 con nombre del instituto, empresa y numero contacto -->
                <h1>Nombre del instituto: <xsl:value-of select="ite/@nombre"/></h1>
                <h2>Empresa: <xsl:value-of select="empresa"/></h2>
                <h2>Contacto: <xsl:value-of select="telefono"/></h2>

            <!--Utilizamos for each para situarnos dentro del nodo director que está dentro del nodo raíz.
            "nombre y "despacho son relativas entonces a director -->
                <for-each select="ite/director">
                    <h3>Nombre director: <xsl:value-of select="nombre"/></h3>
                    <h3>Despacho: <xsl:value-of select="despacho"/></h3>
                </for-each>

            <!--Utilizamos for each para situarnos dentro del nodo jefe_estudios que está dentro del nodo raíz.
            "nombre y "despacho son relativas entonces a jefe_estudios -->
                <for-each select="ite/jefe_estudios">
                    <h3>Nombre jefe de esutios: <xsl:value-of select="nombre"/></h3>
                    <h3>Despacho: <xsl:value-of select="despacho"/></h3>
                </for-each>

            <!-- Tabla 1-->
                <h3>Tabla de profesors</h3>
                <table border="1">
                    <thead>
					    <tr>
						    <th>Id</th>
						    <th>Nombre</th>
					    </tr>
				    </thead>
				    <tbody>
                    <!--Utilizamos for each para situarnos dentro del nodo profesor que está dentro del nodo profesores,
                    que a su vez está dentro del nodo raíz.
                    "Nombre y "despacho son relativas entonces a profesor -->
					    <xsl:for-each select="profesores/profesor">
						    <tr>
						        <td><xsl:value-of select="id"/></td>
							    <td><xsl:value-of select="nombre"/></td>
						    </tr>
					    </xsl:for-each>
				    </tbody>
                </table>

            <!-- Tabla 2-->
                <h3>Tabla de ciclos</h3>
                <table border="1">
                    <thead>
					    <tr>
						    <th>Nombre</th>
                            <th>Id</th>
						    <th>Grado</th>
                            <th>decretoTitulo</th>
					    </tr>
				    </thead>
                    <!--Utilizamos for each para situarnos dentro del nodo ciclo que está dentro del nodo ciclos,
                    que a su vez está dentro del nodo raíz.
                    "Nombre y "despacho son relativas entonces a jefe_estudios -->
				    <tbody>
					    <xsl:for-each select="ciclos/ciclo">
						    <tr>
							    <td><xsl:value-of select="nombre"/></td>
							    <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="grado"/></td>
							    <td><xsl:value-of select="@año"/></td>
						    </tr>
					    </xsl:for-each>
				    </tbody>
                </table>

            <!-- Lista de profesores -->
                <h3>Lista de profesores</h3>
                <ol>
                    <xsl:for-each select="profesores/profesor">
                        <li><xsl:value-of select="nombre"/></li>
                    </xsl:for-each>
                </ol>

            <!-- Formulario -->
                <h3>Formulario de contacto</h3>
                <form action="procesarPeticion.jsp" method="get">
                    <fieldset>
                        <legend>Solicita información: </legend>

                        <label for="nombre">Nombre: </label>
                        <input id="nombre" type="text" name="nombre" placeholder="Escriba aquí su nombre"/>
                        <br/>

                        <label for="apellidos">Apellidos: </label>
                        <input id="apellido" type="text" name="apellido" placeholder="Escriba aquí sus apellidos"/>
                        <br/>

                        <label for="email">Email: </label>
                        <input id="email" type="text" name="email" placeholder="Escriba aquí su email de contacto"/>
                        <br/>
                        
                        <label for="telefono">Teléfono: </label>
                        <input id="telefono" type="tel" name="telefono" placeholder="Escriba aquí su número de contacto"/>
                        <br/>

                    </fieldset>
                </form>

            <!--Enlaces -->
                <h3>Enlaces</h3>
                <a href="https://institutotecnologico.edix.com">Página Web: <xsl:value-of select="ite/@web"/></a>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>