<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
        <head>
        <!-- Añadimos un título a nuestra web-->
        <title>EDIX</title>
            <body>
            <h1><xsl:value-of select="ite/@nombre"/></h1>
            <!-- Creamos la primera tabla con los profesores-->
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Profesores</th>
                    </tr>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="ite/profesores/profesor">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                        </tr>
                    </xsl:for-each> 
                </tbody>
            </table>
            <!-- Creamos dos listas desordenadas, una para el director y otra para el jefe de estudios-->
            <h2>Director</h2>
            <ul>
                <li><xsl:value-of select="/ite/director/nombre"/></li>
                <li><xsl:value-of select="/ite/director/despacho"/></li>
            </ul>

            <h2>Jefe de Estudios</h2>
            <ul>
                <li><xsl:value-of select="/ite/jefe_estudios/nombre"/></li>
                <li><xsl:value-of select="/ite/jefe_estudios/despacho"/></li>
            </ul>
            <br/>
            <br/>
            <!-- Creamos la segunda tabla con los ciclos-->
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="3">Ciclos</th>
                    </tr>
                    <tr>
                        <th>Nombre</th>
                        <th>Grado</th>
                        <th>Año de Decreto</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="ite/ciclos/ciclo">
                        <tr>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="grado"/></td>
                            <td><xsl:value-of select="decretoTitulo/@año"/></td>
                        </tr>
                    </xsl:for-each> 
                </tbody>
            </table>
            <br/>
            <br/>
            <!-- Creamos varios enlaces para el instituto y proeduca-->
            <a href="https://institutotecnologico.edix.com"><xsl:value-of select="/ite/@nombre"/></a><br/><br/>
            <a href="https://www.grupoproeduca.com/"><xsl:value-of select="/ite/empresa"/></a><br/><br/>
            <a><xsl:value-of select="/ite/telefono"/></a><br/><br/>
            <!-- Creamos un formulario de contacto-->
            <h3>Formulario de contacto</h3><br/>
                    <form action="procesarPeticion.jsp" method="get">
                        <fieldset>
                            <legend>Solicita información: </legend>

                            <label for="nombre">Nombre: </label>
                            <input id="nombre" type="text" name="nombre" placeholder="Escriba su nombre"/>
                            <br/>

                            <label for="apellidos">Apellidos: </label>
                            <input id="apellido" type="text" name="apellido" placeholder="Escriba sus apellidos"/>
                            <br/>

                            <label for="email">Email: </label>
                            <input id="email" type="text" name="email" placeholder="Escriba su email"/>
                            <br/>
                        
                            <label for="telefono">Teléfono: </label>
                            <input id="telefono" type="tel" name="telefono" placeholder="Escriba su número" />
                            <br/><br/>

                            <input type="submit" id="enviar" value="Enviar datos"/>
                            <input type="reset" value="Resetear"/>

                        </fieldset>
                    </form>
            </body>
        </head>        
        </html>
    </xsl:template>
</xsl:stylesheet>