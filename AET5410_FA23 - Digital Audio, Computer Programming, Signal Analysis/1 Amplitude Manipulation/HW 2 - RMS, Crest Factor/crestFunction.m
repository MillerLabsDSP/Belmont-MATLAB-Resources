% crestFunction.m
% HW2 - Q3
% Zachary Miller
% 15 Oct 2023

function [peakAmp,Arms,DRdB] = crestFunction(x,bufferSize)

% Pad signal (mono)
sigLen = length(x);
neededZeros = zeros(1,bufferSize - mod(sigLen,bufferSize))';
paddedSig = cat(1,x,neededZeros);

% Buffer parameters
sigLen = length(paddedSig);
bufferIndex = sigLen / bufferSize;
bufferStart = 1;
bufferEnd = (bufferStart + bufferSize) - 1;

% Array index initialization
peakAmp = zeros(1,length(bufferIndex))'; 
Arms = zeros(1,length(bufferIndex))';
DRdB = zeros(1,length(bufferIndex))';

% Initial computations for peak amplitude and RMS
for i=1:bufferIndex
    peakAmpVal = 0; sigSqrSum = 0;
    for j=bufferStart:bufferEnd
        if (abs(paddedSig(j)) > peakAmpVal)
            peakAmpVal = abs(paddedSig(j));
        end
        sigSqrSum = sigSqrSum + (paddedSig(j) .^ 2);
    end

peakAmp(i) = peakAmpVal;

% Final computations for RMS
P = sigSqrSum/length(paddedSig);
Arms(i) = sqrt(P);

% Crest factor
DRdB(i) = 20 * log(peakAmp(i) / Arms(i));

% Tag for buffer size
if (bufferEnd < sigLen)
    bufferStart = (bufferStart + bufferSize) - 1;
    bufferEnd = (bufferStart + bufferSize * ((bufferIndex - bufferIndex) + 1));
elseif (bufferEnd == sigLen)
    bufferStart = sigLen - bufferSize;
    bufferEnd = sigLen - 1;
else    
end

end