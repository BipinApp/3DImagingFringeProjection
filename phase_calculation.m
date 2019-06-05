function [phase_fringe,phase_head]= phase_calculation()

fringe_imaginary=0;
fringe_real=0;
head_imaginary=0;
head_real=0;

for i=1:5
    
    fringe_image=load(strcat('fringe_image',num2str(i),'.mat'));
    head_image=load(strcat('head_image',num2str(i),'.mat'));
    fringe_imaginary=fringe_imaginary+double(fringe_image.fringe_image).*sin(2*pi*i/5);
    fringe_real=fringe_real+double(fringe_image.fringe_image).*cos(2*pi*i/5);
    head_imaginary=head_imaginary+double(head_image.head_image).*sin(2*pi*i/5);
    head_real=head_real+double(head_image.head_image).*cos(2*pi*i/5);
end
    phase_fringe=atan2(fringe_imaginary,fringe_real);
    phase_head=atan2(head_imaginary,head_real);
end
