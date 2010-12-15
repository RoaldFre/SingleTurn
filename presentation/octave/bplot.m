[t,dbdt,i] = laad_data(90);
b = bfield(t,dbdt) * -4;
t = t * 1e6;
h = plot(t,b,t,lowpass(i/1.5,0.2));
set(h, 'linewidth', 2);

axis([0 200 -2 2.5]);

name='bplot';
destdir = '../images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$B$ (T)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
