<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<!-- Este XSLT hará la transformación de un XML a otro. El output method resultante será un XML.
Gracias a XPATH somos capaces de situarnos dentro de los nodos que necesitemos para ir creando el nuevo XML. -->

<!-- Creamos el template-->
    <xsl:template match="/">
    
    <!-- Creamos una etiqueta instituto la cual englobará todo. Elegimos una estructura que haga más legible la información ya que está más ordenada.-->
        <instituto>
    <!-- Le damos al instituo los atributos nombre y web seleccionando los del xml anterior con @-->
            <xsl:attribute name="nombre"><xsl:value-of select="ite/@nombre"></xsl:value-of></xsl:attribute>
            <xsl:attribute name="web"><xsl:value-of select="ite/@web"></xsl:value-of></xsl:attribute>

    <!-- Creamos etiqueta empresa y dentro le ponemos el valor de empresa del xml antiguo.-->
            <empresa>
                <xsl:value-of select="ite/empresa"></xsl:value-of>
            </empresa>

    <!-- Creamos etiqueta telefono y dentro le ponemos el valor de telefono del xml antiguo.-->
            <telefono>
                <xsl:value-of select="ite/telefono"></xsl:value-of>
            </telefono>

    <!-- Creamos etiqueta personal que engloba a todos los trabajadores del intituto. Además los ordenamos de mayor a menor puesto.-->
            <personal>

    <!-- Creamos etiqueta director y dentro las etiquetas id y nombre con los valores del xml antiguo.-->
                <director>
                    <id><xsl:value-of select="ite/director/id"></xsl:value-of></id>
                    <nombre><xsl:value-of select="ite/director/nombre"></xsl:value-of></nombre>
                </director>

    <!-- Creamos etiqueta jefe_estudios y dentro las etiquetas nombre y despacho con los valores del xml antiguo.-->
                <jefe_estudios>
                    <nombre><xsl:value-of select="ite/jefe_estudios/nombre"></xsl:value-of></nombre>
                    <despacho><xsl:value-of select="ite/jefe_estudios/despacho"></xsl:value-of></despacho>
                </jefe_estudios>

    <!-- Creamos etiqueta profesores. Dentro de esta, creamos nodos profesor
    y dentro de estas las etiquetas id y nombre con los valores del xml antiguo. Utilizamos for-each.-->
                <profesores>
                    <xsl:for-each select="ite/profesores/profesor">
                        <profesor>
                            <id><xsl:value-of select="id"></xsl:value-of></id>
                            <nombre><xsl:value-of select="nombre"></xsl:value-of></nombre>
                        </profesor>
                    </xsl:for-each>
                </profesores>
            </personal>

    <!-- Creamos la etiqueta ciclos. Dentro de esta, creamos nodos ciclo 
    y dentro de estas el atributo id, las etiquetas nombre y grado con los valores del xml antiguo
    y una última etiqueta decretoTitulo con un atributo año que referencia al @año del xml antiguo.-->
            <ciclos>
                <xsl:for-each select="ite/ciclos/ciclo">
                    <ciclo>
                        <xsl:attribute name="id"><xsl:value-of select="@id"></xsl:value-of></xsl:attribute>
                        <nombre><xsl:value-of select="nombre"></xsl:value-of></nombre>
                        <grado><xsl:value-of select="grado"></xsl:value-of></grado>
                        <decretoTitulo>
                            <xsl:attribute name="año"><xsl:value-of select="ite/ciclos/ciclo/@año"></xsl:value-of></xsl:attribute>
                        </decretoTitulo>
                    </ciclo>
                </xsl:for-each>
            </ciclos>

        </instituto>

    </xsl:template>
</xsl:stylesheet>