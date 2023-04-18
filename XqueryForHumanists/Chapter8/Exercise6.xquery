xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0"

declare function local:transform($originals as node()*)
{

for $original in $originals

typeswitch ($original)
    case text () return
        (:Don't change the text:)
    case element(tei:div) return
    case element(tei:p) return
    case element(tei:quote) return
    case element(tei:lg) return
    case element(tei:l) return
    default return


}

s