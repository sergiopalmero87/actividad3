<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Este XSLT hará la transformación de un XML a otro. El output method resultante será un XML-->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<!-- Creamos el template-->
    <xsl:template match="/">
    
    <!-- Creamos una etiqueta instituto la cual englobará todo. Elegimos una estructura que haga más legible la información ya que está más ordenada.-->
        <instituto>
    <!-- Le damos al instituo los atributos nombre y web seleccionando los del xml anterior con @-->
            <xsl:attribute name="nombre"><xsl:value-of select="/ite/@nombre"></xsl:value-of></xsl:attribute>
            <xsl:attribute name="web"><xsl:value-of select="/ite/@web"></xsl:value-of></xsl:attribute>

    <!-- Creamos etiqueta grupo y dentro le ponemos el valor de empresa del xml antiguo.-->
            <grupo>
                <xsl:value-of select="/ite/empresa"></xsl:value-of>
            </grupo>

    <!-- Creamos etiqueta telefonoContacto y dentro le pasamos el valor de telefono del xml antiguo.-->
            <telefonoContacto>
                <xsl:value-of select="/ite/telefono"></xsl:value-of>
            </telefonoContacto>

    <!-- Creamos etiqueta directiva que engloba a los puestos que se ocupan de la dirección del centro.-->
            <directiva>

    <!-- Creamos etiqueta director y dentro las etiquetas id y nombre con los valores del xml antiguo.-->
                <director>                    
                    <nombre><xsl:value-of select="/ite/director/nombre"></xsl:value-of></nombre>
                    <despacho><xsl:value-of select="/ite/director/despacho"></xsl:value-of></despacho>
                </director>

    <!-- Creamos etiqueta jefe_estudios y dentro las etiquetas nombre y despacho con los valores del xml antiguo.-->
                <jefe_estudios>
                    <nombre><xsl:value-of select="/ite/jefe_estudios/nombre"></xsl:value-of></nombre>
                    <despacho><xsl:value-of select="/ite/jefe_estudios/despacho"></xsl:value-of></despacho>
                </jefe_estudios>
            </directiva>

    <!-- Creamos etiqueta claustro donde incluiremos al personal docente del instituto. Vamos a cambiar la etiqueta id del XML original
    y la vamos a incluir en el XML transformado como atributo del profesor -->
            <claustro>
                    <xsl:for-each select="/ite/profesores/profesor">
                        <profesor>
                            <xsl:attribute name="id"><xsl:value-of select="id"></xsl:value-of></xsl:attribute>
                            <nombre><xsl:value-of select="nombre"></xsl:value-of></nombre>
                        </profesor>
                    </xsl:for-each>
            </claustro>

    <!-- Creamos la etiqueta estudiosFP dentro de la cual integramos la información de los ciclos de Formacion Profesional
    del XML original. En este caso cambiamos el atributo id del XML original para incluirlo como etiqueta en el XML transformado-->
            <estudiosFP>
                <xsl:for-each select="/ite/ciclos/ciclo">
                    <ciclo>
                        <id><xsl:value-of select="@id"></xsl:value-of></id>
                        <nombre><xsl:value-of select="nombre"></xsl:value-of></nombre>
                        <grado><xsl:value-of select="grado"></xsl:value-of></grado>
                        <decretoTitulo>
                            <xsl:attribute name="año"><xsl:value-of select="/ite/ciclos/ciclo/decretoTitulo/@año"></xsl:value-of></xsl:attribute>
                        </decretoTitulo>
                    </ciclo>
                </xsl:for-each>
            </estudiosFP>
        </instituto>
    </xsl:template>
</xsl:stylesheet>