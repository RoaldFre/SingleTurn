data = load("../rawData/Icalib-geenspoel-400V-VI");
V0 = 400;

ts = data(:,1);
s = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

Is = Is - mean(Is(1:100));
fullIs = Is;
fullts = ts;

start = 260; % precies begin
stop = length(ts) - 300;
%start = 400;

ts = ts(start:stop);
Is = Is(start:stop);

plot(ts,Is/max(abs(Is)));

Ls  = linspace(7.8e-7, 9.1e-7, 20);
Rs  = linspace(3.0e-3, 10e-3, 20);
dts = linspace(-40, -15, 20) * 1e-6;
Rshunts = linspace(1.0e-3, 6e-3, 20);

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



name='fitI400V';
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
%   8.2105e-07   7.0526e-03  -2.5526e-05   2.0526e-03
%
%chisq =  6.5947e-02
%err =
%
%   8.1284e-07   8.2105e-07   8.3747e-07   1.5000e-02   1.2316e-08
%   6.4532e-03   7.0526e-03   7.5816e-03   8.0000e-02   5.6421e-04
%  -2.3944e-05  -2.5526e-05  -2.6343e-05   4.7000e-02  -1.1997e-06
%   1.9500e-03   2.0526e-03   2.2168e-03   6.5000e-02   1.3342e-04
