xquery version "3.1";

(:Exercise 1:)
declare namespace tei ="http://www.tei-c.org/ns/1.0";

<tei:title>
    {fn:concat("Harry Potter", ": ", "And the Philosopher's Stone")}
</tei:title>
