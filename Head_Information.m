clc;
close all;
files=ls('F:\DIP project\Image\HeadImage');
angle=1.6;
 files(1:2,:)=[];
for i=1:5
   imagename=files(i,:);

    head_img=imread(strcat('F:\DIP project\Image\HeadImage\',imagename));
    [r1,c1]=size(head_img);
    head_img=imrotate(head_img,angle);
  
     temp1(i,:,:)=head_img(300:1900,1180:2150);
    head_image(:,:)=temp1(i,:,:);
    
  
    save(strcat('head_image',num2str(i),'.mat'),'head_image');
    
    figure(2)
    colormap(gray(256))
    image(head_image); 
end 