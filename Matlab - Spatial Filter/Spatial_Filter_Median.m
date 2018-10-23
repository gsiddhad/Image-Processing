% Spatial_Filter / Median Filter on Noised Image
% 14 - Oct - 2018
% Gourav Siddhad

function Spatial_Filter_Median()
    RGB = imread('sample.png', 'png');
    GRAY = double(rgb2gray(RGB));
    
    % Applying Median Filter
    IMG = medianFilter(GRAY);
    
    figure;
    subplot(1,2,1);
    imshow(GRAY,[]);
    title('Original');
    subplot(1,2,2);
    imshow(IMG,[]);
    title('Median Filter');
end

% Function to Covolution Matrix using Filter
function [IMG] = medianFilter(ORIG)
    IMG = ORIG-ORIG;
    [p,q] = size(ORIG);
    for i=2:p-1
        for j=2:q-1
            Arr = [ORIG(i-1,j-1) ORIG(i-1,j) ORIG(i-1,j+1) ORIG(i,j-1) ...
                ORIG(i,j) ORIG(i,j+1) ORIG(i+1,j-1) ORIG(i+1,j) ORIG(i+1,j+1)];
            IMG(i,j) = median(Arr);
        end
    end    
end