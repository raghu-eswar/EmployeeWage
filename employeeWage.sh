echo "welcome to empwage computation";

isPresent=$(( RANDOM  % 3));
if (( $isPresent == 0)); then
    echo "not present";
else
    echo "present";
fi
