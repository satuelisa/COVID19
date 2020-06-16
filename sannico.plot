set term postscript eps color size 20cm, 25cm
set output 'sannico.eps'
set multiplot layout 4, 1

stats 'sannico.dat' using 3
y3=STATS_max
stats 'sannico.dat' using 4
y4=STATS_max
stats 'sannico.dat' using 2
y2=STATS_max
stats 'sannico.dat' using 5
y5=STATS_max

f(x) = a * x + b
fit f(x) 'trend.dat' via a, b

set xlabel 'Fecha'
set xdata time
set timefmt "%Y/%m/%d"
set format x "%Y/%m/%d"
set xtics rotate by 90 right
set ytics 0, 20
set pointsize 1.5
set key off
set autoscale xfix

set title 'San Nico COVID-19: acumulado total de confirmados'
set yrange [0:y2*1.1]
set ytics 0, 50
plot 'sannico.dat' using 1:2 with linespoints lt 1 lw 3 pt 5 lc rgb '#9cb380'

set title 'San Nico COVID-19: nuevos confirmados'
set yrange [0:y3*1.1]
set ytics 0, 5
set ylabel 'Casos'
plot 'sannico.dat' using 1:3 with linespoints lt -1 lw 3 pt 7 lc rgb '#c59849'

secondsInADay = 24 * 60 * 60
end = GPVAL_X_MAX
start = GPVAL_X_MAX - 7 * secondsInADay

set title 'San Nico COVID-19: promedio semanal de nuevos confirmados'
set yrange [0:y5*1.1]
set ytics 0, 5
set ylabel 'Casos'
plot x > start ? b + a * (x - start) / secondsInADay : 1/0 with lines lt -1 lw 16 lc rgb '#a6d49f', \
     'sannico.dat' using 1:5 with linespoints lt -1 lw 3 pt 7 lc rgb '#c73e1d'

set title 'San Nico COVID-19: acumulado quincenal (estimado de casos activos)'
set yrange [0:y4*1.1]
set ytics 0, 20
plot 'sannico.dat' using 1:4 with linespoints lt 2 lw 3 pt 5 lc rgb '#522a27'




