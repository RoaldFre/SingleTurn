data = load("../rawData/080-shunt-I-7");
ts = data(:,1);
Shunt = data(:,2);
Is = data(:,3);

%plot(ts,Is/max(abs(Is)),ts,Vs/max(abs(Shunt)),'r');

%start = 281; % precies begin
start = 400;

ts = ts(start:end);
Is = Is(start:end);

plot(ts,Is/max(abs(Is)));

Xv = 1/127;
V0 = 346;

Ls  = linspace(1e-7, 3e-7, 10);
Rs  = linspace(1e-3, 10e-3, 10);
dts = linspace(-0.1, 0.1, 10) * 1e-4;
Xis = linspace(1e-5, 10e-5, 10);

Ls  = linspace(0.5e-7, 6e-7, 40);
Rs  = linspace(0.5e-3, 20e-3, 40);
dts = linspace(-0.05, 0.05, 40) * 1e-4;
Xis = linspace(0.5e-5, 20e-5, 40);

format short e;
[params, chisq, err] = chisq3(V0, Xv, Ls, Rs, dts, Xis, ts, Is)
format short;

L  = params(1);
R  = params(2);
dt = params(3);
Xi = params(4);

tsFit = [linspace(0,ts(1),10)'; ts];
[VsFit, IsFit] = rlc(L, R, dt, V0, tsFit);
plot(ts, Is/Xi, tsFit, IsFit, [dt,dt], [min(Is),max(Is)]/Xi);
