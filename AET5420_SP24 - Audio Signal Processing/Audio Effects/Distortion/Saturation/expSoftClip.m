%% expSoftClip.m
% Exponential soft-clipping algorithm for signal saturation
% Zachary Miller
% 22 Feb 2024

function [out] = expSoftClip(in,gain)
  N = length(in);
  out = zeros(N,1);

  for n=1:N
    out(n,1) = sign(in(n,1)) * (1-exp(1)^(-abs(gain*in(n,1))));
  end
end