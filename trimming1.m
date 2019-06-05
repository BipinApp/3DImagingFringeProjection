function trimming1()
files=ls('F:\DIP project\Image')
angle=0.8
 files(1:2,:)=[]
for i=1:5
   imagename=files(i,:)
    head_img=imread(strcat('F:\DIP project\Image\',imagename));
%end
    %fringe_img=imread(strcat('/Users/maheshshrestha/Desktop/Project/Images/IMG_5270.JPG'));
    [r1,c1]=size(head_img);
   % [r2,c2]=size(fringe_img)
    head_img=imrotate(head_img,angle);
   % figure (i)
    %image(head_img);
    %temp1(i,:,:)=head_img(400:2000,1000:2500);
     temp1(i,:,:)=head_img(500:1900,1000:1600);
    head_image(:,:)=temp1(i,:,:);
    %figure (i)
    %colormap(gray(256))
    %image(temp1);
    
   % head_img=temp1;
    save(strcat('head_image',num2str(i),'.mat'),'head_image');
    
    
   % figure (i)
    %colormap(gray(256))
    %imagesc(head_image);
    
    
    %for fringe pattern
    imagename=files(i+5,:)
    fringe_img=imread(strcat('F:\DIP project\Image\',imagename));
    frige_img=imrotate(fringe_img,angle);
    % temp2(i,:,:)=fringe_img(1200:2000,1000:2500);
      temp2(i,:,:)=fringe_img(500:1900,1000:1600);
    fringe_image(:,:)=temp2(i,:,:);
     save(strcat('fringe_image',num2str(i),'.mat'),'fringe_image')
end
    figure(1)
    colormap(gray(256))
    image(fringe_image);
    
    figure(2)
    colormap(gray(256))
    image(head_image); 
    
end
    %for fringe image
    %fringe_img=imrotate(fringe_img,angle);
    %figure(4)
    %image(fringe_img);
    %temp2(:,:)=fringe_img(400:2000,1000:2500);
    
    %figure (5)
    %colormap(gray(256))
    %image(temp2);
    
    %fringe_img=temp2;
    %save(strcat('fringe_img','.mat'),'fringe_img')
    
    %figure (6)
    %colormap(gray(256))
    %image(fringe_img);
    

        