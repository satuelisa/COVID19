set encoding iso_8859_1
set term postscript eps color size 20cm, 30cm
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
set ytics 0, 100
set pointsize 1.2
set key off
set autoscale xfix

set arrow 1 from "2020/03/21", graph 0 to "2020/03/21", graph 1 nohead lw 5 lc rgb '#990000' # jornada de sana distancia inicia (no hubo datos)
set arrow 2 from "2020/06/01", graph 0 to "2020/06/01", graph 1 nohead lw 5 lc rgb '#000099' # reapertura inicia
set arrow 3 from "2020/06/25", graph 0 to "2020/06/25", graph 1 nohead lw 5 lc rgb '#990000' # freno
set arrow 4 from "2020/07/02", graph 0 to "2020/07/02", graph 1 nohead lw 5 lc rgb '#990000' # freno

show arrow 

set label 1001 "Jornada Sana" at "2020/03/23", graph 0.5 center rotate by 90 font ",22" textcolor rgb "#999999"
set label 1002 "Nueva Normalidad" at "2020/06/02", graph 0.9 left font ",22" textcolor rgb "#999999"
set label 1003 "Freno" at "2020/06/27", graph 0.05 left rotate by 90 font ",22" textcolor rgb "#999999"
set label 1004 "Restr. de Movilidad" at "2020/07/04", graph 0.05 left rotate by 90 font ",22" textcolor rgb "#999999"
set label 4 "abril" at "2020/04/15", graph 0.3 center font ",60" textcolor rgb "#cccccc"
set label 5 "mayo" at "2020/05/15", graph 0.4 center font ",60" textcolor rgb "#cccccc"
set label 6 "junio" at "2020/06/15", graph 0.6 center font ",60" textcolor rgb "#cccccc"

set title "San Nicol\341s de los Garza, Nuevo Le\363n, M\351xico: COVID-19: acumulado total de confirmados" font ",18"
set yrange [0:y2*1.1]
set ytics 0, 200
plot 'sannico.dat' using 1:2 with linespoints lt 1 lw 3 pt 5 lc rgb '#9cb380'
show label

first = GPVAL_X_MIN
last = GPVAL_X_MAX

set title 'San Nicol\341s de los Garza, Nuevo Le\363n, M\351xico: COVID-19: nuevos confirmados' font ",18"
set yrange [0:y3*1.1]
set ytics 0, 20
set ylabel 'Casos'
set xrange [first:last]
plot 'sannico.dat' using 1:3 with linespoints lt -1 lw 3 pt 7 lc rgb '#c59849'

secondsInADay = 24 * 60 * 60
start = last - 7 * secondsInADay

set title 'San Nicol\341s de los Garza, Nuevo Le\363n, M\351xico: COVID-19: promedio semanal de nuevos confirmados (con tendencia lineal)' font ",18"
set yrange [0:y5*1.1]
set ytics 0, 20
set ylabel 'Casos'
plot x > start ? b + a * (x - start) / secondsInADay : 1/0 with lines lt -1 lw 16 lc rgb '#a6d49f', \
     'sannico.dat' using 1:5 with linespoints lt -1 lw 3 pt 7 lc rgb '#c73e1d'

set title 'San Nicol\341s de los Garza, Nuevo Le\363n, M\351xico: COVID-19: acumulado quincenal (estimado de casos activos)' font ",18"
set yrange [0:y4*1.1]
set ytics 0, 100
plot 'sannico.dat' using 1:4 with linespoints lt 2 lw 3 pt 5 lc rgb '#522a27'




