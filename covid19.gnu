set datafile missing "?"
set ytics mirr
unset y2tics
set autosca y
set autosca y2
set log y
@LOGY
#set log y2
set xlabel "Date (Mars 2020)"
set ylabel "Cas confirmés, décès"
unset y2label # "Décès"
#set my2tics 10
set key t l font "Carlito,12" maxrows 5 box opaque
#set term pngcairo enhanced font "Cantarell,20" crop size 800,800

tau=4.5
#clabel=printf '%f5.1',tau
#print clabel

set label 1 sprintf("Tps de doublement\nFrance\n%4.1f jours",log(2.)*4.5) at 20,10 center font "Carlito,20" boxed front
set label 2 sprintf("ARH: %4.1f jours",log(2.)*6.5)          at 22,1300	 center rotate by 15 font "Carlito,12"
set label 3 sprintf("Grand Est: %4.1f jours",log(2.)*5)      at 22,4500	 center rotate by 20 font "Carlito,12"
set label 4 sprintf("Drôme: %4.1f jours ?",log(2.)*4.5)      at 20,160	 center rotate by 22 font "Carlito,12"
set label 5 sprintf("Isère: %4.1f jours ?",log(2.)*4.5)      at 20,80	 center rotate by 22 font "Carlito,12"
set label 6 sprintf("Décès ARH: %4.1f jours ?",log(2.)*4.5)  at 20,35	 center rotate by 22 font "Carlito,12"
set label 7 sprintf("Cas France: %4.1f jours",log(2.)*tau)   at 20,2.2e4 center rotate by 22 font "Carlito,16"
set label 8 sprintf("Décès France: %4.1f jours",log(2.)*tau) at 20,500	 center rotate by 22 font "Carlito,16"
set xrange [4:25]
plot 'covid19.dat' u 1:"Itot" w p ps 2.5 t "Cas détectés", \
     '' u 1:"Dtot" ax x1y1 w p ps 2.5 pt 6 t "Décès", \
     'covid19.dat' \
        u 1:"I_ARH" w p pt 6 ps 1.3 t "Cas Auv. R-H", \
     '' u 1:"D_ARH" w p pt 6 ps 1.3 t "Décès ARH", \
     '' u 1:"Isère" w p pt 7 ps 1.3, \
     '' u 1:"Drôme" w p pt 7 ps 1.4, \
     '' u 1:"Grand_Est" w p pt 5 ps 1.2 t "Grand Est", \
     1412*exp((x-9)/tau) w l lw 5 lc 1 not, \
     42*exp((x-10)/tau)  w l lw 5 lc 2 ax x1y1 not, \
     489*exp((x-10)/5.)  w l dt 2 lw 1 lc 8 not, \
     13*exp((x-11)/tau)  w l dt 2 lw 1 lc 8 not, \
     249*exp((x-10)/6.5) w l dt 2 lw 1 lc 8 not, \
     20*exp((x-10)/tau)  w l dt 2 lw 1 lc 8 not, \
     12*exp((x-14)/tau)  w l dt 2 lw 1 lc 8 not

exit 0

unset label 1
plot [4:16] \
     'covid19.dat' u 1:2 w p ps 2 t "Cas détectés", \
     '' u 1:3 ax x1y2 w p ps 2 pt 6 t "Décès", \
     'covid19.dat' u 1:4 w p ps 1.2 t "Région / cas", \
     '' u 1:5 w p ps 1.2 t "Isère / cas", \
     '' u 1:6 w p ps 1.2 t "Drôme / cas"
exit 0
