% RGB_to_Gray
% 14 - Oct - 2018
% Gourav Siddhad

function RGB_to_Gray()
    RGB = imread('sample.png', 'png');
    
    % Slicing R,G,B Layers of the Image
    R = RGB(:,:,1);
    G = RGB(:,:,2);
    B = RGB(:,:,3);
    
    % Reconstructing Image using Ratios of Different Slices
    GRAY = (R*.3+G*.6+B*.1);
    
    subplot(1,2,1);
    imshow(RGB);
    title('RGB');

    subplot(1,2,2);
    imshow(GRAY);
    title('GRAY');
end