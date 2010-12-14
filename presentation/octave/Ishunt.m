data = load("../../rawData/080-shunt-I-7");
ts = data(:,1);
Shunt = data(:,2);
Is = data(:,3);

Shunt(282) = 0;

Shunt = -1 * (Shunt - mean(Shunt(1:280)));
Is = Is - mean(Is(1:280));

ts = ts * 1e6;

h = plot(ts,Is/max(abs(Is)),ts,Shunt/max(abs(Shunt))*0.93,'r');
set(h,'linewidth', 2);


name='Ishunt';
destdir = "../images";
relImgDir = "images";
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$I$ (arb. units)';
width='500';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);

