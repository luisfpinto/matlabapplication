function varargout = proy1(varargin)
% PROY1 MATLAB code for proy1.fig
%      PROY1, by itself, creates a new PROY1 or raises the existing
%      singleton*.
%
%      H = PROY1 returns the handle to a new PROY1 or the handle to
%      the existing singleton*.
%
%      PROY1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROY1.M with the given input arguments.
%
%      PROY1('Property','Value',...) creates a new PROY1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proy1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proy1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proy1

% Last Modified by GUIDE v2.5 07-Jan-2015 16:24:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proy1_OpeningFcn, ...
                   'gui_OutputFcn',  @proy1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before proy1 is made visible.
function proy1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proy1 (see VARARGIN)

% Choose default command line output for proy1
handles.output = hObject;
handles.metodo='Nearest';
handles.pattern='rggb';
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes proy1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proy1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
source=handles.source;
source=imread(source);
pattern=handles.pattern;
[RAW,bayer]=bayernpattern(source,pattern);
imshow(bayer(1:10,1:10,:),'Parent',handles.axes3)
metodo=handles.metodo;
if(strcmp(metodo,'Nearest'))
imgRec=reconstruyeNearest(pattern,RAW);
end
if(strcmp(metodo,'Linear'))
imgRec=reconstruyeLinear(RAW);
end
if(strcmp(metodo,'Matiz'))
imgRec=reconstruyeMatiz(RAW,pattern);
end
if(strcmp(metodo,'Nearest'))
imshow(source,'Parent',handles.axes1)
imshow(imgRec,'Parent',handles.axes2)
end
if(strcmp(metodo,'Linear'))
imshow(source(2:end-1,2:end-1,:),'Parent',handles.axes1)
imshow(imgRec(2:end-1,2:end-1,:),'Parent',handles.axes2)
end
if(strcmp(metodo,'Matiz'))
imshow(source(3:end-2,3:end-2,:),'Parent',handles.axes1)
imshow(imgRec(3:end-2,3:end-2,:),'Parent',handles.axes2)
end
%calculamos el ECM
err=calculaECM(source,imgRec,metodo);
err_1=strcat('R=',num2str(err(1)));
err_2=strcat('G=',num2str(err(2)));
err_3=strcat('B=',num2str(err(3)));
set(handles.text9,'String',err_1);
set(handles.text10,'String',err_2);
set(handles.text11,'String',err_3);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject,eventdata,handles)
str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
case 'Nearest'
    metodo='Nearest';
case 'Linear'
    metodo='Linear';
case 'Matiz'
    metodo='Matiz';
end

handles.metodo=metodo;
guidata(hObject,handles);



% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
case 'rggb' 
    pattern='rggb';
case 'bggr'
    pattern='bggr';
case 'grbg'
    pattern='grbg';
case 'gbrg'
    pattern='gbrg';
end

handles.pattern=pattern;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
source=uigetfile('*.jpg','Select the image');
handles.source=source;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Patron rggb
source=handles.source;
source=imread(source);
error=500;
aux=0;
for i=1:4
bayers=['rggb';'bggr';'grbg';'gbrg'];
metodos={'Nearest';'Linear';'Matiz'};

RAW=bayernpattern(source,bayers(i,:));
imgRec_1=reconstruyeNearest(bayers(i,:),RAW);
imgRec_2=reconstruyeLinear(RAW);
imgRec_3=reconstruyeMatiz(RAW,bayers(i,:));
err_1=calculaECM(source,imgRec_1,metodos{1,1});
err_2=calculaECM(source,imgRec_2,metodos{2,1});
err_3=calculaECM(source,imgRec_3,metodos{3,1});
[aux,j]=min([mean(err_1),mean(err_2),mean(err_3)]);
if(aux<error)
    error=aux;
    indice_bayer=i;
    indice_metodo=j;
end
end
%indice_metodo
%metodos{indice_metodo,1}
msgbox(['El mejor metodo es:',metodos{indice_metodo,1},' con el patron de bayer: ',bayers(indice_bayer,:)]);