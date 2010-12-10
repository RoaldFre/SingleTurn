data = load("../rawData/Icalib-geenspoel-800V-VI");
V0 = 800;

ts = data(:,1);
s = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

start = 260; 
fullstart = 250;
stop = length(ts) - 300;
%start = 400;

Is = Is - mean(Is(1:100));
fullIs = Is(fullstart:end);
fullts = ts(fullstart:end);


ts = ts(start:stop);
Is = Is(start:stop);

plot(fullts,fullIs/max(abs(fullIs)));

Ls  = linspace(7.9e-7, 8.4e-7, 20);
Rs  = linspace(6.0e-3, 9e-3, 20);
dts = linspace(-30, -20, 20) * 1e-6;
Rshunts = linspace(0.4e-3, 3e-3, 30);


format short e;
[params, chisq, err] = chisq3(V0, voltDiv, Ls, Rs, dts, Rshunts, ts, Is)
format short;

L  = params(1);
R  = params(2);
dt = params(3);
Rshunt = params(4);

%tsFit = [linspace(0,ts(1),10)'; fullts];
tsFit = linspace(min(0,ts(1)), fullts(end)*1.4,1000);
[VsFit, IsFit] = rlc(L, R, dt, V0, tsFit);


plot(fullts*1e6, fullIs/Rshunt*voltDiv*1e-3, tsFit*1e6, IsFit*1e-3);

axis([0,1000,0,1], 'autoy');


name='fitI800V';
destdir = "../latex/images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (kA)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);


%params =
%
%   8.2158e-07   7.7895e-03  -2.6053e-05   1.1241e-03
%
%chisq =  8.6390e-02
%err =
%
%   8.0515e-07   8.2158e-07   8.3390e-07   1.7500e-02   1.4378e-08
%   7.1663e-03   7.7895e-03   8.6074e-03   9.2500e-02   7.2053e-04
%  -2.4698e-05  -2.6053e-05  -2.7251e-05   4.9000e-02  -1.2766e-06
%   1.0005e-03   1.1241e-03   1.1803e-03   8.0000e-02   8.9931e-05
