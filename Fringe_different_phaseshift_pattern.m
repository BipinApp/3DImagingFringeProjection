clc;   
close all;  
clear;  
workspace; 
warning off
format long g;
format compact;
fontSize = 24;
rows = 1080;
columns = 1920;
% Make an image with rippled lines in it.
period = 50; % 20 rows
frequency  = 1/period;
% Fs = 3*frequency; %sampling frequency
% dn  = 1/Fs;
figure (1)
rowVector = (1 : rows)';
columnVector=(1:columns)';
cosVector1 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector-2*pi/3) ;
ripplesImage = repmat(cosVector1,1,columns);
imshow(ripplesImage,[] );
axis on;
title('Ripple image -120', 'FontSize', fontSize);

figure (2)
cosVector2 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector) ;
ripplesImage = repmat(cosVector2, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image 0 phase shift', 'FontSize', fontSize);

figure (3)
cosVector3 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector + 2*pi/3) ;
ripplesImage = repmat(cosVector3, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image 120 phase shift', 'FontSize', fontSize);

figure (4)
cosVector4 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector + 2*pi) ;
ripplesImage = repmat(cosVector3, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image 360 phase shift', 'FontSize', fontSize);

figure (5)
cosVector5 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector + pi) ;
ripplesImage = repmat(cosVector3, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image 180 phase shift', 'FontSize', fontSize);

figure (6)
cosVector6 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector + pi/2) ;
ripplesImage = repmat(cosVector3, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image +90 phase shift', 'FontSize', fontSize);

figure (7)
cosVector7 = 127.5 + 127.5*cos(2 * pi *frequency*rowVector - pi/2) ;
ripplesImage = repmat(cosVector3, [1, columns]);
imshow(ripplesImage, []);
axis on;
title('Ripple image -90 phase shift', 'FontSize', fontSize);

% Vertical fringe
figure (8)
colVector = (1:columns);
cosVector8 = 127.5 + 127.5*cos(2 * pi *frequency*colVector ) ;
ripplesImage = repmat(cosVector2', [1, rows]);
imshow(imrotate(ripplesImage2,90), []);
axis on;

