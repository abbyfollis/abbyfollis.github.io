xquery version "3.1";

declare context item := document {
<books>
    <book n="1">
        <title>The Nazi Conscience</title>
        <author>Claudia Koonz</author>
        <date year="2003">2003</date>
        <publisher>
            <city>Cambridge</city>
            <press>Belknap Press</press>
        </publisher>        
    </book>
    <book n="2">
     <title>Growing Up Female in Nazi Germany: Social History, Popular Culture, and Politics in Germany</title>
        <author>Dagmar Reese</author>
        <date year="2006">2006</date>
        <publisher>
            <city>Ann Arbor</city>
            <press>University of Michigan Press</press>
        </publisher>
    </book>
    <book n="3">
     <title>Hitler's True Believers: How Ordinary People Became Nazis</title>
        <author>Robert Gellately</author>
        <date year="2020">2020</date>
        <publisher>
            <city>New York</city>
            <press>Oxford University Press</press>
        </publisher>
    </book>
    <book n="4">
     <title>The Racial State: Germany 1933-1945</title>
        <author>Michael Burleigh</author>
        <date year="1991">1991</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
    </book>
    <book n="5">
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

for $book in books/book (:[fn:contains(title, "Nazi")]:)
    
    (:Where clause assignment is above and below:)
    (:where fn:contains($book/title, "Nazi"):)
    
    
    let $author := $book/author
    let $title := $book/title
    let $date := $book/date
    let $press := $book/publisher/press

    (:order by parts of the question:)
    (:order by $author:)
    (:order by $title:)
    (:order by $date:)
    order by $date descending

return
    <bibl>
        {fn:concat($author, ". ", $title, ". ", $press, ". ", $date)}
    </bibl>



