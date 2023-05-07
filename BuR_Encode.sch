<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
<!-- This should make sure that each org must have a @ref attribute as outlined in the Standoff -->
        <sch:rule context="tei:text//tei:orgName/@ref">
            <sch:let name="standoff"
                value="doc('https://raw.githubusercontent.com/abbyfollis/abbyfollis.github.io/main/StandoffMarkup.xml')"/>
            <sch:let name="RaceIDs"
                value="$standoff//tei:org/@xml:id"/>
            <sch:let name="racerefIDs" value="for $i in $RaceIDs return concat('#', $i)"/>
            <sch:let name="error" value="."/>
            <sch:assert test=". = $racerefIDs"
                ><sch:value-of select="$error"/>
                
            </sch:assert>
        </sch:rule>
        <!--This should make sure that each placename is appropriately pointed to a ref in the Standoff Markup-->
        <sch:rule context="tei:text//tei:place/@ref">
            <sch:let name="standoff"
                value="doc('https://raw.githubusercontent.com/abbyfollis/abbyfollis.github.io/main/StandoffMarkup.xml')"/>
            <sch:let name="location"
                value="$standoff//tei:place/@xml:id"/>
            <sch:let name="LocationOfRace" value="for $i in $location return concat('#', $i)"/>
            <sch:let name="error" value="."/>
            <sch:assert test=". = $LocationOfRace">
                <sch:value-of select="$error"/>
                is not a real place.
            </sch:assert>
        </sch:rule>
<!--This should make sure that the only language used throughout is German-->
        <sch:rule context="tei:foreign">
            <sch:let name="Encode" 
                value="doc('https://raw.githubusercontent.com/abbyfollis/abbyfollis.github.io/main/BuR_Encode.xml')"/>
            <sch:let name="language"
                value="$Encode//foreign/@xml:lang"/>
            <sch:let name="error" value="."/>
            <sch:assert test="@xml:lang = 'de'">
                <sch:value-of select="$error"/>
                is not acceptble. It should only be in German >:(
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>

<!--Need to put things in the elementspec (look at Schwartz example)-->