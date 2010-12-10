[t,vp,i] = laad_data(93);
b = bfield(t,vp*4);
plot(t*1e6,-b,t*1e6,lowpass(i,0.2)/3.5);
axis([0, 125, -0.15, 1]);

name='plasma2';
destdir = '../latex/images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$B$ (T)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
