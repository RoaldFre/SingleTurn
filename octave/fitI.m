data = load("../rawData/080-shunt-I-7");
ts = data(:,1);
Shunt = data(:,2);
Is = data(:,3);

Shunt(282) = 0;

voltDiv = 838/18;

%plot(ts,Is/max(abs(Is)),ts,-Shunt/max(abs(Shunt)),'r');


%start = 281; % precies begin
start = 400;

ts = ts(start:end);
Is = Is(start:end);

plot(ts,Is/max(abs(Is)));

Xv = 1/46.5; %berekend, niet nagemeten
V0 = 346;

Ls  = linspace(1.5e-7, 2.8e-7, 20);
Rs  = linspace(3.0e-3, 10e-3, 20);
dts = linspace(-5, 5, 20) * 1e-6;
Rshunts = linspace(0.5e-3, 3e-3, 20);

format short e;
[params, chisq, err] = chisq3(V0, Xv, Ls, Rs, dts, Rshunts, ts, Is)
format short;

L  = params(1);
R  = params(2);
dt = params(3);
Rshunt = params(4);

tsFit = [linspace(0,ts(1),10)'; ts];
[VsFit, IsFit] = rlc(L, R, dt, V0, tsFit);

plot(ts*1e6, Is/Rshunt*voltDiv*1e-3, tsFit*1e6, IsFit*1e-3);

name='fitI';
destdir = "../latex/images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (arb. units)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);

