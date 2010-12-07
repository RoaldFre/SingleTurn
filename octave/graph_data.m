#! /usr/bin/octave -q

if nargin == 0
	printf('This program needs an argument\n');
	quit
end

args = argv();
filename = args{1};

data = load(filename);
t = data(:,1);
dbdt = data(:,2);

B = bfield(t, dbdt);

plot(t*1e6,B);

print([filename , ".png"]);
