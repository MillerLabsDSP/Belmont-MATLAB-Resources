%% sinDist.m
% Sine wave distortion algorithm for signal distortion
% Zachary Miller
% 22 Feb 2024

function [out] = sinDist(in,drive)
  N = length(in);
  out = zeros(N,1);

  for n=1:N
    out(n,1) = sin(2 * pi * (drive * in(n,1)));
  end
end