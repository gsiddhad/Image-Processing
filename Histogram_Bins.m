% Histogram_Bins
% 14 - Oct - 2018
% Gourav Siddhad

function Histogram_Bins(bins)
    RGB = imread('sample.png', 'png');
    GRAY = rgb2gray(RGB);
    
    X = zeros(bins);
    [p,q] = size(GRAY);
    bin = 256/(bins-1);
    
    % Calculating Intensity Array of Image
    for i=1:p
        for j=1:q
            X(GRAY(i,j)/bin+1) = X(GRAY(i,j)/bin+1)+1;
        end
    end
    
    figure;
    subplot(1,2,1);
    imhist(GRAY, bins);
    title('InBuilt');
       
    subplot(1,2,2);
    bar(X);
    title('Looped');
end