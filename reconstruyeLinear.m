function [imgRec] = reconstruyeLinear(RAW)

%Calculamos el tamaño de la imagen
[M,N,O]=size(RAW);
imgRec=zeros(M,N,O);


%Metodo Lineal

n=0;
num=0;
%Rojo centros
for i=2:M-1
    for j=2:N-1
        num=0;
        n=0;
    if(RAW(i,j,1)==0)    
     if(RAW(i-1,j-1,1)~=0)
         num=num+RAW(i-1,j-1,1);
         n=n+1;
     end
      if(RAW(i-1,j,1)~=0)
         num=num+RAW(i-1,j,1);
         n=n+1;
      end
      if(RAW(i-1,j+1,1)~=0)
         num=num+RAW(i-1,j+1,1);
         n=n+1;
      end
      if(RAW(i,j-1,1)~=0)
         num=num+RAW(i,j-1,1);
         n=n+1;
      end
      if(RAW(i,j+1,1)~=0)
         num=num+RAW(i,j+1,1);
         n=n+1;
      end
      if(RAW(i+1,j-1,1)~=0)
         num=num+RAW(i+1,j-1,1);
         n=n+1;
      end
      if(RAW(i+1,j,1)~=0)
         num=num+RAW(i+1,j,1);
         n=n+1;
      end
      if(RAW(i+1,j+1,1)~=0)
         num=num+RAW(i+1,j+1,1);
         n=n+1;
      end
      imgRec(i,j,1)=round(num/n);
      
    else
      imgRec(i,j,1)=RAW(i,j,1);
    end
    end
end


n=0;
num=0;
%Verde centros
for i=2:M-1
    for j=2:N-1
        num=0;
        n=0;
    if(RAW(i,j,2)==0)    
     if(RAW(i-1,j-1,2)~=0)
         num=num+RAW(i-1,j-1,2);
         n=n+1;
     end
      if(RAW(i-1,j,2)~=0)
         num=num+RAW(i-1,j,2);
         n=n+1;
      end
      if(RAW(i-1,j+1,2)~=0)
         num=num+RAW(i-1,j+1,2);
         n=n+1;
      end
      if(RAW(i,j-1,2)~=0)
         num=num+RAW(i,j-1,2);
         n=n+1;
      end
      if(RAW(i,j+1,2)~=0)
         num=num+RAW(i,j+1,2);
         n=n+1;
      end
      if(RAW(i+1,j-1,2)~=0)
         num=num+RAW(i+1,j-1,2);
         n=n+1;
      end
      if(RAW(i+1,j,2)~=0)
         num=num+RAW(i+1,j,2);
         n=n+1;
      end
      if(RAW(i+1,j+1,2)~=0)
         num=num+RAW(i+1,j+1,2);
         n=n+1;
      end
      
      imgRec(i,j,2)=round(num/n);
      
    else
        imgRec(i,j,2)=RAW(i,j,2);
    end
    end
end


n=0;
num=0;
%Azul centros
for i=2:M-1
    for j=2:N-1
        num=0;
        n=0;
    if(RAW(i,j,3)==0)    
     if(RAW(i-1,j-1,3)~=0)
         num=num+RAW(i-1,j-1,3);
         n=n+1;
     end
      if(RAW(i-1,j,3)~=0)
         num=num+RAW(i-1,j,3);
         n=n+1;
      end
      if(RAW(i-1,j+1,3)~=0)
         num=num+RAW(i-1,j+1,3);
         n=n+1;
      end
      if(RAW(i,j-1,3)~=0)
         num=num+RAW(i,j-1,3);
         n=n+1;
      end
      if(RAW(i,j+1,3)~=0)
         num=num+RAW(i,j+1,3);
         n=n+1;
      end
      if(RAW(i+1,j-1,3)~=0)
         num=num+RAW(i+1,j-1,3);
         n=n+1;
      end
      if(RAW(i+1,j,3)~=0)
         num=num+RAW(i+1,j,3);
         n=n+1;
      end
      if(RAW(i+1,j+1,3)~=0)
         num=num+RAW(i+1,j+1,3);
         n=n+1;
      end
      
      imgRec(i,j,3)=round(num/n);
      
    else
        imgRec(i,j,3)=RAW(i,j,3);
    end
   end


end

imgRec=uint8(imgRec);
end