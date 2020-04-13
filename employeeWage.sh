echo "welcome to empwage computation";

declare monthlyAttendance;
declare dailyWorkingHours;
declare dailyWage;
isPartTimeEmployee=$(( RANDOM % 4));
absentsInMonth=0;
hoursOfWork=0;
totalHoursOfWork=0;
wagePerHour=20;
workingDays=20;
monthlyWage=0;

function getAttendance() {
    local -n declare isPresent=$1;
    for (( counter=1; counter<=$workingDays; counter++))
    do
        isPresent[$counter]=$(( RANDOM % 5));
    done
}

function getWorkHours() {
    local -n declare tempDailyWorkingHours=$1;
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
    tempDailyWorkingHours[$counter]=$workHours;
    done
}
getAttendance monthlyAttendance;
getWorkHours dailyWorkingHours;

for (( counter=1; counter<=$workingDays && $totalHoursOfWork<100; counter++))
    do
    case ${monthlyAttendance[$counter]} in
        0)  
            echo "not present" ;;
        *)  
            echo "present"
            case $isPartTimeEmployee in
                1)  
                    echo "Part Time Employee" 
                    hoursOfWork=${dailyWorkingHours[$counter]};
                    toDayWage=$(( $hoursOfWork * $wagePerHour));
                    monthlyWage=$(( $monthlyWage + $toDayWage ));
                    ;;
                *)  
                    echo "Full Time Employee";
                    hoursOfWork=${dailyWorkingHours[$counter]};
                    toDayWage=$(( $hoursOfWork * $wagePerHour));
                    monthlyWage=$(( $monthlyWage + $toDayWage ));
                    ;;
            esac
        ;;
    esac
    dailyWage[$counter]=$toDayWage;
    totalHoursOfWork=$(( $totalHoursOfWork + $hoursOfWork));
done
echo $monthlyWage;
echo ${dailyWage[@]};





