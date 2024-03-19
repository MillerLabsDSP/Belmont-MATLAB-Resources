% scratchHW2

clear; clc;

filename = 'HW2.wav';

[x,Fs] = audioread(filename);
bufferSize = 2048;

% Pad signal (mono)

sigLen = length(x);
neededZeros = zeros(1,bufferSize - mod(sigLen,bufferSize))';
paddedSig = cat(1,x,neededZeros);

% Array index of Ap/RMS/cFDB per buffer

peakAmp = 0; sigSqrSum = 0;
sigLen = length(paddedSig);
bufferIndex = sigLen / bufferSize;
bufferStart = 1;
bufferEnd = (bufferStart + bufferSize) - 1;


for i=1:bufferIndex
    for j=bufferStart:bufferEnd
        if (abs(paddedSig(j)) > peakAmp)
            peakAmp = abs(paddedSig(j));
        end
sigSqrSum = sigSqrSum + paddedSig(j) .^ 2;
    end

P = sigSqrSum/length(paddedSig);
Arms = sqrt(P);

DRdB = 20 * log10(abs(peakAmp)) - 20 * log10(Arms);

if (bufferEnd < sigLen)
    bufferStart = (bufferStart + bufferSize) - 1;
    bufferEnd = (bufferStart + bufferSize * ((bufferIndex - bufferIndex) + 1));
elseif (bufferEnd == sigLen)
    bufferStart = sigLen - bufferSize;
    bufferEnd = sigLen - 1;
else    
end

indexPosition = [i,peakAmp,Arms,DRdB];
disp(indexPosition);
peakAmp = 0; sigSqrSum = 0 ;

end

% plot(peakAmp);