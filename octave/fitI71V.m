data = load("../rawData/082-shunt-I-9");

V0 = 71;

ts = data(:,1);
Shunt = data(:,2);
Is = data(:,3);

voltDiv = 838/18;

Is = Is - mean(Is(1:100));
fullIs = Is;
fullts = ts;

start = 260; % precies begin
%start = 400;

ts = ts(start:end);
Is = Is(start:end);

plot(ts,Is/max(abs(Is)));

Ls  = linspace(7.7e-7, 8.9e-7, 20);
Rs  = linspace(8.5e-3, 15e-3, 30);
dts = linspace(-8, 0, 30) * 1e-6;
Rshunts = linspace(34e-3, 50e-3, 30);


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



 

name='fitI71V';
destdir = "../latex/images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (arb. units)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);


%params =
%
%   8.3500e-07   1.1062e-02  -4.5833e-06   4.2667e-02
%
%chisq =  1.3967e+01
%err =
%
%   7.7655e-07   8.3500e-07   8.9763e-07   7.2500e-02   6.0538e-08
%   8.5734e-03   1.1062e-02   1.4990e-02   2.9000e-01   3.2081e-03
%  -8.8917e-07  -4.5833e-06  -8.5342e-06   8.3400e-01  -3.8225e-06
%   3.4133e-02   4.2667e-02   5.0560e-02   1.9250e-01   8.2133e-03
