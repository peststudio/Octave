clear all; close all; clc
t = [0:pi / 360:pi * 2];
for a = 1:10
	for b = 1:20
		x = cos(t) + cos(a * t) / 2 + sin(b * t) / 3;
		y = sin(t) + sin(a * t) / 2 + cos(b * t) / 3;

		fprintf('a is %f, b is %f\n', a, b);
		plot(x,y);
		fprintf('Press any key to continue\n');
		pause;
	endfor
endfor
