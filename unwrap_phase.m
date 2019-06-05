%%same algorithm followed by many papers as well as matlab 1d matlab
%%function
function unwrapped_phase=unwrap_phase(unwrp_phase, tol,offset)
    wphasedata=unwrp_phase;
    alphaphase=tol;
    [row, col,d]=size(wphasedata);
    delta=zeros(row,col);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%unwrapping along x-direction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x_newphase=wphasedata;
    for i=1:row-offset 
        for j=1:col
            k=0;
            delta(i,j)=x_newphase(i+offset,j)-x_newphase(i,j);
            if (abs(delta(i,j)) > alphaphase)
                if  x_newphase(i+1,j) < x_newphase(i,j)
                    k=k+1;
                elseif x_newphase(i+1,j) > x_newphase(i,j)
                    k=k-1;
                end
            end
            x_newphase(i+offset:end,j)=x_newphase(i+offset:end,j)+(2*tol*k).*ones(row-i*offset,1);
         end
    end
    x_newphase(i,:)=x_newphase(i-1,:); 
    unwrapped_Phase_x=x_newphase;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%unwrapping along y-direction%%%%%%%%%%%%%%%  
   y_newphase=unwrapped_Phase_x;%wphasedata;
    dely_sig=zeros(row,col);
    for i=1:row
        for j=1:col-offset
             k=0;
            dely_sig(i,j)=y_newphase(i,j+offset)-y_newphase(i,j);
            if (abs(dely_sig(i,j))>alphaphase)
                if y_newphase(i,j+1) < y_newphase(i,j)
                    k=k+1;
                elseif y_newphase(i,j+1)>y_newphase(i,j)
                    k=k-1;
                end
            end
            y_newphase(i,j+offset:end)=y_newphase(i,j+offset:end)+(2*tol*k).*ones(1,col-j*offset);
        end
    end
    y_newphase(:,j)=y_newphase(:,j-1);
    unwrapped_Phase_y=y_newphase;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%2nd unwrapping along x-direction..to do smooth%%%%%%%%%%%%%%%%%%%%%%%
x_newphase=unwrapped_Phase_y;
    for i=1:row-offset 
        for j=300:col
            k=0;
            delta(i,j)=x_newphase(i+offset,j)-x_newphase(i,j);
            if (abs(delta(i,j)) > alphaphase)
                if  x_newphase(i+1,j) < x_newphase(i,j)
                    k=k+1;
                elseif x_newphase(i+1,j) > x_newphase(i,j)
                    k=k-1;
                end
            end
            x_newphase(i+offset:end,j)=x_newphase(i+offset:end,j)+(2*tol*k).*ones(row-i*offset,1);
        end
    end
    x_newphase(i,:)=x_newphase(i-1,:); 
    unwrapped_Phase_x=x_newphase;
    unwrapped_Phase=unwrapped_Phase_x;

end