function [t,v,B] = laad_data(filename)
    data = load(filename);
    t = data(:,1);
    v = data(:,2) * -4; % XXXXXXXXXXXXXXXXXXXXXXX
    biasedv = v(1:100);
    bias = mean(biasedv);
    v = v - bias;
    dt = t(2)-t(1);
    flux = cumtrapz(v*dt);
    B = flux/(136e-6);
end