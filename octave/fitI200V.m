data = load("../rawData/Icalib-geenspoel-200V-VI");
V0 = 200;

ts = data(:,1);
s = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

Is = Is - mean(Is(1:100));
fullIs = Is;
fullts = ts;

start = 280; % precies begin
stop = length(ts) - 1100;

ts = ts(start:stop);
Is = Is(start:stop);

plot(ts,Is/max(abs(Is)));

Ls  = linspace(7.8e-7, 9.1e-7, 25);
Rs  = linspace(6.0e-3, 11e-3, 25);
dts = linspace(-30, -8, 25) * 1e-6;
Rshunts = linspace(1.0e-3, 10e-3, 25);

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



name='fitI200V';
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
%   8.3417e-07   8.2917e-03  -2.4500e-05   5.2500e-03
%
%chisq =  6.5936e-02
%err =
%
%   8.2165e-07   8.3417e-07   8.4668e-07   1.5000e-02   1.2513e-08
%   7.7113e-03   8.2917e-03   8.9135e-03   7.2500e-02   6.0115e-04
%  -2.3422e-05  -2.4500e-05  -2.5431e-05   4.1000e-02  -1.0045e-06
%   4.9350e-03   5.2500e-03   5.5650e-03   6.0000e-02   3.1500e-04
