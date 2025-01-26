<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ead="urn:isbn:1-931666-22-9"
                xmlns:oai="http://www.openarchives.org/OAI/2.0/">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <collection xmlns="http://www.loc.gov/MARC21/slim">
            <xsl:apply-templates select="//ead:ead"/>
        </collection>
    </xsl:template>

    <xsl:template match="ead:ead">
        <record>
            <xsl:apply-templates select="ead:eadheader"/>
            <xsl:apply-templates select="ead:archdesc"/>
        </record>
    </xsl:template>

    <xsl:template match="ead:eadheader">
        <datafield tag="245" ind1="1" ind2="0">
            <subfield code="a">
                <xsl:value-of select="ead:filedesc/ead:titlestmt/ead:titleproper"/>
            </subfield>
            <subfield code="n">
                <xsl:value-of select="ead:filedesc/ead:titlestmt/ead:titleproper/ead:num"/>
            </subfield>
            <subfield code="c">
                <xsl:value-of select="ead:filedesc/ead:titlestmt/ead:author"/>
            </subfield>
        </datafield>
        <datafield tag="260" ind1=" " ind2=" ">
            <subfield code="b">
                <xsl:value-of select="ead:filedesc/ead:publicationstmt/ead:publisher"/>
            </subfield>
            <subfield code="c">
                <xsl:value-of select="ead:filedesc/ead:publicationstmt/ead:p/ead:date"/>
            </subfield>
        </datafield>
        <datafield tag="040" ind1=" " ind2=" ">
            <subfield code="a">Original cataloging agency</subfield>
            <subfield code="c">Transcribing agency</subfield>
        </datafield>
        <datafield tag="041" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:profiledesc/ead:langusage/ead:language/@langcode"/>
            </subfield>
        </datafield>
        <datafield tag="546" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:profiledesc/ead:langusage/ead:language"/>
            </subfield>
        </datafield>
    </xsl:template>

    <xsl:template match="ead:archdesc">
        <datafield tag="110" ind1="2" ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:did/ead:repository/ead:corpname"/>
            </subfield>
        </datafield>
        <datafield tag="245" ind1="1" ind2="0">
            <subfield code="a">
                <xsl:value-of select="ead:did/ead:unittitle"/>
            </subfield>
        </datafield>
        <datafield tag="100" ind1="1" ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:did/ead:origination/ead:persname"/>
            </subfield>
        </datafield>
        <datafield tag="300" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:did/ead:physdesc/ead:extent"/>
            </subfield>
            <subfield code="c">
                <xsl:value-of select="ead:did/ead:physdesc/ead:dimensions"/>
            </subfield>
        </datafield>
        <datafield tag="520" ind1="2" ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:did/ead:abstract"/>
            </subfield>
        </datafield>
        <datafield tag="506" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:accessrestrict/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="561" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:acqinfo/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="545" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:bioghist/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="583" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:processinfo/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="524" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:prefercite/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="555" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:relatedmaterial/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="520" ind1="2" ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:scopecontent/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="540" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:userestrict/ead:p"/>
            </subfield>
        </datafield>
        <datafield tag="561" ind1=" " ind2=" ">
            <subfield code="a">
                <xsl:value-of select="ead:odd/ead:p"/>
            </subfield>
        </datafield>
    </xsl:template>
</xsl:stylesheet>