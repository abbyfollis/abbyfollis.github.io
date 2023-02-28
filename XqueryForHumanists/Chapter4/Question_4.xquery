xquery version "3.1";

declare context item := document {
<name>
    <firstname>Abby</firstname>
    <surname>Follis</surname>
</name>
};

fn:string-length(/name/surname)


