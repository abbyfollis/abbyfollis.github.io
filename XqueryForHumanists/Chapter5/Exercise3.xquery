xquery version "3.1";

let $names := ("Andrew", "George", "Michael", "John", "Jack")

for $name in $names
return fn:concat("Hello ", $name, ".")


