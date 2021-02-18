% Image_Threshold
% 27 - Nov - 2018
% Gourav Siddhad

ImRGB = imread('sample.png');

ImGray = rgb2gray(ImRGB);
[m,n] = size(ImGray);
ImThres = zeros(m,n,'uint8');

for i=1:m
    for j=1:n
        if(ImGray(i,j)<=127)
            ImThres(i,j)=0;
        else
            ImThres(i,j)=255;
        end
    end
end

figure;
subplot(1,3,1);
imshow(ImRGB);
title('Original');

subplot(1,3,2);
imshow(ImGray);
title('Gray');

subplot(1,3,3);
imshow(ImThres);
title('Threshold');