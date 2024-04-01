z = tf('z');                                                    % Use Control System Toolbox Functions
H = tf(0.45 - 0.5*z^(-1) + 0.05*z^(-2), 'Variable','z^-1');
filt_a = H.Numerator{:};
filt_b = H.Denominator{:};
freqz(filt_b, filt_a)