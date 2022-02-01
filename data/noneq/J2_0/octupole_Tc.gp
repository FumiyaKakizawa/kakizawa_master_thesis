set term pdfcairo enhanced color font "Times-New-Roman,15"
set output "octupole_Tc_j2_0.pdf"

#set xlabel "temperature"
#set xlabel font "Alias,15"
#set ylabel "log tau"
#set ylabel font "Alias,15"
#set title font "Alias,12"
#set title "tau of octupole:J2/J1=0, L=1800 from sqrt3"

unset key
set xlabel "{/Arial:Italic=20 T}"
set ylabel "{/Arial=15 ln }{/Arial:Italic=20 {/Symbol t}}"
set xtics 0.078, 0.002, 0.085
set ytics 0, 1, 4.5
set tics font "Arial, 15"

f(x) = a + b/sqrt(x-c)
a=1e0
b=1e0
c=1e-2

fit f(x) "m_120degs_tau.dat" u 1:(log($2)) via a,b,c

plot \
"m_120degs_tau.dat" u 1:(log($2)) w lp t "neumerical data",\
f(x) t "a + b/sqrt(x-c)"

#pause -1
