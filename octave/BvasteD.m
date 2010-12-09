function [v,b] = BvasteD(data, d, epsilon)
	idx = find(abs(data(:,4) - d) <= epsilon);
	v = data(idx,5);
	b = data(idx,2);
	scatter(v,b);

	name='BvasteD';
	destdir = '../latex/images';
	relImgDir = 'images';
	ylabrule='0.9cm';
	xlab='$V$ (V)';
	ylab='$B$ (T)';
	width='700';
	height='500';
	makeGraph(name,destdir,relImgDir,xlab,ylab,ylabrule,width,height);
end
