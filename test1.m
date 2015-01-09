%%Test1
clear all, close all
%Llamamos a la funci�n bayyernpattern. 
source='lenna2.jpg';
pattern='rggb';
source=imread(source);
[RAW,bayer]=bayernpattern(source,pattern);

%Una vez obtenemos el RAW, hacemos la reconstrucci�n de la imagen.

% imgRec=reconstruyeNearest(pattern,RAW);

%-------IMPLEMENTAR METODOS DE INTERPOLACION LINEAL Y CUBICA-------
%Comparamos las imagenes
% figure
% imshow(bayer)
% imorg=imread(source);
% figure
% imshow([imorg;imgRec]);
% 

imgRec2=reconstruyeLinear(RAW);
% figure
% imshow(imgRec2)
% title('Linear');
% 
% imgRec3=reconstruyeCubic(RAW);
% figure
% imshow(imgRec3)

imgRec=reconstruyeMatiz(RAW,pattern);
imshow(imgRec);
