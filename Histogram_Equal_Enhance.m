% Histogram_Equal_Enhance
% 14 - Oct - 2018
% Gourav Siddhad

function Histogram_Equal_Enhance()
    RGB = imread('sample.png', 'png');
    GRAY = rgb2gray(RGB);
    GRAYeq = GRAY;
    
    % Calculating Intensity Array
    bins = 256;
    X = zeros(bins);
    [p,q] = size(GRAY);
    bin = 256/(bins-1);
    for i=1:p
        for j=1:q
            X(GRAY(i,j)/bin+1) = X(GRAY(i,j)/bin+1)+1;
        end
    end
    
    % Computing Cumulative Frequency
    CuFreq = zeros(bins);
    CuFreq(1) = X(1);
    for i=2:bins
        CuFreq(i) = CuFreq(i-1) + X(i);
    end
    
    % Calculating the Relative Intensity to be Used 
    pixels = CuFreq(bins);
    for i=1:bins
        CuFreq(i) = bins*CuFreq(i)/pixels;
    end
    
    % Reconstructing Enhanced Image using New Intensity Values
    for i=1:p
        for j=1:q
            GRAYeq(i,j) = CuFreq(GRAY(i,j));
        end
    end
    
    figure;
    subplot(2,2,1);
    imshow(GRAY);
    title('Original');
    
    subplot(2,2,2);
    imshow(GRAYeq);
    title('Equalized');
    
    subplot(2,2,3);
    imhist(GRAY);
    title('Original');
    
    subplot(2,2,4);
    imhist(GRAYeq);
    title('Equalized');
end