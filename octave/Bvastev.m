function [d,b] = Bvastev(data, v, epsilon)
	idx = find(abs(data(:,5) - v) <= epsilon);
	d = data(idx,4);
	b = data(idx,2);
	scatter(d,b);
end
