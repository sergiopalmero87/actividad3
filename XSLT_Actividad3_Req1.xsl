<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Las 2 tablas seran de profesores y de ciclos-->
<!-- Los 2 enlaces seran de algun nombre de algun ciclo-->
<!-- Lista ordenada de los nombres de los profes-->
<!-- formulario de contacto-->
<!-- html a mi gusto-->

<xsl:template match="/">
    <html>
        <head>
            <title>Instituto Edix.</title>
            <link rel="stylesheet" href="css/estilos.css" ></link>
        </head>

        <body>
            <h1><xsl:value-of select="empresa"/></h1>
            <h2><xsl:value-of select="telefono"/></h2>

            <!-- Tabla 1-->
            <table border="1">
                <thead>
					<tr>
						<th>Id</th>
						<th>Nombre</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="profesores/profesor">
						<tr>
						    <td><xsl:value-of select="id"/></td>
							<td><xsl:value-of select="nombre"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
            </table>

            <!-- Lista de profesores -->
            <ol>
                <xsl:for-each select="profesores/profesor">
                    <li><xsl:value-of select="nombre"/></li>
                </xsl:for-each>
            </ol>
               

            <!-- Tabla 2-->
            <table border="1">
                <thead>
					<tr>
						<th>Nombre</th>
                        <th>Id</th>
						<th>Grado</th>
                        <th>decretoTitulo</th>
					</tr>
				</thead>
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

            <!-- Formulario -->
            <form>
                <xsl:for-each select="/">
                    <p>Formulario de contacto</p>
                    
                </xsl:for-each>
            </form>

            <!--Enlaces -->
            <a href=""><xsl:value-of select="profesores"/>Enlace a información de profesores</a>
            <a href=""><xsl:value-of select="ciclos"/>Enlace a información de los ciclos</a>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>