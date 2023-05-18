<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Nos situamos en el nodo raíz-->
    <xsl:template match="/">
    <!-- Generamos un HTML-->
        <html>
            <head>
                <title>Instituto Edix</title>
                <link rel="shortcut icon" href="logo/logo.jpeg" type="image/x-icon"></link>
                <link rel="stylesheet" href="css/estilos.css" ></link>
            </head>

            <body>
            <!-- Creamos div header que englobe la información del instituto-->
                <!--Creamos h1 y h3 con nombre del instituto, empresa y número contacto -->
                <div class="header">
                    <h3><span>Empresa: </span><xsl:value-of select="ite/empresa"/></h3>
                    <h1><xsl:value-of select="ite/@nombre"/></h1>
                    <h3><span>Contacto: </span><xsl:value-of select="ite/telefono"/></h3>
                </div>

            <!-- Creamos un div jefes que englobe a director y a jefe de estudios y poder darle estilo con css-->
                <div class="jefes">

                    <!--Utilizamos ruta absoluta para situarnos dentro del nodo director que está dentro del nodo raíz.
                    Y así accedemos a nombre y despacho. Lo englobamos en un div para dar estilo con css-->
                    <div class="director">
                        <h3><span>Nombre director: </span> <xsl:value-of select="ite/director/nombre"/></h3>
                        <h3><span>Despacho: </span> <xsl:value-of select="ite/director/despacho"/></h3>
                    </div>

                <!--Utilizamos ruta absoluta para situarnos dentro del nodo jefe_estudios que está dentro del nodo raíz.
                Y así accedemos a nombre y despacho. Lo englobamos en un div para dar estilo con css -->
                    <div class="jefe_estudios">
                        <h3><span>Nombre jefe de estudios: </span> <xsl:value-of select="ite/jefe_estudios/nombre"/></h3>
                        <h3><span>Despacho: </span> <xsl:value-of select="ite/jefe_estudios/despacho"/></h3>
                    </div>
                </div>
            
            <!--Creamos un div tablas que engloba a las dos tablas que hemos hecho. Así podemos darle estilo con css -->
                <!-- Tabla 1. La englobamos en div tabla_profesores para dar estilo css-->
                <div class="tablas">
                    <div class="tabla_profesores">
                        <h3>Tabla de profesores</h3><br/>
                        <table border="1">
                            <thead>
					            <tr>
						            <th>Id</th>
						            <th>Nombre</th>
					            </tr>
				            </thead>
				            <tbody>
                    <!--Utilizamos for each para situarnos dentro del nodo profesor que está dentro del nodo profesores,
                    que a su vez está dentro del nodo raíz.-->
					            <xsl:for-each select="ite/profesores/profesor">
						            <tr>
						                <td><xsl:value-of select="id"/></td>
							            <td><xsl:value-of select="nombre"/></td>
						            </tr>
					            </xsl:for-each>
				            </tbody>
                        </table>
                    </div>
                    <!-- Tabla 2. La englobamos en div para dar estilo css-->
                    <div class="tabla_ciclos">
                        <h3>Tabla de ciclos</h3><br/>
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
                    que a su vez está dentro del nodo raíz.-->
				            <tbody>
					            <xsl:for-each select="ite/ciclos/ciclo">
						            <tr>
							            <td><xsl:value-of select="nombre"/></td>
							            <td><xsl:value-of select="@id"/></td>
                                        <td><xsl:value-of select="grado"/></td>
							            <td><xsl:value-of select="decretoTitulo/@año"/></td>
						            </tr>
					            </xsl:for-each>
				            </tbody>
                        </table>
                    </div>
                </div>
            <!--Creamos un div listas para englobar a las listas que vamos a hacer y darle estilo css -->
                <!-- Lista de profesores. Lo englobamos en div lista_profesores -->
                <div class="listas">
                    <div class="lista_profesores">
                        <h3>Lista de profesores</h3><br/>
                        <ol>
                            <xsl:for-each select="ite/profesores/profesor">
                                <li><xsl:value-of select="nombre"/></li>
                            </xsl:for-each>
                        </ol>
                    </div>
                <!--Lista de ciclos. Lo englobamos en div lista_ciclos -->
                    <div class="lista_ciclos">
                        <h3>Lista de ciclos</h3>
                        <ul>
                            <xsl:for-each select="ite/ciclos/ciclo/">
                                <li><xsl:value-of select="nombre"/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
            <!--Creamos div formulario para englobar a todo el formulario y dar estilo css -->    
                <!-- Formulario -->
                <div class="formulario">
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
                </div>

            <!--Creamos div enlaces para englobar a los enlaces y dar estilo css -->
                <!--Enlaces -->
                <div class="enlace">
                    <h3>Enlaces</h3><br/>
                    <a href="https://institutotecnologico.edix.com" target="__BLANK">Página Web: <xsl:value-of select="ite/@web"/></a>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>