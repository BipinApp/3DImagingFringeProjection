clc;
close all;

files=ls('F:\DIP project\Image\FringeImage');
files(1:2,:)=[];
  angle=0.8;  
    %for fringe pattern
    for j=1:5
    imagename=files(j,:);
    fringe_img=imread(strcat('F:\DIP project\Image\FringeImage\',imagename));
    fringe_img=imrotate(fringe_img,angle);
    % temp2(i,:,:)=fringe_img(1200:2000,1000:2500);
      temp2(j,:,:)=fringe_img(300:1900,1180:2150);
    fringe_image(:,:)=temp2(j,:,:);
     save(strcat('fringe_image',num2str(j),'.mat'),'fringe_image')
    end
    figure(1)
    colormap(gray(256))
    image(fringe_image);
    