%Funci?n que calcula el error cuadratico medio. 
function ecm=calculaECM(imorig,imres,metodo)
%Pasamos las imagenes a double antes de calcularle el ecm para poder
%realizar las operaciones.
imorig= double(imorig);
imres=double(imres);

if(strcmp(metodo,'Nearest'))
ecm=sqrt(sum(sum((-imorig+imres).^2))/numel(imorig(:,:,1)));

elseif(strcmp(metodo,'Linear'))
ecm=sqrt(sum(sum((-imorig(2:end,2:end,:)+imres(2:end,2:end,:)).^2))/numel(imorig(2:end,2:end,1)));

elseif(strcmp(metodo,'Matiz'))
ecm=sqrt(sum(sum((-imorig(3:end,3:end,:)+imres(3:end,3:end,:)).^2))/numel(imorig(3:end,3:end,1)));
end


end