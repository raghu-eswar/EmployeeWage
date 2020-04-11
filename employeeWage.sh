echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 6));
isPartTimeEmployee=$(( RANDOM % 4));
dailyWage=0;
hoursOfWork=0;
wagePerHour=20;
if (( $isPresent == 0)); then
    echo "not present";
else
    echo "present";
fi

if (( $isPresent != 0)); then
    if (( $isPartTimeEmployee == 1 )); then
        hoursOfWork=4;
    else
        hoursOfWork=8;
    fi
fi
dailyWage=$(( $hoursOfWork * $wagePerHour));
echo $dailyWage;