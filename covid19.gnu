set datafile missing "?"
set ytics mirr
unset y2tics
set autosca y
set autosca y2
set log y
@LOGY
#set log y2
set xlabel "Date (Mars 2020)"
set ylabel "Cas confirmés"
unset y2label # "Décès"
#set my2tics 10
set key t l font "Carlito,12" maxrows 5
#set term pngcairo enhanced font "Cantarell,20" crop size 800,800

tau=4.5
#clabel=printf '%f5.1',tau
#print clabel

set label 1 sprintf("Tps de doublement\nFrance\n%4.1f jours",log(2.)*4.5) at 18,10 center font "Carlito,20" boxed
set label 2 sprintf("%4.1f jours",log(2.)*6.5) at 22,1300 center rotate by 15 font "Carlito,14"
set label 3 sprintf("%4.1f jours",log(2.)*5)   at 22,4500 center rotate by 20 font "Carlito,14"
set xrange [4:25]
plot 'covid19.dat' u 1:2 w p ps 2 t "Cas détectés", \
     '' u 1:3 ax x1y1 w p ps 2 pt 6 t "Décès", \
     1412*exp((x-9)/tau) w l lc 1 not, \
     42*exp((x-10)/tau) w l lc 2 ax x1y1 not, \
     'covid19.dat' u 1:4 w p ps 1.2 t "Auv. R-H", \
     '' u 1:5 w p ps 1.2 t "Isère", \
     '' u 1:6 w p ps 1.2 t "Drôme", \
     '' u 1:"Grand_Est" w p ps 1.2 t "Grand Est", \
     13*exp((x-11)/tau) w l lw 1 lc 6 not, \
     489*exp((x-10)/5.) w l dt 2 lw 1 lc 8 not, \
     249*exp((x-10)/6.5) w l dt 2 lw 1 lc 8 not

exit 0

unset label 1
plot [4:16] \
     'covid19.dat' u 1:2 w p ps 2 t "Cas détectés", \
     '' u 1:3 ax x1y2 w p ps 2 pt 6 t "Décès", \
     'covid19.dat' u 1:4 w p ps 1.2 t "Région / cas", \
     '' u 1:5 w p ps 1.2 t "Isère / cas", \
     '' u 1:6 w p ps 1.2 t "Drôme / cas"
exit 0
