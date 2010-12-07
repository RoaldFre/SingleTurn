function [t, B, tmax, Bmax, vp] = laadBveld(index)
	schaalfactor = 4;

	prefix = sprintf('%03d', index);
	filename = glob(['../rawData/', prefix, '-*']);
filename
	data = load(filename{1});
	t = data(:,1);
	vp = data(:,2) * schaalfactor;

	B = bfield(t,vp);

	[Bmax, tmax] = max(abs(B));
	tmax = t(tmax) * 1e6;

	tmax
	Bmax


	tmax = tmax * 1e-6;
end
