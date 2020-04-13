echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 5));
declare monthlyAttendance;
isPartTimeEmployee=$(( RANDOM % 4));
absentsInMonth=0;
dailyWage=0;
hoursOfWork=0;
wagePerHour=20;
workingDays=20;
monthlyWage=0;

case $isPresent in
    0)  
        echo "not present" ;;
    *)  
        echo "present"
        case $isPartTimeEmployee in
            1)  
                echo "Part Time Employee" 
                hoursOfWork=4 ;;
            *)  
                echo "Full Time Employee";
                hoursOfWork=8 ;;
        esac
    ;;
esac

dailyWage=$(( $hoursOfWork * $wagePerHour));
echo $dailyWage;

for (( counter=1; counter<=$workingDays; counter++ ))
do
    temp=$(( RANDOM % 5));
    monthlyAttendance[$counter]=$temp;
    if (( $temp == 0 )); then
        absentsInMonth=$(( $absentsInMonth + 1));
    fi
done

monthlyWage=$(( $(( 20- $absentsInMonth )) * $(($wagePerHour * 8)) ));
echo $monthlyWage;










