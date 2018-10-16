% Spatial_Filter / Median Filter on Noised Image
% 14 - Oct - 2018
% Gourav Siddhad

function Spatial_Filter()
    RGB = imread('sample.png', 'png');
    GRAY = rgb2gray(RGB);
    
    % Adding Noise to Image
    GRAYS = imnoise(GRAY, 'salt & pepper', 0.03);

    % Median Filter Mask
    FILTER = (1/16)*[ 1 2 1 ;
                      2 4 2 ;
                      1 2 1 ];
                  
    % Padding Image With Zeros
    % GRAYSP = imgPad(GRAYS, 1);
    
    % Applying Filter Multiple Times
    IMG1 = imgFilter(GRAYS, FILTER);
    IMG2 = imgFilter(IMG1, FILTER);
    IMG3 = imgFilter(IMG2, FILTER);
    IMG4 = imgFilter(IMG3, FILTER);
    
    figure;
    subplot(2,3,1);
    imshow(GRAY);
    title('Original');
    subplot(2,3,2);
    imshow(GRAYS);
    title('Salt & Pepper');
    subplot(2,3,3);
    imshow(IMG1);
    title('Iterate 1');
    
    subplot(2,3,4);
    imshow(IMG2);
    title('Iterate 2');
    subplot(2,3,5);
    imshow(IMG3);
    title('Iterate 3');
    subplot(2,3,6);
    imshow(IMG4);
    title('Iterate 4 - Final');    
end

% Function to Covolution Matrix using Filter
function IMG = imgFilter(ORIG, FILTER)
    IMG = ORIG;
    [p,q] = size(ORIG);
    for i=2:p-1
        for j=2:q-1
            IMG(i,j) = (ORIG(i-1,j-1)*FILTER(1,1) + ORIG(i-1,j)*FILTER(1,2) + ORIG(i-1,j+1)*FILTER(1,3) ...
                      + ORIG(i,j-1)*FILTER(2,1) + ORIG(i,j)*FILTER(2,2) + ORIG(i,j+1)*FILTER(2,3) ...
                      + ORIG(i+1,j-1)*FILTER(3,1) + ORIG(i+1,j)*FILTER(3,2) + ORIG(i+1,j+1)*FILTER(3,3));
        end
    end    
end

% Function to Pad Image with Zeros
function IMG = imgPad(ORIG, PAD)
    [p,q] = size(ORIG);
    IMG = zeros(p+2, q+2);
    for i=1:p
        for j=1:q
            IMG(i+PAD,j+PAD) = ORIG(i,j);
        end
    end
end

%{
    % Other Filters that can be used
    f1=(1/9)*[-1, 0, 1;
        -2, 0, 2;
        -1, 0, 1 ];
    f2=(1/9)*[-1,-2,-1;
         0, 0, 0;
         1, 2, 1 ];
    IMG1=imgFilter(GRAY, f1);
    IMG2=imgFilter(GRAY, f2);
    [p,q] = size(GRAY);
    MIMG = GRAY;
    for i=1:p
        for j=1:q
            MIMG(i,j) = max(IMG1(i,j), IMG2(i,j));
        end
    end
%}