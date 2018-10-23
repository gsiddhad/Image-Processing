% FFT / Perform and Analyse FFT
% 14 - Oct - 2018
% Gourav Siddhad

function FFT()
    RGB = imread('sample.png', 'png');
    GRAY = rgb2gray(RGB);
    
    % Fourier Transform
    GRAYF = fft2(GRAY); 
    
    % Magnitude
    GRAYMag = abs(GRAYF);
   
    % Centered Spectrum
    GRAYFCenter = fftshift(GRAYF);
    
    % log Transform
    GRAYFCLog = log(1+abs(GRAYFCenter));
     
    % Reconstruct
    GRAYF = ifftshift(GRAYFCenter);
    IGRAYF = ifft2(GRAYF);
    
    figure;
    subplot(2,3,1);
    imshow(RGB);
    title('Original');
    
    subplot(2,3,2);
    imshow(GRAY);
    title('Gray');
    
    subplot(2,3,3);
    imshow(log(GRAYMag),[]);    % Not Visible, Therefore Used Log
    title('Magnitude - FT');
    
    subplot(2,3,4);
    imshow(log(abs(GRAYFCenter)),[]);   % Not Visible, Therefore Used Log
    title('Centered Spectrum');
    
    subplot(2,3,5);
    imshow(GRAYFCLog,[]);
    title('Log Transform');
    
    subplot(2,3,6);
    imshow(IGRAYF,[]);
    title('Image Reconstruction');
end
