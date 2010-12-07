function [v, i] = rlc(R, L, C, V0, t)
	w = 1/sqrt(L.*C);
	z = R/(2*L*w);
	wd = w * sqrt(1 - z.^2);

	v = V0 * exp(-w*z*t) .* (cos(wd * t) +
			z/sqrt(1 - z*z) * sin(wd * t));
	i = -C*V0*exp(-w*z*t) .* sin(wd * t) * w /sqrt(1-z^2);
end

