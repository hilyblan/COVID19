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
unset key
set key c r font "Carlito,12" vertical maxcol 1 box opaque
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
unset label
plot 'covid19.dat' \
        i 0 u 1:"Itot"   w p ps 1.5 pt 5 lc 1 t "France", \
     '' i 0 u 1:"Dtot"   w p ps 1.5 pt 6 lc 1 t "D(Fr)", \
     '' i 2 u 1:"Espana" w p ps 1.5 pt 5 lc 3 , \
     '' i 2 u 1:"D(Esp)" w p ps 1.5 pt 6 lc 3, \
     '' i 2 u 1:"Italia" w p ps 1.5 pt 5 lc 5, \
     '' i 2 u 1:"D(It)"  w p ps 1.5 pt 6 lc 5, \
     '' i 0 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité Fr.", \
     '' i 2 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité Esp.", \
     '' i 2 u 1:($5/$4*100.)  w p ps 1.5 pt 8 t "Mortalité It."
#     1412*exp((x-9)/tau) w l lc 1, \

exit 0
