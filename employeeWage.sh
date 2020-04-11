echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 6));
isPartTimeEmployee=$(( RANDOM % 4));
dailyWage=0;
hoursOfWork=0;
wagePerHour=20;
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