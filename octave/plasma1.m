[t,vp,i] = laad_data(89);
b = bfield(t,vp*4);
plot(t*1e6,-b,t*1e6,lowpass(i,0.3)/10);
axis([-30, 70, -0.15, 0.4]);

name='plasma1';
destdir = '../latex/images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$B$ (T)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
