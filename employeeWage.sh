echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 5));
declare monthlyAttendance;
declare dailyWorkingHours;
isPartTimeEmployee=$(( RANDOM % 4));
absentsInMonth=0;
dailyWage=0;
hoursOfWork=0;
totalHoursOfWork=0;
wagePerHour=20;
workingDays=20;
monthlyWage=0;

for (( counter=1; counter<=$workingDays; counter++ ))
do
    temp=$(( RANDOM % 5));
    monthlyAttendance[$counter]=$temp;
    if (( $temp == 0 )); then
        absentsInMonth=$(( $absentsInMonth + 1));
    fi
done

for (( counter=1; counter<=$workingDays; counter++))
do
    workHours=0;
    if (( ${monthlyAttendance[$counter]} != 0)); then
        if (( $isPartTimeEmployee == 1)); then
            workHours=$(( ( RANDOM % 2 )  + 3))
        else
            workHours=$(( ( RANDOM % 2 )  + 7))
        fi
    fi
    dailyWorkingHours[$counter]=$workHours;
done

for (( counter=1; counter<=$workingDays && $totalHoursOfWork<100; counter++))
    do
    echo ${monthlyAttendance[$counter]};
    case ${monthlyAttendance[$counter]} in
        0)  
            echo "not present" ;;
        *)  
            echo "present"
            case $isPartTimeEmployee in
                1)  
                    echo "Part Time Employee" 
                    hoursOfWork=${dailyWorkingHours[$counter]};
                    toDayWage=$(( $hoursOfWork * $wagePerHour))
                    monthlyWage=$(( $monthlyWage + $toDayWage ))
                    ;;
                *)  
                    echo "Full Time Employee";
                    hoursOfWork=${dailyWorkingHours[$counter]}
                    toDayWage=$(( $hoursOfWork * $wagePerHour))
                    monthlyWage=$(( $monthlyWage + $toDayWage ))
                    ;;
            esac
        ;;
    esac
     totalHoursOfWork=$(( $totalHoursOfWork + $hoursOfWork));
done
echo $monthlyWage;








