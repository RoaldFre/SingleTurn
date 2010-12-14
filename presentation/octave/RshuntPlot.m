V = [71 100 200 400 800];
R = [43 9 5.25 2.0526 1.124];
dR = [8 1.125 0.315 0.133 0.0899];

h = errorbar(V,R,dR);
set(h,'linewidth',2);

name='RshuntPlot';
destdir = '../images';
relImgDir = 'images';
ylabrule='0.8cm';
xlab='$V_0$ (V)';
ylab='$\Rshunt$ (m$\Omega$)';
width='500';
height='300';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
