xquery version "3.1";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $doc := tei:TEI;

declare function local:transform($originals as node()*) {
    for $original in $originals
    return
        typeswitch ($original)
           case text() return $original
           case element(tei:TEI) return 
               <html xmlns="http://www.w3.org/1999/xhtml">{local:transform($original/node())}</html>
           case element(tei:teiHeader) return
                <head>{local:transform($original/node())}</head>
           case element(tei:fileDesc) return
                <title>{local:transform($original//tei:title/node())}</title>
           case element(tei:text) return
                <body>{local:transform($original/tei:body/node())}</body>
           case element(tei:div) return
                <div>{local:transform($original/node())}</div>
           case element(tei:head) return
                if ($original/@type eq "sub") then <h3>{local:transform($original/node())}</h3>
                else <h2>{local:transform($original/node())}</h2>
           case element(tei:p) return
                if ($original/element(tei:p)/element(tei:foreign)) then 
                    <p>{local:transform($original/node())}</p>
                else if ($original/element(tei:p)/element(tei:quote)) then 
                    <p>{local:transform($original/node())}</p>
                else <p>{local:transform($original/node())}</p>
           case element(tei:foreign) return
                <p>{local:transform($original/node())}</p>
           case element(tei:placeName) return
                <a href="{concat("./Standoff.xhtml", $original/@ref)}"> 
                {local:transform($original/node())} </a>
           case element(tei:persName) return
                <a href="{concat("./Standoff.xhtml", $original/@ref)}"> 
                {local:transform($original/node())} </a>
           case element(tei:orgName) return
                <a href="{concat("./Standoff.xhtml", $original/@ref)}"> 
                {local:transform($original/node())} </a>
                   
            default return ()
};

local:transform($doc)
