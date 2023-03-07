xquery version "3.1";

let $names := ("Andrew", "George", "Michael", "John", "Jack")

for $name in $names
    return
        <greetings>
            {
                if ($name eq "John") then
                fn:concat("Guten Tag ", $name, ".")
                
                else fn:concat("Hello ", $name, ".")
            }
        </greetings>

