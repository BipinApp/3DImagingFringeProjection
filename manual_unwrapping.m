%manual unwrapping for specific location 
function [unwrapped_phase]=manual_unwrapping(unwrapped_phase_xy,pi,pos1,pos2,row1,row2)
tol=pi;
temp=unwrapped_phase_xy;
col1=pos1;
col2=pos2;

for i=row1:row2
    for j=col1:col2
        k=0;
        diff=abs(temp(i+1,j)-temp(i,j));
        
        if(diff>tol)
            if((temp(i+1,j)<temp(i,j)))
                k=k+1;
            elseif((temp(i+1,j)>temp(i,j)))
                k=k-1;
            end
        end
        temp(i+1:row2,j)=temp(i+1:row2,j)+(2*tol*k).*ones(row2-i,1);
    end
end
unwrapped_phase=temp;
end
