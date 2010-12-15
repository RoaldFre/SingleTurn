function B = bfield(t, v, Nbias=100)
	A = 136.41e-6;

	%dt = t(2) - t(1);
	bias = sum(v(1:Nbias))/Nbias;
	v = v .- bias;

	flux = cumtrapz(t,v);
	B = flux ./ A;
end
