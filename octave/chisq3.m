function [params, chsq, err] = chisq3(V0, Xv, as, bs, cs, ds, xs, ys)
	%as, bs, cs, ds: arrays of parameter values

	voltDiv = 838/18;

	chsq = inf;
	params=[0,0,0,0];

	a=0;
	b=0;
	c=0;
	d=0;
	for ai=1:length(as)
		a=as(ai);
		for bi=1:length(bs)
			b = bs(bi);
			for ci=1:length(cs)
				c = cs(ci);
				for di=1:length(ds)
					d = ds(di);
					%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
					[v, i] = rlc(a, b, c, V0, xs);
					%            L  R  dt
					ysmodel = i * d / voltDiv; %Rshunt
					%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
					chsqnow = sum((ys-ysmodel).^2);
					if (chsqnow < chsq)
						params=[a,b,c,d];
						chsq = chsqnow;
					endif
				endfor
			endfor
		endfor
	endfor

	a = params(1);
	b = params(2);
	c = params(3);
	d = params(4);

	chsqLimit = 2*chsq;


	%UNCERTAINTIES
	%start from ideal value, creep away by adding/subtracting X% until chisq doubles
	
	%uncertainty on a:
	a2 = a;
	aincr = a * 0.005;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		a2 += aincr;
		[v, i] = rlc(a2, b, c, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	aupper = a2;
	a2 = a;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		a2 -= aincr;
		[v, i] = rlc(a2, b, c, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	alower = a2;


	%uncertainty on b:
	b2 = b;
	bincr = b * 0.005;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		b2 += bincr;
		[v, i] = rlc(a, b2, c, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	bupper = b2;
	b2 = b;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		b2 -= bincr;
		[v, i] = rlc(a, b2, c, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	blower = b2;


	%uncertainty on c:
	c2 = c;
	cincr = c * 0.002;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		c2 += cincr;
		[v, i] = rlc(a, b, c2, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	cupper = c2;
	c2 = c;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		c2 -= cincr;
		[v, i] = rlc(a, b, c2, V0, xs);
		ysmodel = i * d / voltDiv; %Rshunt
	end
	clower = c2;


	%uncertainty on c:
	d2 = d;
	dincr = d * 0.005;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		d2 += dincr;
		[v, i] = rlc(a, b, c, V0, xs);
		ysmodel = i * d2 / voltDiv; %Rshunt
	end
	dupper = d2;
	d2 = d;
	ysmodel = ys; %hack for do-while
	while sum((ys-ysmodel).^2) < chsqLimit;
		d2 -= dincr;
		[v, i] = rlc(a, b, c, V0, xs);
		ysmodel = i * d2 / voltDiv; %Rshunt
	end
	dlower = d2;

	da = ((a - alower) + (aupper - a))/2;
	db = ((b - blower) + (bupper - b))/2;
	dc = ((c - clower) + (cupper - c))/2;
	dd = ((d - dlower) + (dupper - d))/2;

	err = [     alower, a, aupper, da/a, da];
	err = [err; blower, b, bupper, db/b, db];
	err = [err; clower, c, cupper, dc/c, dc];
	err = [err; dlower, d, dupper, dd/d, dd];

endfunction

% vim: ts=4:sw=4
