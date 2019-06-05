close all;
clc;

%trimming the the images
% trimming1();
[phase_fringe,phase_head]=phase_calculation();

figure(3)
colormap(gray(256))
imagesc(phase_fringe);
title('Phase of reference image')

figure(4)
colormap(gray(256))
imagesc(phase_head);
title('Phase of head image')

phase_difference=phase_head-phase_fringe;
figure(5)
colormap(gray(256))
imagesc(phase_difference);
title('Phase difference between head and fringe')

%figure(6);colormap(gray(256));
%imagesc(phase_difference/max(max(phase_difference))*255);
%title('Wrapped phase difference between head and fringe')

[unwrapped_phase_x,unwrapped_phase_xy,unwrapped_phase_xyx]=unwrap_phase(phase_difference,pi);

figure(7);
colormap(gray(256));
imagesc(unwrapped_phase_x);
title('Unwrapped Phase along x direction');


figure(8);
colormap(gray(256));
imagesc(unwrapped_phase_xy);
title('Unwrapped Phase along x-y direction');

%figure(9);
%colormap(gray(256));
%imagesc(unwrapped_phase_xyx);
%title('Unwrapped Phase along x direction second');

%figure(10);
%colormap(gray(256));
%imagesc(unwrapped_phase2);
%title('Unwrapped Phase along x-y direction second');
row1=825;
row2=900;
pos1=290;
pos2=601;
[unwrapped_phase]=manual_unwrapping(unwrapped_phase_xy,pi,pos1,pos2,row1,row2);

figure(9);
colormap(gray(256));
imagesc(unwrapped_phase);
title('Manual unwrapping');

fft_img=fft2(unwrapped_phase);
figure (10)
colormap(gray(256))
image(abs(fft_img));
title('Magnitude spectrum of image')

fft_shift_img=fftshift(fft_img);
figure(11)
colormap(gray(256))
image(abs(fft_shift_img));
title('Magnitude of shifted spectrum of image')

[row,col]=size(fft_img);
Do=100;  %cut off frequency
n=3 ; %order of butterworth filter
butterworth_low_pass=zeros(row,col);
for u=1:row
    for v=1:col
        
        D(u,v)=sqrt((u-row/2)^2+(v-col/2)^2);
        butterworth_low_pass(u,v)=1/(1+(D(u,v)/Do)^(2*n));
    end
end
figure(12)
colormap(gray(256))
imagesc(butterworth_low_pass)
title('Butterworth low pass filter');

output_img=fft_shift_img.*butterworth_low_pass;

figure(13)
colormap(gray(256))
image(abs(output_img));
title('Output of low pass filter');

original_img=ifft2(output_img);
ori_img=abs(original_img);
%normalise_img=ori_img./max(max(ori_img))*255;
figure(14)
colormap(gray(256))
imagesc(ori_img)
title('recovered image')


%ori_img=imrotate(ori_img,-180);
figure(15)
colormap(gray(256))
mesh(ori_img)


