function [RAW,bayer] = bayernpattern(source,pattern)

%Calculamos el tama�o de la imagen para realizar el filtro de bayer
%oportuno.
imagen=source;
[M,N,O]=size(imagen);
bayer=zeros(M,N,O);
RAW=zeros(M,N,O);
R=1;
G=1;
B=1;
%Vamos comparando que tipo de patron queremos para realizar el filtro de
%bayer

if(strcmp(pattern,'rggb'))
    bayer(1:2:end,1:2:end,1)=R;
    bayer(1:2:end,2:2:end,2)=G;
    bayer(2:2:end,1:2:end,2)=G;
    bayer(2:2:end,2:2:end,3)=B;
end

if(strcmp(pattern,'bggr'))
    bayer(1:2:end,1:2:end,3)=B;
    bayer(1:2:end,2:2:end,2)=G;
    bayer(2:2:end,1:2:end,2)=G;
    bayer(2:2:end,2:2:end,1)=R;
    
end

if(strcmp(pattern,'grbg'))
    bayer(1:2:end,1:2:end,2)=G;
    bayer(1:2:end,2:2:end,1)=R;
    bayer(2:2:end,1:2:end,3)=B;
    bayer(2:2:end,2:2:end,2)=G;
end

if(strcmp(pattern,'gbrg'));
    bayer(1:2:end,1:2:end,2)=G;
    bayer(1:2:end,2:2:end,3)=B;
    bayer(2:2:end,1:2:end,1)=R;
    bayer(2:2:end,2:2:end,2)=G;
end

%Ahora vamos a realizar lo que ser�a el filtrado de la imagen por ese
%filtro de bayer que hemos creado.

for i=1:3
    for j=1:M
        for k=1:N
            RAW(j,k,i)=imagen(j,k,i)*bayer(j,k,i);
        end
    end
end

end
