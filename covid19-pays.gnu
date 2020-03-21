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

i_esp = 5.0
d_esp = 3.5
d_de  = 3.
d_fr  = 3.5
d_it1 = 3.5
d_it2 = 5.9

#set label font "Carlito,12" at 1,1
unset label
set label 1 flabel("España",5)   at 20,1.7e4 c rot by 15 front font "Carlito,12"
set label 2 flabel("España",3.5) at 20,800 c rot by 25 font "Carlito,12"
set label 3 flabel("Italia",6.5) at 22,5.3e4 c rot by 14 front font "Carlito,12"
set label 4 flabel("Italia",d_it2) at 22,5000 c rot by 14 font "Carlito,12"
set label 7 flabel("Italia",d_it1) at 7,150 c rot by 24 font "Carlito,12"
set label 5 flabel("Allemagne",d_de) at 22,80 c rot by 26 font "Carlito,12"
set label 6 flabel("France",d_fr) at 22,600 c rot by 26 font "Carlito,12"

set xrange [4:25]
set yrange [*:1.3e5]
plot 'covid19.dat' \
        i 0 u 1:"Itot"   w p ps 1.5 pt 5 lc 1 t "France", \
     '' i 0 u 1:"Dtot"   w p ps 1.5 pt 6 lc 1 t "D(Fr)", \
     '' i 2 u 1:"Espana" w p ps 1.5 pt 5 lc 3 , \
     '' i 2 u 1:"D(Esp)" w p ps 1.5 pt 6 lc 3, \
     '' i 2 u 1:"Italia" w p ps 1.5 pt 5 lc 5, \
     '' i 2 u 1:"D(It)"  w p ps 1.5 pt 6 lc 5, \
     '' i 2 u 1:"Allemagne" w p ps 1.5 pt 4 lc 7, \
     '' i 2 u 1:"D(All.)"  w p ps 1.5 pt 6 lc 7, \
     '' i 0 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité (*) Fr.", \
     '' i 2 u 1:($3/$2*100.)  w p ps 1.5 pt 8 t "Mortalité (*) Esp.", \
     '' i 2 u 1:($5/$4*100.)  w p ps 1.5 pt 8 t "Mortalité (*) It.", \
     '' i 2 u 1:($11/$10*100.)  w p ps 1.5 pt 8 t "Mortalité (*) De.", \
     (x>13?5232*exp((x-13)/i_esp):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>13?133*exp((x-13)/d_esp):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>14?9*exp((x-14)/d_de):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>16?148*exp((x-16)/d_fr):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>11?12462*exp((x-11)/6.5):1/0) w l dt 2 lw 1 lc 0 not, \
     (x>12?1050*exp((x-12)/d_it2):1/0) w l dt 2 lw 1 lc 0 not, \
     (x<12?1050*exp((x-12)/d_it1):1/0) w l dt 2 lw 1 lc 0 not

#     '' i 2 u 1:"Germany" w p ps 1.5 pt 4 lc 7, \
#     '' i 2 u 1:"D(De)"  w p ps 1.5 pt 6 lc 7, \

exit 0
