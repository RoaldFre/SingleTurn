function [v, i] = rlc(L, R, deltat, V0, t)
	C = 400e-6;
	w = 1 / sqrt(L.*C);
	z = R ./ (2 * L .* w);
	wd = w * sqrt(1 - z.^2);

	t2 = t - deltat;
	v = V0 * exp(-w*z*t2) .* (cos(wd * t2) +
			z/sqrt(1 - z*z) * sin(wd * t2));
	i = C*V0*exp(-w*z*t2) .* sin(wd * t2) * w/sqrt(1-z^2);
end
