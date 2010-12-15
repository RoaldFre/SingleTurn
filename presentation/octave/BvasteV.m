data = load('../../data/piekveld.txt');
v = 850;
epsilon = 20;


idx = find(abs(data(:,5) - v) <= epsilon);
d = data(idx,4);
b = data(idx,2);
h = plot(d,b, 'o');
set(h, 'linewidth', 10);


name='BvasteV';
destdir = '../images';
relImgDir = 'images';
ylabrule='0.9cm';
xlab='$d$ (cm)';
ylab='$B$ (T)';
width='500';
height='500';
makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
