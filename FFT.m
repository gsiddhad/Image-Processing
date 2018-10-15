% FFT / Perform and Analyse FFT
% 14 - Oct - 2018
% Gourav Siddhad

function FFT()
    RGB = imread('sample.png', 'png');
    GRAY = rgb2gray(RGB);
    
    % Fourier Transform
    F = fft2(GRAY); 
    
    % Magnitude
    S = abs(F);     
   
    % Centered Spectrum
    Fsh = fftshift(F); 
    
    % log Transform
    S2 = log(1+abs(Fsh));
     
    % Reconstruct
    F = ifftshift(Fsh);
    f = ifft2(F);
    
    figure;
    subplot(2,3,1);
    imshow(RGB);
    title('Original');
    
    subplot(2,3,2);
    imshow(GRAY);
    title('Gray');
    
    subplot(2,3,3);
    imshow(S,[]);
    title('Magnitude - FT');
    
    subplot(2,3,4);
    imshow(abs(Fsh),[]);
    title('Centered Spectrum');
    
    subplot(2,3,5);
    imshow(S2,[]);
    title('Log Transform');
    
    subplot(2,3,6);
    imshow(f,[]);
    title('Image Reconstruction');
end
