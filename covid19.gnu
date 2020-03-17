set datafile missing "?"
set ytics mirr
unset y2tics
set autosca y
set autosca y2
set log y
@LOGY
#set log y2
set xlabel "Date (Mars 2020)"
unset ylabel # "Cas confirmés, décès"
unset y2label # "Décès"
#set my2tics 10
set key t l font "Carlito,12" maxrows 5 box opaque
#set term pngcairo enhanced font "Cantarell,20" crop size 800,800

tau=4.5
#clabel=printf '%f5.1',tau
#print clabel

aa=19.0

#set label font "Carlito,12" at 1,1

set label 1 sprintf("Tps de doublement\nFrance\n%4.1f jours",log(2.)*tau) at 20,10  c boxed font "Carlito,20"
set label 2 sprintf("ARH: %4.1f jours",log(2.)*6.5)          at 22,1300	c rot by 13 font "Carlito,12"
set label 3 sprintf("Grand Est: %4.1f jours",log(2.)*5)      at 22,4500	c rot by 16 font "Carlito,12"
set label 4 sprintf("Drôme: %4.1f jours ?",log(2.)*tau)      at 20,160	c rot by aa font "Carlito,12"
set label 5 sprintf("Isère: %4.1f jours ?",log(2.)*tau)      at 20,80	c rot by aa font "Carlito,12"
set label 6 sprintf("Décès ARH: %4.1f jours ?",log(2.)*tau)  at 20,35	c rot by aa font "Carlito,12"
set label 7 sprintf("France (cas): %4.1f jours",log(2.)*tau)   at 15,9000 c rot by aa tc lt 1
set label 8 sprintf("France (décès): %4.1f jours",log(2.)*tau) at 15,200  c rot by aa tc lt 2
set label 9 sprintf("Europe: %4.1f jours",log(2.)*5.8) at 15,6e4 c rot by 15 tc lt 7

set xrange [4:25]
plot 'covid19.dat' i 0 u 1:"Itot" w p ps 2.5 t "Cas détectés", \
     '' i 0 u 1:"Dtot" ax x1y1 w p ps 2.5 pt 6 t "Décès", \
     '' i 0 u 1:"I_ARH" w p pt 6 ps 1.3 t "Cas Auv. R-H", \
     '' i 0 u 1:"D_ARH" w p pt 6 ps 1.3 t "Décès ARH", \
     '' i 0 u 1:"Isère" w p pt 7 ps 1.3, \
     '' i 0 u 1:"Drôme" w p pt 7 ps 1.4, \
     '' i 0 u 1:"Grand_Est" w p pt 5 ps 1.2 t "Grand Est", \
     1412*exp((x-9)/tau) w l lw 5 lc 1 not, \
     42*exp((x-10)/tau)  w l lw 5 lc 2 ax x1y1 not, \
     489*exp((x-10)/5.)  w l dt 2 lw 1 lc 8 not, \
     13*exp((x-11)/tau)  w l dt 2 lw 1 lc 8 not, \
     249*exp((x-10)/6.5) w l dt 2 lw 1 lc 8 not, \
     20*exp((x-10)/tau)  w l dt 2 lw 1 lc 8 not, \
     12*exp((x-14)/tau)  w l dt 2 lw 1 lc 8 not, \
     'covid19.dat' \
        i 1 u "Date":"I_Europe" w p pt 2 ps 1.3 t "Europe", \
     18086*exp((x-10)/5.8)  w l dt 2 lw 1 lc 8 not

#     '' i 1 u "Date":"D_Europe" w p pt 2 ps 1.3 t "Europe", \
#     '' i 1 u "Date":($5/$4*100.) w p pt 2 ps 1.3 t "Mortalité", \
#     '' i 0 u "date":($3/$2*100.) w p pt 2 ps 1.3 t "Mortalité (F)", \

exit 0

unset label 1
plot [4:16] \
     'covid19.dat' u 1:2 w p ps 2 t "Cas détectés", \
     '' u 1:3 ax x1y2 w p ps 2 pt 6 t "Décès", \
     'covid19.dat' u 1:4 w p ps 1.2 t "Région / cas", \
     '' u 1:5 w p ps 1.2 t "Isère / cas", \
     '' u 1:6 w p ps 1.2 t "Drôme / cas"
exit 0

set label 1 sprintf("Tps de doublement\nFrance\n%4.1f jours",log(2.)*tau) at 20,10 center font "Carlito,20" boxed front
set label 2 sprintf("ARH: %4.1f jours",log(2.)*6.5)          at 22,1300	 center rot by 15 font "Carlito,12"
set label 3 sprintf("Grand Est: %4.1f jours",log(2.)*5)      at 22,4500	 center rot by 20 font "Carlito,12"
set label 4 sprintf("Drôme: %4.1f jours ?",log(2.)*tau)      at 20,160	 center rot by aa font "Carlito,12"
set label 5 sprintf("Isère: %4.1f jours ?",log(2.)*tau)      at 20,80	 center rot by aa font "Carlito,12"
set label 6 sprintf("Décès ARH: %4.1f jours ?",log(2.)*tau)  at 20,35	 center rot by aa font "Carlito,12"
set label 7 sprintf("Cas France: %4.1f jours",log(2.)*tau)   at 20,2.2e4 center rot by aa font "Carlito,16"
set label 8 sprintf("Décès France: %4.1f jours",log(2.)*tau) at 20,500	 center rot by aa font "Carlito,16"
set label 8 sprintf("Décès France: %4.1f jours",log(2.)*tau) at 20,500	 center rot by aa font "Carlito,16"
