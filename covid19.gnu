set datafile missing "?"
set ytics mirr
set autosca y
@LOGY

unset label
unset key
set xlabel "Date (Mars 2020)"
set key t l font "Carlito,12" maxrows 5 box opaque inside

tau=4.5
aa=19.0

i_isere=5.0
i_drome=12.2
d_arh = 4.0
i_idf = 5.
grandest = 6.0
i_fr1=4.5
i_fr2=6.0 #2.5
i_fr3=6.5 #2.5
i_fr=i_fr3
d_fr=4.0 #3.5 #2.5

flabel(s,x)=sprintf("%s %4.1f j",s,log(2.)*x)

set label  1 sprintf("Tps de doublement\nFrance\n%4.1f jours",i_fr*log(2.)) at 25,10  c boxed font "Carlito,24"
set label  2 flabel("ARH",6.5)            at 18,700	c rot by 13 font "Carlito,12"
set label  3 flabel("Grand Est",grandest) at 22,3800	c rot by 14 font "Carlito,12"
set label  4 flabel("Drôme",tau)      at 13,50	front c rot by aa font "Carlito,12"
set label 12 flabel("",i_drome)            at 18,100	c rot by 8 font "Carlito,12"
set label  5 flabel("Isère",i_isere)      at 22,130	c rot by aa font "Carlito,12"
set label  6 flabel("Décès ARH",6.5)  at 17,20 c rot by 10 font "Carlito,12"
set label 14 flabel("",d_arh)      at 21,60	c rot by 25 font "Carlito,12"
set label  7 flabel("France",i_fr1)   at 13,5500 front c rot by aa tc lt 1
set label 11 flabel("",i_fr3)   at 27,3e4 front c rot by 16 tc lt 1
set label  8 flabel("France",tau) at 15,200  c rot by aa tc lt 2
set label 13 flabel("???",d_fr) at 27,1500  c rot by 27 tc lt 2
set label  9 flabel("Europe",5.8)         at 15,6e4 c rot by 18 tc lt 0
set label 10 flabel("Rhône",6)            at 22,350 c rot by 15 font "Carlito,12"
set label 15 flabel("IdF",i_idf)            at 22,8000 c rot by aa font "Carlito,12"

#set label 11 "IdF" at 18,3000	c rot by 16 font "Carlito,12"

set xrange [4:31]
plot 'covid19.dat' i 0 u 1:"Itot" w p ps 2.5 t "Cas détectés", \
     '' i 0 u 1:"Dtot" ax x1y1 w p ps 2.5 pt 6 t "Décès", \
     '' i 0 u 1:"I_ARH" w p pt 6 ps 1.3 t "Cas Auv. R-H", \
     '' i 0 u 1:"D_ARH" w p pt 6 ps 1.3 t "Décès ARH", \
     '' i 0 u 1:"Isère" w p pt 7 ps 1.3, \
     '' i 0 u 1:"Drôme" w p pt 7 ps 1.4, \
     '' i 0 u 1:"Rhône" w p pt 7 ps 1.4, \
     '' i 0 u 1:"Grand_Est" w p pt 5 ps 1.2 t "Grand Est", \
     '' i 0 u 1:"IdF" w p pt 5 ps 1.2, \
     (x>19?10995*exp((x-19)/i_fr):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>=16&&x<19?6633*exp((x-16)/i_fr2):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>7&&x<16?1412*exp((x-9)/i_fr1):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x<16&&x>10?148*exp((x-16)/tau):1/0)  w l lw 5 lc 2 not, \
     (x>16?148*exp((x-16)/d_fr):1/0)  w l lw 5 lc 2 not, \
     13*exp((x-11)/i_isere)  w l dt 2 lw 1 lc 8 not, \
     249*exp((x-10)/6.5) w l dt 2 lw 1 lc 8 not, \
     (x>16?69*exp((x-16)/i_drome):1/0)     w l dt 2 lw 1 lc 8 not, \
     (x<16?69*exp((x-16)/tau):1/0)     w l dt 2 lw 1 lc 8 not, \
     (x>15&&x<18?18*exp((x-15)/6.5):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>18?27*exp((x-18)/d_arh):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>9?49*exp((x-9)/6):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>16?1762*exp((x-16)/i_idf):1/0)  w l dt 2 lw 1 lc 8 not, \
     (x>15?1378*exp((x-15)/grandest):1/0)  w l dt 2 lw 1 lc 8 not, \
     'covid19.dat' \
     i 1 u "Date":"I_Europe" w p lc 0 pt 2 ps 1.3 t "Europe", \
     18086*exp((x-10)/5.8)  w l dt 2 lw 1 lc 8 not

# FRANCE: avant ralentissement // 1412*exp((x-9)/tau) w l lw 5 lc 1 not, \

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

set label 1 flabel("Tps de doublement\nFrance\n%4.1f jours",log(2.)*tau) at 20,10 center font "Carlito,20" boxed front
set label 2 flabel("ARH: %4.1f jours",log(2.)*6.5)          at 22,1300	 center rot by 15 font "Carlito,12"
set label 3 flabel("Grand Est: %4.1f jours",log(2.)*5)      at 22,4500	 center rot by 20 font "Carlito,12"
set label 4 flabel("Drôme: %4.1f jours ?",log(2.)*tau)      at 20,160	 center rot by aa font "Carlito,12"
set label 5 flabel("Isère: %4.1f jours ?",log(2.)*tau)      at 20,80	 center rot by aa font "Carlito,12"
set label 6 flabel("Décès ARH: %4.1f jours ?",log(2.)*tau)  at 20,35	 center rot by aa font "Carlito,12"
set label 7 flabel("Cas France: %4.1f jours",log(2.)*tau)   at 20,2.2e4 center rot by aa font "Carlito,16"
set label 8 flabel("Décès France: %4.1f jours",log(2.)*tau) at 20,500	 center rot by aa font "Carlito,16"
set label 8 flabel("Décès France: %4.1f jours",log(2.)*tau) at 20,500	 center rot by aa font "Carlito,16"
