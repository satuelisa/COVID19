tac sannico.txt > sannico.in
python3 sannico.py > sannico.dat
tail -n 7 sannico.dat | awk '{printf("%d %s\n", NR, $5)}' > trend.dat
gnuplot sannico.plot
convert -density 200 sannico.eps sannico.png
open sannico.eps
