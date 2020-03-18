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
set key c r font "Carlito,12" vertical Left maxrows 15 box opaque outside
#set term pngcairo enhanced font "Cantarell,20" crop size 800,800

#clabel=printf '%f5.1',tau
#print clabel

tau=4.5
aa=19.0
#flabel(s,x)=sprintf("%s: %4.1f jours",s,log(2.)*x)
flabel(s,x)=sprintf("%4.1f jours",log(2.)*x)

#set label font "Carlito,12" at 1,1
unset label
set label 1 flabel("España",5)   at 20,1.7e4 c rot by 15 front font "Carlito,12"
set label 2 flabel("España",3.5) at 20,800 c rot by 25 font "Carlito,12"
set label 3 flabel("Italia",6.5) at 22,5.3e4 c rot by 14 front font "Carlito,12"
set label 4 flabel("Italia",5.5) at 22,5000 c rot by 14 font "Carlito,12"

set xrange [4:25]
set yrange [*:1.3e5]
plot 'covid19.dat' \
        i 0 u 1:"Itot"   w p ps 1.5 pt 5 lc 1 t "France", \
     '' i 0 u 1:"Dtot"   w p ps 1.5 pt 6 lc 1 t "D(Fr)", \
     '' i 2 u 1:"Espana" w p ps 1.5 pt 5 lc 3 , \
     '' i 2 u 1:"D(Esp)" w p ps 1.5 pt 6 lc 3, \
     '' i 2 u 1:"Italia" w p ps 1.5 pt 5 lc 5, \
     '' i 2 u 1:"D(It)"  w p ps 1.5 pt 6 lc 5, \
     '' i 0 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité (*) Fr.", \
     '' i 2 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité (*) Esp.", \
     '' i 2 u 1:($5/$4*100.)  w p ps 1.5 pt 8 t "Mortalité (*) It.", \
     (x>13?5232*exp((x-13)/5.):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>13?133*exp((x-13)/3.5):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>11?12462*exp((x-11)/6.5):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>11?827*exp((x-11)/5.5):1/0) w l dt 2 lw 1 lc 0 not

exit 0
