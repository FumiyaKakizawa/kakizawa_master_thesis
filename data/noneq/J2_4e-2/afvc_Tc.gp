set term pdfcairo enhanced color font "Times-New-Roman,15"
set output "afvc_Tc_j2_4e-2.pdf"
set rmargin 5

#set xlabel "temperature"
#set xlabel font "Alias,15"
#set ylabel "logarithm of relaxation time"
#set ylabel font "Alias,15"
#set title font "Alias,12"
#set title "tau of afvc:J2=0.04,L=1800"

unset key
set xlabel "{/Arial:Italic=20 T}"
set ylabel "{/Arial=15 ln }{/Arial:Italic=20 {/Symbol t}}"
#set xtics 0.078, 0.002, 0.085
#set ytics 0, 1, 4.5
set tics font "Arial, 15"

f(x) = a - b*log(x-c)
a=1e0
b=1e0
c=1e-2

fit f(x) "afvc_tau.dat" u 1:(log($2)) via a,b,c

plot \
"afvc_tau.dat" u 1:(log($2)) w lp t "neumerical data",\
f(x) t "fitting curve"

#pause -1
