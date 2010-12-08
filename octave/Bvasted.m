function [v,b] = Bvasted(data, d, epsilon)
	idx = find(abs(data(:,4) - d) <= epsilon);
	v = data(idx,5);
	b = data(idx,2);
	scatter(v,b);
end
