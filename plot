#!/bin/bash

foamLog InfoSimulacion>/dev/null

gnuplot -persist > /dev/null 2>&1 << EOF
	set logscale y
	set title "Residuals vs. Iteration"
	set xlabel "Iteration"
	set ylabel "Residuals"
	set style line 1 lt 1 lc rgb "red" lw 1
	set style line 2 lt 2 lc rgb "orange" lw 1
	set style line 3 lt 2 lc rgb "yellow" lw 1
	set style line 4 lt 2 lc rgb "green" lw 1
	set style line 5 lt 2 lc rgb "blue" lw 1
	set style line 6 lt 2 lc rgb "pink" lw 1
	set format y "%g"
	plot    "logs/p_rgh_0" title 'Pressure [P_r_g_h]' with line ls 1,\
		"logs/T_0" title 'Temperature [T]' with line ls 2,\
		"logs/Uz_0" title 'Velocity Z [Uz]' with lines ls 3,\
		"logs/Uy_0" title 'Velocity Y [Uy]' with line ls 4,\
		"logs/Ux_0" title 'Velocity X [Ux]' with line ls 5 ,\
	          
EOF
