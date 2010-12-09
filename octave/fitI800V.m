data = load("../rawData/Icalib-geenspoel-800V-VI");
V0 = 800;

ts = data(:,1);
s = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

start = 260; % precies begin
stop = length(ts) - 300;
%start = 400;

ts = ts(start:stop);
Is = Is(start:stop);

plot(ts,Is/max(abs(Is)));

Ls  = linspace(7.7e-7, 8.4e-7, 20);
Rs  = linspace(3.0e-3, 10e-3, 20);
dts = linspace(-30, -15, 20) * 1e-6;
Rshunts = linspace(0.1e-3, 10e-3, 30);

format short e;
[params, chisq, err] = chisq3(V0, voltDiv, Ls, Rs, dts, Rshunts, ts, Is)
format short;

L  = params(1);
R  = params(2);
dt = params(3);
Rshunt = params(4);

tsFit = [linspace(0,ts(1),10)'; ts];
[VsFit, IsFit] = rlc(L, R, dt, V0, tsFit);

plot(ts*1e6, Is/Rshunt*voltDiv*1e-3, tsFit*1e6, IsFit*1e-3);



name='fitI800V';
destdir = "../latex/images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (kA)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);

