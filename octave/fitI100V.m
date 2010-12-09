data = load("../rawData/Icalib-geenspoel-100V-VI-bis");
V0 = 100;

ts = data(:,1);
s = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

Is = Is - mean(Is(1:100));
fullIs = Is;
fullts = ts;

start = 280; % precies begin
stop = length(ts) - 300;
%start = 400;

ts = ts(start:stop);
Is = Is(start:stop);

plot(ts,Is/max(abs(Is)));

Ls  = linspace(7.8e-7, 9.1e-7, 25);
Rs  = linspace(7.0e-3, 12e-3, 25);
dts = linspace(-30, -5, 25) * 1e-6;
Rshunts = linspace(4.0e-3, 12e-3, 25);

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



name='fitI100V';
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
%   8.3958e-07   8.8750e-03  -2.0625e-05   9.0000e-03
%
%chisq =  2.1939e-01
%err =
%
%   8.1440e-07   8.3958e-07   8.6897e-07   3.2500e-02   2.7286e-08
%   7.5881e-03   8.8750e-03   1.0206e-02   1.4750e-01   1.3091e-03
%  -1.8480e-05  -2.0625e-05  -2.2852e-05   1.0600e-01  -2.1862e-06
%   7.9200e-03   9.0000e-03   1.0170e-02   1.2500e-01   1.1250e-03
