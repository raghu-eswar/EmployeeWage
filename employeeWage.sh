echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 3));
if (( $isPresent == 0)); then
    echo "not present";
else
    echo "present";
fi

dailyWage=0;
hoursOfWork=0;
wagePerHour=20;
if (( $isPresent != 0)); then
    hoursOfWork=8;
    dailyWage=$(( $hoursOfWork * $wagePerHour));
fi
echo $dailyWage;
