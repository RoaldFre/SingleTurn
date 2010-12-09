%data = load("../rawData/080-shunt-I-7");
%data = load("../rawData/078-shunt-I-5");
data = load("../rawData/082-shunt-I-9");


%V0 = 346;
V0 = 130;
V0 = 71;



ts = data(:,1);
Shunt = data(:,2);
Is = data(:,3);

%Voor dataset 5!!
%%%%%%%%%%%%%%%%%%%%%%%%%Shunt(282) = 0;

voltDiv = 838/18;

%plot(ts,Is/max(abs(Is)),ts,-Shunt/max(abs(Shunt)),'r');


start = 281; % precies begin
%start = 400;

ts = ts(start:end);
Is = Is(start:end);

plot(ts,Is/max(abs(Is)));


Ls  = linspace(1.5e-7, 2.8e-7, 10);
Rs  = linspace(3.0e-3, 10e-3, 10);
dts = linspace(-5, 5, 10) * 1e-6;
Rshunts = linspace(0.5e-3, 4e-3, 10);

%geeft resultaat voor shunt-9
Ls  = linspace(4.7e-7, 8.5e-7, 15);
Rs  = linspace(0.1e-3, 86e-3, 15);
dts = linspace(-15, 15, 20) * 1e-6;
Rshunts = linspace(0.1e-3, 54e-3, 15);


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



return


name='fitI';
destdir = "../latex/images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (arb. units)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);

