xquery version "3.1";

declare context item := document {
<books>
    <book>
        <title>The Nazi Conscience</title>
        <author>Claudia Koonz</author>
        <date year="2003">2003</date>
        <publisher>
            <city>Cambridge</city>
            <press>Balknap Press</press>
        </publisher>        
    </book>
    <book>
     <title>Growing Up Female in Nazi Germany: Social History, Popular Culture, and Politics in Germany</title>
        <author>Dagmar Reese</author>
        <date year="2006">2006</date>
        <publisher>
            <city>Ann Arbor</city>
            <press>University of Michigan Press</press>
        </publisher>
    </book>
    <book>
     <title>Hitler's True Believers: How Ordinary People Became Nazis</title>
        <author>Robert Gellately</author>
        <date year="2020">2020</date>
        <publisher>
            <city>New York</city>
            <press>Oxford University Press</press>
        </publisher>
    </book>
    <book>
     <title>The Racial State: Germany 1933-1945</title>
        <author>Michael Burleigh</author>
        <author>Wolfgang Wippermann</author>
        <date year="1991">1991</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
    </book>
    <book>
     <title>Hitler Youth</title>
        <author>Michael Kater</author>
        <date year="2004">2004</date>
        <publisher>
            <city>Cambridge</city>
            <press>Harvard University Press</press>
        </publisher>
    </book>
</books>
};

(:Books containing a particular word in the title:)
/books/book/[fn:contains(./title, "Nazi")]

(:Books published in last three years:)
/books/book/[date/@year gt "2020"]

(:Returning Specific items:)
/books/book/identifier[fn:position() = 2]

/books/book/identifier[fn:position() = (2 to 4)]

/books/book/identifier[fn:position() = (1 to 5)]

(:Citations in Chicago:)
/books/book/identifier[fn:position() = 1](fn:concat(/book/author, /book/title, /book/publisher/city, /book/publisher/press, /book/date))
/books/book/identifier[fn:position() = 2](fn:concat(/book/author, /book/title, /book/publisher/city, /book/publisher/press, /book/date))
/books/book/identifier[fn:position() = 3](fn:concat(/book/author, /book/title, /book/publisher/city, /book/publisher/press, /book/date))
/books/book/identifier[fn:position() = 4](fn:concat(/book/author, /book/title, /book/publisher/city, /book/publisher/press, /book/date))
/books/book/identifier[fn:position() = 5](fn:concat(/book/author, /book/title, /book/publisher/city, /book/publisher/press, /book/date))
