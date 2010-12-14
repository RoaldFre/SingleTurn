function [d,b] = BvasteV(data, v, epsilon)
	idx = find(abs(data(:,5) - v) <= epsilon);
	d = data(idx,4);
	b = data(idx,2);
	h = scatter(d,b);
	set(h, 'linewidth', 2);

	name='BvasteV';
	destdir = '../images';
	relImgDir = 'images';
	ylabrule='0.9cm';
	xlab='$d$ (cm)';
	ylab='$B$ (T)';
	width='700';
	height='500';
	makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
end
