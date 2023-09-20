# mod1000counter_Basys3

Using four 7segment displays on basys3 FPGA board we design the mod-1000 counter which counts from 0 to 999.
I have completed "mod-1000 counter" project implemented on Basys3 FPGA Board. The counter counts form 0 to 999 which is displayed using three 7segment displays on board.



Applications of these counters

1.Industrial Automation to count events, monitor production rates, and control processes. 

2.Traffic Management to monitor traffic flow and count the number of vehicles passing through specific points. 

3.In retail, counters are used to count the number of customers entering and exiting a store. 

4.In digital electronics, counters are fundamental components used to count pulses, generate clock signals, or divide frequencies. They are commonly used in various electronic devices, including digital clocks, frequency synthesizers, and communication systems.



🔸 The Basys 3 board contains one four-digit common anode seven-segment LED display. Each of the four digits is composed of seven segments arranged in a "figure 8" pattern, with an LED embedded in each segment. 

🔹 The anodes of the seven LEDs forming each digit are tied together into one "common anode" circuit node, but the LED cathodes remain separate. The common anode signals are available as four "digit enable" input signals to the 4-digit display. The cathodes of similar segments on all four displays are connected into seven circuit nodes labeled CA through CG (for example, the four "D" cathodes from the four digits are grouped together into a single circuit node called "CD"). These seven cathode signals are available as inputs to the 4-digit display. This signal connection scheme creates a multiplexed display, where the cathode signals are common to all digits but they can only illuminate the segments of the digit whose corresponding anode signal is asserted. 

🔸 A scanning display controller circuit can be used to show a four-digit number on this display. This circuit drives the anode signals and corresponding cathode patterns of each digit in a repeating, continuous succession at an update rate that is faster than the human eye can detect. Each digit is illuminated just one-fourth of the time, but because the eye cannot perceive the darkening of a digit before it is illuminated again, the digit appears continuously illuminated. If the update, or "refresh", rate is slowed to around 45Hz, a flicker can be noticed in the display. For each of the four digits to appear bright and continuously illuminated, all four digits should be driven once every 1 to 16ms, for a refresh frequency of about 1 KHz to 60Hz. 

