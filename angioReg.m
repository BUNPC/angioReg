function varargout = angioReg(varargin)
% ANGIOREG MATLAB code for angioReg.fig
%      ANGIOREG, by itself, creates a new ANGIOREG or raises the existing
%      singleton*.
%
%      H = ANGIOREG returns the handle to a new ANGIOREG or the handle to
%      the existing singleton*.
%
%      ANGIOREG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANGIOREG.M with the given input arguments.
%
%      ANGIOREG('Property','Value',...) creates a new ANGIOREG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before angioReg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to angioReg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help angioReg

% Last Modified by GUIDE v2.5 02-Mar-2018 14:28:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @angioReg_OpeningFcn, ...
                   'gui_OutputFcn',  @angioReg_OutputFcn, ...
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


% --- Executes just before angioReg is made visible.
function angioReg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to angioReg (see VARARGIN)

% Choose default command line output for angioReg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes angioReg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = angioReg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_TPM_Callback(hObject, eventdata, handles)
% hObject    handle to slider_TPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global Data
if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
    Tz = size(Data.TTPM,1);
else
    Tz = size(Data.TPM,1); 
end
jj = round(get(handles.slider_TPM,'Value'));
jj = min(max(jj,1),Tz);
ii = Tz-jj+1;
set(handles.edit_TPMframeno,'String',num2str(ii));
if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
         Oz = size(Data.TOCT,1);
    else
        Oz = size(Data.OCT,1);
    end
    jj = min(max(jj,1),Oz);
    set(handles.slider_OCT,'Value',jj);
    ii = Oz-jj+1;
    set(handles.edit_OCTframeno,'String',num2str(ii));
end
draw(hObject, eventdata, handles);




% --- Executes during object creation, after setting all properties.
function slider_TPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_TPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_OCT_Callback(hObject, eventdata, handles)
% hObject    handle to slider_OCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global Data
if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
     Oz = size(Data.TOCT,1);
else
    Oz = size(Data.OCT,1);
end
jj = round(get(handles.slider_OCT,'Value'));
jj = min(max(jj,1),Oz);
ii = Oz-jj+1;
set(handles.edit_OCTframeno,'String',num2str(ii));
if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
        Tz = size(Data.TTPM,1);
    else
        Tz = size(Data.TPM,1); 
    end
    jj = min(max(jj,1),Tz);
    set(handles.slider_TPM,'Value',jj);
    ii = Tz-jj+1;
    set(handles.edit_TPMframeno,'String',num2str(ii));  
end
draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function slider_OCT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_OCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_TPMframeno_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TPMframeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TPMframeno as text
%        str2double(get(hObject,'String')) returns contents of edit_TPMframeno as a double

global Data
if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
    Tz = size(Data.TTPM,1);
else
    Tz = size(Data.TPM,1); 
end
ii = str2double(get(handles.edit_TPMframeno,'String'));
jj = Tz-ii+1;
jj = min(max(jj,1),Tz);
set(handles.slider_TPM,'Value',jj);
if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
         Oz = size(Data.TOCT,1);
    else
        Oz = size(Data.OCT,1);
    end
    jj = min(max(jj,1),Oz);
    set(handles.slider_OCT,'Value',jj);
    ii = Oz-jj+1;
    set(handles.edit_OCTframeno,'String',num2str(ii));
end
draw(hObject, eventdata, handles);




% --- Executes during object creation, after setting all properties.
function edit_TPMframeno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_TPMframeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_OCTframeno_Callback(hObject, eventdata, handles)
% hObject    handle to edit_OCTframeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_OCTframeno as text
%        str2double(get(hObject,'String')) returns contents of edit_OCTframeno as a double

global Data
if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
    Oz = size(Data.TOCT,1);
else
    Oz = size(Data.OCT,1);
end
ii = str2double(get(handles.edit_OCTframeno,'String'));
jj = Oz-ii+1;
jj = min(max(jj,1),Oz);
set(handles.slider_OCT,'Value',jj);
if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
        Tz = size(Data.TTPM,1);
    else
        Tz = size(Data.TPM,1); 
    end
    jj = min(max(jj,1),Tz);
    set(handles.slider_TPM,'Value',jj);
    ii = Tz-jj+1;
    set(handles.edit_TPMframeno,'String',num2str(ii));  
end
draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function edit_OCTframeno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_OCTframeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_loaddata_Callback(hObject, eventdata, handles)
% hObject    handle to menu_loaddata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

[filename,pathname] = uigetfile({'*.mat;*.tiff;*.tif'},'Please select TPM angiogram');
[pathstr,name,ext] = fileparts(filename);
if strcmp(ext,'.mat')
    temp = load([pathname filename]);
    fn = fieldnames(temp);
    TPM = temp.(fn{1});
elseif strcmp(ext,'.tiff') || strcmp(ext,'.tif')
    info = imfinfo([pathname filename]);
    for u = 1:length(info)
        if u == 1
            temp = imread([pathname filename],1);
            angio = zeros([length(info) size(temp)]);
            angio(u,:,:) = temp;
        else
            angio(u,:,:) = imread([pathname filename],u);
        end
    end
    TPM = angio; 
end

[filename,pathname] = uigetfile({'*.mat;*.tiff;*.tif'},'Please select OCT angiogram');
[pathstr,name,ext] = fileparts(filename);
if strcmp(ext,'.mat')
    temp = load([pathname filename]);
    fn = fieldnames(temp);
    OCT = temp.(fn{1});
elseif strcmp(ext,'.tiff') || strcmp(ext,'.tif')
    info = imfinfo([pathname filename]);
    for u = 1:length(info)
        if u == 1
            temp = imread([pathname filename],1);
            angio = zeros([length(info) size(temp)]);
            angio(u,:,:) = temp;
        else
            angio(u,:,:) = imread([pathname filename],u);
        end
    end
    OCT = angio; 
end
Data.TPM = TPM;
Data.OCT = OCT;

Tz = size(Data.TPM,1);
Oz = size(Data.OCT,1);

set(handles.slider_TPM,'max',Tz);
set(handles.slider_TPM,'min',1);
set(handles.slider_TPM,'Value',Tz);
set(handles.slider_TPM,'SliderStep',[1/(Tz-1), 10/(Tz-1)]);

if Oz > 1
    set(handles.slider_OCT,'max',Oz);
    set(handles.slider_OCT,'min',1);
    set(handles.slider_OCT,'Value',Oz);
    set(handles.slider_OCT,'SliderStep',[1/(Oz-1), 10/(Oz-1)]);
end

draw(hObject, eventdata, handles);


function draw(hObject, eventdata, handles)

global Data

% Tz = size(Data.TPM,1);
% TPMstartframe = round(str2double(get(handles.edit_TPMframeno,'String')));
% TPMstartframe = min(max(TPMstartframe,1),Tz);

% Oz = size(Data.OCT,1);
% OCTstartframe = round(str2double(get(handles.edit_OCTframeno,'String')));
% OCTstartframe = min(max(OCTstartframe,1),Oz);

% TPMmip = round(str2double(get(handles.edit_TPMMIP,'String')));
% TPMendframe = TPMstartframe+TPMmip-1;
% TPMendframe = min(max(TPMendframe,TPMstartframe),Tz);
% OCTmip = round(str2double(get(handles.edit_OCTMIP,'String')));
% OCTendframe = OCTstartframe+OCTmip-1;
% OCTendframe = min(max(OCTendframe,OCTstartframe),Oz);

% TMPimage = squeeze(max(Data.TPM(TPMstartframe:TPMendframe,:,:),[],1));
if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
    Tz = size(Data.TTPM,1);
    TPMstartframe = round(str2double(get(handles.edit_TPMframeno,'String')));
    TPMstartframe = min(max(TPMstartframe,1),Tz);
    TPMmip = round(str2double(get(handles.edit_TPMMIP,'String')));
    TPMendframe = TPMstartframe+TPMmip-1;
    TPMendframe = min(max(TPMendframe,TPMstartframe),Tz);
    TPMimage = squeeze(max(Data.TTPM(TPMstartframe:TPMendframe,:,:),[],1));
else
    Tz = size(Data.TPM,1);
    TPMstartframe = round(str2double(get(handles.edit_TPMframeno,'String')));
    TPMstartframe = min(max(TPMstartframe,1),Tz);
    TPMmip = round(str2double(get(handles.edit_TPMMIP,'String')));
    TPMendframe = TPMstartframe+TPMmip-1;
    TPMendframe = min(max(TPMendframe,TPMstartframe),Tz);
    TPMimage = squeeze(max(Data.TPM(TPMstartframe:TPMendframe,:,:),[],1));
end
if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
    Oz = size(Data.TOCT,1);
    OCTstartframe = round(str2double(get(handles.edit_OCTframeno,'String')));
    OCTstartframe = min(max(OCTstartframe,1),Oz);
    OCTmip = round(str2double(get(handles.edit_OCTMIP,'String')));
    OCTendframe = OCTstartframe+OCTmip-1;
    OCTendframe = min(max(OCTendframe,OCTstartframe),Oz);
    OCTimage = squeeze(max(Data.TOCT(OCTstartframe:OCTendframe,:,:),[],1));
else
    Oz = size(Data.OCT,1);
    OCTstartframe = round(str2double(get(handles.edit_OCTframeno,'String')));
    OCTstartframe = min(max(OCTstartframe,1),Oz);
    OCTmip = round(str2double(get(handles.edit_OCTMIP,'String')));
    OCTendframe = OCTstartframe+OCTmip-1;
    OCTendframe = min(max(OCTendframe,OCTstartframe),Oz);
    OCTimage = squeeze(max(Data.OCT(OCTstartframe:OCTendframe,:,:),[],1));
end


axes(handles.axes1)
colormap('gray');
h = imagesc(TPMimage);
axis image
set(h, 'ButtonDownFcn', {@axes1_ButtonDown, handles});
if isfield(Data,'TPMpoints')
    for u = 1:size(Data.TPMpoints,1)
        if TPMstartframe == Data.TPMpoints(u,1)
            hpt = text(Data.TPMpoints(u,3),Data.TPMpoints(u,2),num2str(u),'Color','g','FontSize',10);
            set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
        end
    end
end

if isfield(Data,'ptstoCompare')
    for u = 1:size(Data.ptstoCompare,1)
        if TPMstartframe == Data.ptstoCompare(u,1)
            text(Data.ptstoCompare(u,3),Data.ptstoCompare(u,2),num2str(u),'Color','b','FontSize',14);
            %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
        end
    end
end



axes(handles.axes2)
colormap('gray');
% h = imagesc(log(OCTimage));
h = imagesc((OCTimage));
axis image
set(h, 'ButtonDownFcn', {@axes2_ButtonDown, handles});
if isfield(Data,'OCTpoints')
    for u = 1:size(Data.OCTpoints,1)
        if OCTstartframe == Data.OCTpoints(u,1)
            hpt = text(Data.OCTpoints(u,3),Data.OCTpoints(u,2),num2str(u),'Color','g','FontSize',10);
            set(hpt,'ButtonDownFcn', sprintf('OCT_deletepoint(%d)',u));
        end
    end
end

if isfield(Data,'ptstoCompare')
    for u = 1:size(Data.ptstoCompare,1)
        if TPMstartframe == Data.ptstoCompare(u,1)
            text(Data.ptstoCompare(u,3),Data.ptstoCompare(u,2),num2str(u),'Color','b','FontSize',14);
            %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
        end
    end
end

if (get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1) && get(handles.radiobutton_overlayTPM,'Value') == 1
    img2 = double(TPMimage);
    img2 = 1-exp(-4*img2/max(img2(:)));
    green = cat(3, zeros(size(img2)),ones(size(img2)), zeros(size(img2))); 
    hold on 
    h = imshow(green); 
    hold off
    set(h, 'AlphaData', img2) 
end

Data.handles =  handles;
Data.hObject =  hObject;
Data.eventdata = eventdata;

function axes1_ButtonDown(hObject, eventdata, handles)

global Data

parent = (get(hObject, 'Parent'));
pts = round(get(parent, 'CurrentPoint'));
y = pts(1,1);
x = pts(1,2);
z = round(str2double(get(handles.edit_TPMframeno,'String')));

if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if isfield(Data,'ptstoCompare')
        Data.ptstoCompare = [Data.ptstoCompare; z x y];
    else
        Data.ptstoCompare = [z x y];
    end
else
    if isfield(Data,'TPMpoints')
        Data.TPMpoints = [Data.TPMpoints; z x y];
    else
        Data.TPMpoints = [z x y];
    end
end
draw(hObject, eventdata, handles);

function axes2_ButtonDown(hObject, eventdata, handles)

global Data

parent = (get(hObject, 'Parent'));
pts = round(get(parent, 'CurrentPoint'));
y = pts(1,1);
x = pts(1,2);
z = round(str2double(get(handles.edit_OCTframeno,'String')));
if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    if isfield(Data,'ptstoCompare')
        Data.ptstoCompare = [Data.ptstoCompare; z x y];
    else
        Data.ptstoCompare = [z x y];
    end
else
    if isfield(Data,'OCTpoints')
        Data.OCTpoints = [Data.OCTpoints; z x y];
    else
        Data.OCTpoints = [z x y];
    end
end
draw(hObject, eventdata, handles);




function edit_TPMMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TPMMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TPMMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_TPMMIP as a double


if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    ii = str2double(get(handles.edit_TPMMIP,'String'));
    set(handles.edit_OCTMIP,'String',num2str(ii));
end
draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function edit_TPMMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_TPMMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_OCTMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_OCTMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_OCTMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_OCTMIP as a double

if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
    ii = str2double(get(handles.edit_OCTMIP,'String'));
    set(handles.edit_TPMMIP,'String',num2str(ii));
end
draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function edit_OCTMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_OCTMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function tools_clearCpoints_Callback(hObject, eventdata, handles)
% hObject    handle to tools_clearCpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

Data.ptstoCompare = [];

draw(hObject, eventdata, handles);



% --------------------------------------------------------------------
function tools_registerOCTtoTPM_Callback(hObject, eventdata, handles)
% hObject    handle to tools_registerOCTtoTPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

if isfield(Data,'TPMpoints') && isfield(Data,'OCTpoints')
    Ts = size(Data.TPMpoints,1);
    Os = size(Data.OCTpoints,1);
    S = min(Ts,Os);
    TPMpoints = Data.TPMpoints(1:S,:);
    OCTpoints = Data.OCTpoints(1:S,:);
    [D,Z,TRANSFORM] = procrustes(OCTpoints, TPMpoints);
    Data.Transform = TRANSFORM;
    img = zeros(size(Data.TPM));
    [Sz,Sx,Sy] = size(img);
    [Az,Ax,Ay] = size(Data.OCT);
    TRANSFORM = Data.Transform;
    for u = 1:Sx
        for v = 1:Sy
            for w=1:Sz
                idx = round(TRANSFORM.b * [w u v] * TRANSFORM.T + TRANSFORM.c(1,:));
                if idx(1) < 1 || idx(1) > Az || idx(2) < 1 || idx(2) > Ax || idx(3) < 1 || idx(3) > Ay
                    img(w,u,v) = 0;
                else
%                     img(w,u,v) = Data.OCT(min(max(idx(1),1),Az),min(max(idx(2),1),Ax),min(max(idx(3),1),Ay));
                      img(w,u,v) = Data.OCT(idx(1),idx(2),idx(3));
                end
            end
        end
    end
    Data.TOCT = img;
end

draw(hObject, eventdata, handles);


% --- Executes on button press in radiobutton_TOCT.
function radiobutton_TOCT_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_TOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_TOCT
global Data

OCTframeno = str2double(get(handles.edit_OCTframeno,'String'));
Oz = size(Data.OCT,1);
OzT = size(Data.TOCT,1);
if get(handles.radiobutton_TOCT,'Value') == 1 && isfield(Data,'TOCT')
    set(handles.slider_OCT,'max',OzT);
    set(handles.slider_OCT,'SliderStep',[1/(OzT-1), 10/(OzT-1)]);
    TOCTframeno = min(max(round(OCTframeno*OzT/Oz),1),OzT);
    Tslidervalue = OzT-TOCTframeno+1;
    set(handles.slider_OCT,'Value',Tslidervalue);
    set(handles.edit_OCTframeno,'String', num2str(TOCTframeno));
else
   set(handles.slider_OCT,'max',Oz);
   set(handles.slider_OCT,'SliderStep',[1/(Oz-1), 10/(Oz-1)]);
   OCTframeno = min(max(round(OCTframeno*Oz/OzT),1),Oz);
   slidervalue = Oz-OCTframeno+1;
   set(handles.slider_OCT,'Value',slidervalue);
   set(handles.edit_OCTframeno,'String', num2str(OCTframeno));
end

draw(hObject, eventdata, handles);


% --- Executes on button press in pushbutton_rot90clockOCT.
function pushbutton_rot90clockOCT_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_rot90clockOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Data.OCT = permute(Data.OCT,[2 3 1]);
Data.OCT = imrotate(Data.OCT,-90);
Data.OCT = permute(Data.OCT,[3 1 2]);
draw(hObject, eventdata, handles);

% --- Executes on button press in pushbutton_rot90anticlockOCT.
function pushbutton_rot90anticlockOCT_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_rot90anticlockOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Data.OCT = permute(Data.OCT,[2 3 1]);
Data.OCT = imrotate(Data.OCT,90);
Data.OCT = permute(Data.OCT,[3 1 2]);
draw(hObject, eventdata, handles);


% --- Executes on button press in pushbutton_transposeOCT.
function pushbutton_transposeOCT_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_transposeOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

Data.OCT = permute(Data.OCT,[1 3 2]);
draw(hObject, eventdata, handles);


% --------------------------------------------------------------------
function tools_registerTPMtoOCT_Callback(hObject, eventdata, handles)
% hObject    handle to tools_registerTPMtoOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

if isfield(Data,'TPMpoints') && isfield(Data,'OCTpoints')
    Ts = size(Data.TPMpoints,1);
    Os = size(Data.OCTpoints,1);
    S = min(Ts,Os);
    TPMpoints = Data.TPMpoints(1:S,:);
    OCTpoints = Data.OCTpoints(1:S,:);
    [D,Z,TRANSFORM] = procrustes(TPMpoints, OCTpoints);
    Data.Transform = TRANSFORM;
    img = zeros(size(Data.OCT));
    [Sz,Sx,Sy] = size(img);
    [Az,Ax,Ay] = size(Data.TPM);
    TRANSFORM = Data.Transform;
    for u = 1:Sx
        for v = 1:Sy
            for w=1:Sz
                idx = round(TRANSFORM.b * [w u v] * TRANSFORM.T + TRANSFORM.c(1,:));
                if idx(1) < 1 || idx(1) > Az || idx(2) < 1 || idx(2) > Ax || idx(3) < 1 || idx(3) > Ay
                       img(w,u,v) = 0;
                else
%                     img(w,u,v) = Data.TPM(min(max(idx(1),1),Az),min(max(idx(2),1),Ax),min(max(idx(3),1),Ay));
                      img(w,u,v) = Data.TPM(idx(1),idx(2),idx(3));
                end
            end
        end
    end
    Data.TTPM = img;
end

draw(hObject, eventdata, handles);


% --- Executes on button press in radiobutton_TTPM.
function radiobutton_TTPM_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_TTPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_TTPM

global Data

TPMframeno = str2double(get(handles.edit_OCTframeno,'String'));
Tz = size(Data.TPM,1);
TzT = size(Data.TTPM,1);
if get(handles.radiobutton_TTPM,'Value') == 1 && isfield(Data,'TTPM')
    set(handles.slider_TPM,'max',TzT);
    set(handles.slider_TPM,'SliderStep',[1/(TzT-1), 10/(TzT-1)]);
    TTPMframeno = min(max(round(TPMframeno*TzT/Tz),1),TzT);
    Tslidervalue = TzT-TTPMframeno+1;
    set(handles.slider_TPM,'Value',Tslidervalue);
    set(handles.edit_TPMframeno,'String', num2str(TTPMframeno));
else
   set(handles.slider_TPM,'max',Tz);
   set(handles.slider_TPM,'SliderStep',[1/(Tz-1), 10/(Tz-1)]);
   TPMframeno = min(max(round(TPMframeno*Tz/TzT),1),Tz);
   slidervalue = Tz-TPMframeno+1;
   set(handles.slider_TPM,'Value',slidervalue);
   set(handles.edit_TPMframeno,'String', num2str(TPMframeno));
end

draw(hObject, eventdata, handles);


% --------------------------------------------------------------------
function tools_savepoints_Callback(hObject, eventdata, handles)
% hObject    handle to tools_savepoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
OCTpoints = Data.OCTpoints;
TPMpoints = Data.TPMpoints;
[filename,pathname] = uiputfile('.mat','Save points as');
save([pathname filename],'OCTpoints','TPMpoints');

% --------------------------------------------------------------------
function tools_SaveTOCT_Callback(hObject, eventdata, handles)
% hObject    handle to tools_SaveTOCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
angio = Data.TOCT; 
[filename,pathname] = uiputfile('.mat','Save transformed OCT as');
save([pathname filename],'angio');

% --------------------------------------------------------------------
function tools_TTPM_Callback(hObject, eventdata, handles)
% hObject    handle to tools_TTPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
angio = Data.TTPM; 
[filename,pathname] = uiputfile('.mat','Save transformed TPM as');
save([pathname filename],'angio','-v7.3');


% --- Executes on button press in radiobutton_overlayTPM.
function radiobutton_overlayTPM_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_overlayTPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_overlayTPM

draw(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to tools_clearCpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_rot90clockVol1.
function pushbutton_rot90clockVol1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_rot90clockVol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Data.TPM = permute(Data.TPM,[2 3 1]);
Data.TPM = imrotate(Data.TPM,-90);
Data.TPM = permute(Data.TPM,[3 1 2]);
draw(hObject, eventdata, handles);


% --- Executes on button press in pushbutton_rot90anticlockVol1.
function pushbutton_rot90anticlockVol1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_rot90anticlockVol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Data.TPM = permute(Data.TPM,[2 3 1]);
Data.TPM = imrotate(Data.TPM,90);
Data.TPM = permute(Data.TPM,[3 1 2]);
draw(hObject, eventdata, handles);


% --- Executes on button press in pushbutton_transposeVol1.
function pushbutton_transposeVol1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_transposeVol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

Data.TPM = permute(Data.TPM,[1 3 2]);
draw(hObject, eventdata, handles);
