data = load('../../data/piekveld.txt');
d = 6;
epsilon = 1;

idx = find(abs(data(:,4) - d) <= epsilon);
v = data(idx,5);
b = data(idx,2);
h = plot(v,b,'o');
set(h, 'linewidth', 10);

name='BvasteD';
destdir = '../images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$V$ (V)';
ylab='$B$ (T)';
width='500';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
