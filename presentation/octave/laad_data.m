function [t, kol1, kol2] = laad_data(idx)
	prefix = sprintf('%03d', idx);
	filename = glob(['../../rawData/', prefix, '-*']);
	
	filename

	data = load(filename{1});
	t = data(:,1);
	kol1 = data(:,2);
	kol2 = data(:,3);
end
