function [imgRec] = reconstruyeNearest(pattern,RAW)

%Calculamos el tamaño de la imagen.
[M,N,O]=size(RAW);
imgRec=zeros(M,N,O);

if(mod(M,2)~=0)
    %RAW=RAW(1:M-1,:,:);
    M=M-1;
end
if(mod(N,2)~=0)
    %RAW=RAW(:,1:N-1,:);
    N=N-1;
end
%METODO NEAREST

if(strcmp(pattern,'rggb'))
    %Rojo
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,1)=RAW(j,k,1);
            imgRec(j,k+1,1)=RAW(j,k,1);
            imgRec(j+1,k,1)=RAW(j,k,1);
            imgRec(j+1,k+1,1)=RAW(j,k,1);
            end
        end
        
   %Verde
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,2)=RAW(j,k+1,2);
            imgRec(j,k+1,2)=RAW(j,k+1,2);
            imgRec(j+1,k,2)=RAW(j+1,k,2);
            imgRec(j+1,k+1,2)=RAW(j+1,k,2);
            end
        end
    %Azul
      
       for j=1:2:M
            for k=1:2:N
            imgRec(j,k,3)=RAW(j+1,k+1,3);
            imgRec(j,k+1,3)=RAW(j+1,k+1,3);
            imgRec(j+1,k,3)=RAW(j+1,k+1,3);
            imgRec(j+1,k+1,3)=RAW(j+1,k+1,3);
            end
        end
end

if(strcmp(pattern,'bggr'))
    %Azul
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,3)=RAW(j,k,3);
            imgRec(j,k+1,3)=RAW(j,k,3);
            imgRec(j+1,k,3)=RAW(j,k,3);
            imgRec(j+1,k+1,3)=RAW(j,k,3);
            end
        end
        
   %Verde
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,2)=RAW(j,k+1,2);
            imgRec(j,k+1,2)=RAW(j,k+1,2);
            imgRec(j+1,k,2)=RAW(j+1,k,2);
            imgRec(j+1,k+1,2)=RAW(j+1,k,2);
            end
        end
    %Rojo
      
       for j=1:2:M
            for k=1:2:N
            imgRec(j,k,1)=RAW(j+1,k+1,1);
            imgRec(j,k+1,1)=RAW(j+1,k+1,1);
            imgRec(j+1,k,1)=RAW(j+1,k+1,1);
            imgRec(j+1,k+1,1)=RAW(j+1,k+1,1);
            end
       end
        
end  

if(strcmp(pattern,'grbg'))
    %Rojo
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,1)=RAW(j,k+1,1);
            imgRec(j,k+1,1)=RAW(j,k+1,1);
            imgRec(j+1,k,1)=RAW(j,k+1,1);
            imgRec(j+1,k+1,1)=RAW(j,k+1,1);
            end
        end
        
   %Verde
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,2)=RAW(j,k,2);
            imgRec(j,k+1,2)=RAW(j,k,2);
            imgRec(j+1,k,2)=RAW(j+1,k+1,2);
            imgRec(j+1,k+1,2)=RAW(j+1,k+1,2);
            end
        end
    %Azul
      
       for j=1:2:M
            for k=1:2:N
            imgRec(j,k,3)=RAW(j+1,k,3);
            imgRec(j,k+1,3)=RAW(j+1,k,3);
            imgRec(j+1,k,3)=RAW(j+1,k,3);
            imgRec(j+1,k+1,3)=RAW(j+1,k,3);
            end
        end
end

if(strcmp(pattern,'gbrg'))
    %Azul
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,3)=RAW(j,k+1,3);
            imgRec(j,k+1,3)=RAW(j,k+1,3);
            imgRec(j+1,k,3)=RAW(j,k+1,3);
            imgRec(j+1,k+1,3)=RAW(j,k+1,3);
            end
        end
        
   %Verde
        for j=1:2:M
            for k=1:2:N
            imgRec(j,k,2)=RAW(j,k,2);
            imgRec(j,k+1,2)=RAW(j,k,2);
            imgRec(j+1,k,2)=RAW(j+1,k+1,2);
            imgRec(j+1,k+1,2)=RAW(j+1,k+1,2);
            end
        end
    %Rojo
      
       for j=1:2:M
            for k=1:2:N
            imgRec(j,k,1)=RAW(j+1,k,1);
            imgRec(j,k+1,1)=RAW(j+1,k,1);
            imgRec(j+1,k,1)=RAW(j+1,k,1);
            imgRec(j+1,k+1,1)=RAW(j+1,k,1);
            end
        end
end


imgRec=uint8(imgRec);

end

