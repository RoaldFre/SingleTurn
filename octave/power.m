[t, v, i] = laad_data(112);
p = -(46*v).*(46*i/1e-3); % Roalds values
plot(t*1e6,lowpass(p/1e6,0.7));
axis([00 450 -10 50]);

name='power';
destdir = '../latex/images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$P$ (MW)';
width='700';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
