function [imgRec] = reconstruyeMatiz(RAW,pattern)
%Calculamos el tamaño.
[M,N,O]=size(RAW);
imgRec=zeros(M,N,O);
%Obtenemos el verde de la interpolacion Lineal:

A=reconstruyeLinear(RAW);
imgRec(:,:,2)=A(:,:,2);

if(strcmp(pattern,'rggb'))
    %Azul
    for i=2:M-1
        for j=2:N-1
            %Fila par
            if((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i,j-1,3)/imgRec(i,j-1,2)+RAW(i,j+1,3)/imgRec(i,j+1,2));
            elseif((mod(i,2)==0)&&(mod(j,2)==0))
                imgRec(i,j,3)=RAW(i,j,3);
            %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i-1,j,3)/imgRec(i-1,j,2)+RAW(i+1,j,3)/imgRec(i+1,j,2));
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=imgRec(i,j,2)/4*(RAW(i-1,j-1,3)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,3)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,3)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,3)/imgRec(i+1,j+1,2));
            end
        end
    end   
    %Rojo
    for i=2:M-1
        for j=2:N-1
             %Fila par
            if((mod(i,2)==0)&&(mod(j,2)==0))
                 imgRec(i,j,1)=imgRec(i,j,2)/4*(RAW(i-1,j-1,1)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,1)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,1)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,1)/imgRec(i+1,j+1,2));
            elseif((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i-1,j,1)/imgRec(i-1,j,2)+RAW(i+1,j,1)/imgRec(i+1,j,2));
             %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))   
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i,j-1,1)/imgRec(i,j-1,2)+RAW(i,j+1,1)/imgRec(i,j+1,2));      
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=RAW(i,j,1);                
            end
        end
    end
end


if(strcmp(pattern,'bggr'))
    %Rojo
    for i=2:M-1
        for j=2:N-1
            %Fila par
            if((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i,j-1,1)/imgRec(i,j-1,2)+RAW(i,j+1,1)/imgRec(i,j+1,2));
            elseif((mod(i,2)==0)&&(mod(j,2)==0))
                imgRec(i,j,1)=RAW(i,j,1);
            %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i-1,j,1)/imgRec(i-1,j,2)+RAW(i+1,j,1)/imgRec(i+1,j,2));
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=imgRec(i,j,2)/4*(RAW(i-1,j-1,1)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,1)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,1)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,1)/imgRec(i+1,j+1,2));
            end
        end
    end   
    %Rojo
    for i=2:M-1
        for j=2:N-1
             %Fila par
            if((mod(i,2)==0)&&(mod(j,2)==0))
                 imgRec(i,j,3)=imgRec(i,j,2)/4*(RAW(i-1,j-1,3)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,3)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,3)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,3)/imgRec(i+1,j+1,2));
            elseif((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i-1,j,3)/imgRec(i-1,j,2)+RAW(i+1,j,3)/imgRec(i+1,j,2));
             %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))   
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i,j-1,3)/imgRec(i,j-1,2)+RAW(i,j+1,3)/imgRec(i,j+1,2));      
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=RAW(i,j,3);                
            end
        end
    end
end

if(strcmp(pattern,'grbg'))
    %Azul
    for i=2:M-1
        for j=2:N-1
            %Fila par
            if((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=RAW(i,j,3);               
            elseif((mod(i,2)==0)&&(mod(j,2)==0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i,j-1,3)/imgRec(i,j-1,2)+RAW(i,j+1,3)/imgRec(i,j+1,2));
            %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))
                 imgRec(i,j,3)=imgRec(i,j,2)/4*(RAW(i-1,j-1,3)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,3)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,3)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,3)/imgRec(i+1,j+1,2));
                
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i-1,j,3)/imgRec(i-1,j,2)+RAW(i+1,j,3)/imgRec(i+1,j,2));    
            end
        end
    end   
    %Rojo
    for i=2:M-1
        for j=2:N-1
             %Fila par
            if((mod(i,2)==0)&&(mod(j,2)==0))
                 imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i-1,j,1)/imgRec(i-1,j,2)+RAW(i+1,j,1)/imgRec(i+1,j,2));    
            elseif((mod(i,2)==0)&&(mod(j,2)~=0))
                 imgRec(i,j,1)=imgRec(i,j,2)/4*(RAW(i-1,j-1,1)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,1)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,1)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,1)/imgRec(i+1,j+1,2));
             %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0)) 
                imgRec(i,j,1)=RAW(i,j,1); 
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i,j-1,1)/imgRec(i,j-1,2)+RAW(i,j+1,1)/imgRec(i,j+1,2));      
               
            end
        end
    end
end


if(strcmp(pattern,'gbrg'))
    %Rojo
    for i=2:M-1
        for j=2:N-1
            %Fila par
            if((mod(i,2)==0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=RAW(i,j,1);               
            elseif((mod(i,2)==0)&&(mod(j,2)==0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i,j-1,1)/imgRec(i,j-1,2)+RAW(i,j+1,1)/imgRec(i,j+1,2));
            %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0))
                 imgRec(i,j,1)=imgRec(i,j,2)/4*(RAW(i-1,j-1,1)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,1)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,1)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,1)/imgRec(i+1,j+1,2));
                
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,1)=imgRec(i,j,2)/2*(RAW(i-1,j,1)/imgRec(i-1,j,2)+RAW(i+1,j,1)/imgRec(i+1,j,2));    
            end
        end
    end   
    %Azul
    for i=2:M-1
        for j=2:N-1
             %Fila par
            if((mod(i,2)==0)&&(mod(j,2)==0))
                 imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i-1,j,3)/imgRec(i-1,j,2)+RAW(i+1,j,3)/imgRec(i+1,j,2));    
            elseif((mod(i,2)==0)&&(mod(j,2)~=0))
                 imgRec(i,j,3)=imgRec(i,j,2)/4*(RAW(i-1,j-1,3)/imgRec(i-1,j-1,2)+RAW(i-1,j+1,3)/imgRec(i-1,j+1,2)+...
                    RAW(i+1,j-1,3)/imgRec(i+1,j-1,2)+RAW(i+1,j+1,3)/imgRec(i+1,j+1,2));
             %Fila impar
            elseif((mod(i,2)~=0)&&(mod(j,2)==0)) 
                imgRec(i,j,3)=RAW(i,j,3); 
            elseif((mod(i,2)~=0)&&(mod(j,2)~=0))
                imgRec(i,j,3)=imgRec(i,j,2)/2*(RAW(i,j-1,3)/imgRec(i,j-1,2)+RAW(i,j+1,3)/imgRec(i,j+1,2));      
               
            end
        end
    end
end
imgRec=uint8(imgRec);

end

