function y = lowpass(x,alpha)
	y = zeros(size(x));
	y(1) = x(1);
	for i = 2:size(x)
		y(i) = alpha * x(i) + (1 - alpha) * y(i-1);
	end
end
