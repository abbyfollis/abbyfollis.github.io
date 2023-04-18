xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";


let $words := "When in the course of of human events."
for $word in $words
    return
        if (fn:codepoint-equal($words//$words)) then
            true()
        else
            false()

