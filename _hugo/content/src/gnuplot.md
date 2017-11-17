- [GNUPLOT - A Brief Manual and Tutorial](http://people.duke.edu/~hpgavin/gnuplot.html)

GnuPlot scripts

Set command customization

```
      Create a title:                  > set title "Force-Deflection Data"
      Put a label on the x-axis:       > set xlabel "Deflection (meters)"
      Put a label on the y-axis:       > set ylabel "Force (kN)"
      Change the x-axis range:         > set xrange [0.001:0.005]
      Change the y-axis range:         > set yrange [20:500]
      Have Gnuplot determine ranges:   > set autoscale
      Move the key:                    > set key 0.01,100
      Delete the key:                  > unset key
      Put a label on the plot:         > set label "yield point" at 0.003, 260 
      Remove all labels:               > unset label
      Plot using log-axes:             > set logscale
      Plot using log-axes on y-axis:   > unset logscale; set logscale y 
      Change the tic-marks:            > set xtics (0.002,0.004,0.006,0.008)
      Return to the default tics:      > unset xtics; set xtics auto
```

- [Linetype, colors, and styles](http://gnuplot.sourceforge.net/docs_4.2/node62.html)

```
plot sin(x) linetype 4          # terminal-specific linetype color 4
plot sin(x) lt -1               # black
plot sin(x) lt rgb "violet"       # one of gnuplot's named colors
plot sin(x) lt rgb "#FF00FF"      # explicit RGB triple in hexadecimal
plot sin(x) lt palette cb -45     # whatever color corresponds to -45 in the current cbrange of the palette
plot sin(x) lt palette frac 0.3   # fractional value along the palette
```

