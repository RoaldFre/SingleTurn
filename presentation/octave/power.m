[t, v, i] = laad_data(112);
p = -(46*v).*(46*i/1e-3); % Roalds values
h = plot(t*1e6,lowpass(p/1e6,0.7));
axis([00 450 -10 50]);
set(h, 'linewidth', 2);

name='power';
destdir = '../images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$t$ ($\mu$s)';
ylab='$P$ (MW)';
width='700';
height='400';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
