<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:EAD="urn:isbn:1-931666-22-9"
    xmlns="http://www.loc.gov/MARC21/slim"
    exclude-result-prefixes="EAD">

    <xsl:output method="xml" indent="yes"/>

    <!-- Root: MARC Collection -->
    <xsl:template match="/">
        <collection>
            <xsl:apply-templates select="//EAD:archdesc"/>
            <xsl:apply-templates select="//EAD:c"/>
        </collection>
    </xsl:template>

    <!-- Record für archdesc (Bestand) -->
    <xsl:template match="EAD:archdesc">
        <record>
            <controlfield tag="001">
                <xsl:value-of select="EAD:did/EAD:unitid[@type='refCodeOld' or not(@type)]"/>
            </controlfield>
            <datafield tag="245" ind1="1" ind2="0">
                <subfield code="a">
                    <xsl:value-of select="EAD:did/EAD:unittitle"/>
                </subfield>
            </datafield>
            <xsl:if test="EAD:did/EAD:langmaterial/EAD:language">
                <datafield tag="041" ind1=" " ind2=" ">
                    <subfield code="a">
                        <xsl:value-of select="EAD:did/EAD:langmaterial/EAD:language"/>
                    </subfield>
                </datafield>
            </xsl:if>
            <xsl:if test="EAD:did/EAD:physdesc/EAD:extent">
                <datafield tag="300" ind1=" " ind2=" ">
                    <subfield code="a">
                        <xsl:value-of select="EAD:did/EAD:physdesc/EAD:extent"/>
                        <xsl:if test="EAD:did/EAD:physdesc/EAD:extent/@unit">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="EAD:did/EAD:physdesc/EAD:extent/@unit"/>
                        </xsl:if>
                    </subfield>
                </datafield>
            </xsl:if>
            <xsl:if test="EAD:accessrestrict/EAD:p">
                <datafield tag="506" ind1=" " ind2=" ">
                    <subfield code="a">
                        <xsl:value-of select="EAD:accessrestrict/EAD:p"/>
                    </subfield>
                </datafield>
            </xsl:if>
            <xsl:if test="EAD:acqinfo/EAD:p">
                <datafield tag="561" ind1=" " ind2=" ">
                    <subfield code="a">
                        <xsl:value-of select="EAD:acqinfo/EAD:p"/>
                    </subfield>
                </datafield>
            </xsl:if>
            <!-- 774 für direkte Kinder -->
            <xsl:for-each select="EAD:dsc/EAD:c">
                <xsl:if test="EAD:did/EAD:unitid">
                    <datafield tag="774" ind1=" " ind2=" ">
                        <subfield code="w">
                            <xsl:value-of select="EAD:did/EAD:unitid"/>
                        </subfield>
                    </datafield>
                </xsl:if>
            </xsl:for-each>
        </record>
    </xsl:template>

    <!-- Record für jede Komponente -->
    <xsl:template match="EAD:c">
        <record>
            <controlfield tag="001">
                <xsl:value-of select="EAD:did/EAD:unitid"/>
            </controlfield>
            <datafield tag="245" ind1="1" ind2="0">
                <subfield code="a">
                    <xsl:value-of select="EAD:did/EAD:unittitle"/>
                </subfield>
            </datafield>
            <xsl:if test="EAD:did/EAD:physdesc/EAD:extent">
                <datafield tag="300" ind1=" " ind2=" ">
                    <subfield code="a">
                        <xsl:value-of select="EAD:did/EAD:physdesc/EAD:extent"/>
                        <xsl:if test="EAD:did/EAD:physdesc/EAD:extent/@unit">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="EAD:did/EAD:physdesc/EAD:extent/@unit"/>
                        </xsl:if>
                    </subfield>
                </datafield>
            </xsl:if>
            <!-- Parent-Referenz -->
            <xsl:if test="parent::EAD:c or parent::EAD:dsc">
                <datafield tag="773" ind1=" " ind2=" ">
                    <subfield code="w">
                        <xsl:value-of select="parent::*/EAD:did/EAD:unitid"/>
                    </subfield>
                </datafield>
            </xsl:if>
            <!-- 774 für direkte Kinder -->
            <xsl:for-each select="EAD:c">
                <xsl:if test="EAD:did/EAD:unitid">
                    <datafield tag="774" ind1=" " ind2=" ">
                        <subfield code="w">
                            <xsl:value-of select="EAD:did/EAD:unitid"/>
                        </subfield>
                    </datafield>
                </xsl:if>
            </xsl:for-each>
        </record>
    </xsl:template>
</xsl:stylesheet>