tac sannico.txt > sannico.in
python3 sannico.py > sannico.dat
tail -n 7 sannico.dat | awk '{printf("%d %s\n", NR, $5)}' > trend.dat
gnuplot sannico.plot
convert -density 200 sannico.eps sannico.png
if [ "$(uname)" == "Darwin" ]; then
    open sannico.eps
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    gv sannico.eps &
else
    echo 'I have no plans to use this in Win10'
    exit
fi


