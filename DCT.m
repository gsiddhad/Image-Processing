% DCT / Perform and Analyse DCT
% 14 - Oct - 2018
% Gourav Siddhad

function DCT()
    RGB = imread('sample.png');
    GRAY = rgb2gray(RGB);

    % Compute DCT
    GRAYDCT = dct2(GRAY);

    figure;
    subplot(2,2,1);
    imshow(GRAY);
    title('Original');
    subplot(2,2,2);
    imshow(log(abs(GRAYDCT)),[]);
    title('DCT of Image');

    % Set Values less than 5 to 0 in DCT Matrix
    GRAYDCT(abs(GRAYDCT) < 5) = 0;
    IGRAYDCT = idct2(GRAYDCT)/255;

    subplot(2,2,3);
    imshow(log(abs(GRAYDCT)),[]);
    title('Modified DCT of Image');
    subplot(2,2,4);
    imshow(log(abs(IGRAYDCT)),[]);%,colormap(jet(64));
    title('Inversed DCT of Image');
end
