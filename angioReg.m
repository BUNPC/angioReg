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

% Last Modified by GUIDE v2.5 19-Nov-2019 09:19:46

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

if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Tz = size(Data.TTPM,1);
else
    Tz = size(Data.TPM,1); 
end
jj = round(get(handles.slider_TPM,'Value'));
jj = min(max(jj,1),Tz);
ii = Tz-jj+1;
set(handles.edit_TPMframeno,'String',num2str(ii));
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
    if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
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
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
     Oz = size(Data.TOCT,1);
else
    Oz = size(Data.OCT,1);
end
jj = round(get(handles.slider_OCT,'Value'));
jj = min(max(jj,1),Oz);
ii = Oz-jj+1;
set(handles.edit_OCTframeno,'String',num2str(ii));
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
    if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
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
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Tz = size(Data.TTPM,1);
else
    Tz = size(Data.TPM,1); 
end
ii = str2double(get(handles.edit_TPMframeno,'String'));
jj = Tz-ii+1;
jj = min(max(jj,1),Tz);
set(handles.slider_TPM,'Value',jj);
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
    if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
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
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    Oz = size(Data.TOCT,1);
else
    Oz = size(Data.OCT,1);
end
ii = str2double(get(handles.edit_OCTframeno,'String'));
jj = Oz-ii+1;
jj = min(max(jj,1),Oz);
set(handles.slider_OCT,'Value',jj);
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
    if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
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
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function file_loaddata_Callback(hObject, eventdata, handles)
% hObject    handle to file_loaddata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data

[filename,pathname] = uigetfile({'*.mat;*.tiff;*.tif'},'Please select TPM angiogram');
if filename == 0
    return
end
h = waitbar(0,'Please wait... loading the Angiogram1');
[pathstr,name,ext] = fileparts(filename);
if strcmp(ext,'.mat')
    temp = load([pathname filename]);
    fn = fieldnames(temp);
    TPM = temp.(fn{1});
    if ndims(TPM) == 2
        [Tx, Ty] = size(TPM);
        TPM = reshape(TPM',[1 Ty Tx]);
    end
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
    maxValue = max(TPM(:));
    minValue = min(TPM(:));
    set(handles.edit_TPMmin,'String',num2str(minValue));
    set(handles.edit_TPMmax,'String',num2str(maxValue));
end
Data.DestinationPath = [pathname filename];
close(h);

[filename,pathname] = uigetfile({'*.mat;*.tiff;*.tif'},'Please select OCT angiogram');
if filename == 0
    return
end
h = waitbar(0,'Please wait... loading the Angiogram2');
[pathstr,name,ext] = fileparts(filename);
if strcmp(ext,'.mat')
    temp = load([pathname filename]);
    fn = fieldnames(temp);
    OCT = temp.(fn{1});
    if ndims(OCT) == 2
        [Ox, Oy] = size(OCT);
        OCT = reshape(OCT',[1 Oy Ox]);
    end
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
    maxValue = max(OCT(:));
    minValue = min(OCT(:));
    set(handles.edit_OCTmin,'String',num2str(minValue));
    set(handles.edit_OCTmax,'String',num2str(maxValue));
end
Data.SourcePath = [pathname filename];
close(h);

Data.TPM = TPM;
Data.OCT = OCT;

[Tz,Tx,Ty] = size(Data.TPM);
[Oz,Ox,Oy] = size(Data.OCT);

set(handles.slider_TPM,'max',Tz);
set(handles.slider_TPM,'min',1);
set(handles.slider_TPM,'Value',Tz);
if Tz>1
    set(handles.slider_TPM,'SliderStep',[1/(Tz-1), 10/(Tz-1)]);
else 
%     set(handles.slider_TPM,'SliderStep',[1, 1]);
end

set(handles.slider_TIX,'max',Tx);
set(handles.slider_TIX,'min',1);
set(handles.slider_TIX,'Value',1);
set(handles.slider_TIX,'SliderStep',[1/(Tx-1), 10/(Tx-1)]);

set(handles.slider_TIY,'max',Ty);
set(handles.slider_TIY,'min',1);
set(handles.slider_TIY,'Value',Ty);
set(handles.slider_TIY,'SliderStep',[1/(Ty-1), 10/(Ty-1)]);

set(handles.slider_OCT,'max',Oz);
set(handles.slider_OCT,'min',1);
set(handles.slider_OCT,'Value',Oz);
if Oz > 1
    set(handles.slider_OCT,'SliderStep',[1/(Oz-1), 10/(Oz-1)]);
else 
%     set(handles.slider_OCT,'SliderStep',[1, 1]);
end

set(handles.slider_AX,'max',Ox);
set(handles.slider_AX,'min',1);
set(handles.slider_AX,'Value',1);
set(handles.slider_AX,'SliderStep',[1/(Ox-1), 10/(Ox-1)]);

set(handles.slider_AY,'max',Oy);
set(handles.slider_AY,'min',1);
set(handles.slider_AY,'Value',Oy);
set(handles.slider_AY,'SliderStep',[1/(Oy-1), 10/(Oy-1)]);

set(handles.edit_a1XMIP,'String',num2str(Tx));
set(handles.edit_a1YMIP,'String',num2str(Ty));

set(handles.edit_a2XMIP,'String',num2str(Ox));
set(handles.edit_a2YMIP,'String',num2str(Oy));

minTPM = min(TPM(:));
maxTPM = max(TPM(:));
minOCT = min(OCT(:));
maxOCT = max(OCT(:));

set(handles.edit_TPMmin,'String',num2str(minTPM));
set(handles.edit_TPMmax,'String',num2str(maxTPM));
set(handles.edit_OCTmin,'String',num2str(minOCT));
set(handles.edit_OCTmax,'String',num2str(maxOCT));

set(handles.text_TX,'String',['x -> x(1' '-' num2str(Tx) ')']);
set(handles.text_TY,'String',['y -> y(1' '-' num2str(Ty) ')']);
set(handles.text_TZ,'String',['z -> z(1' '-' num2str(Tz) ')']);
% set(handles.text_AX,'String',['x -> x(1' '-' num2str(Ox) ')']);
% set(handles.text_AY,'String',['y -> y(1' '-' num2str(Oy) ')']);
% set(handles.text_AZ,'String',['z -> z(1' '-' num2str(Oz) ')']);

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
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    [Tz,Tx,Ty] = size(Data.TTPM);
    TPMstartframe = round(str2double(get(handles.edit_TPMframeno,'String')));
    TPMstartframe = min(max(TPMstartframe,1),Tz);
    TPMmip = round(str2double(get(handles.edit_TPMMIP,'String')));
    TPMendframe = TPMstartframe+TPMmip-1;
    TPMendframe = min(max(TPMendframe,TPMstartframe),Tz);
    TPMimage = squeeze(max(Data.TTPM(TPMstartframe:TPMendframe,:,:),[],1));
else
    [Tz,Tx,Ty] = size(Data.TPM);
    TPMstartframe = round(str2double(get(handles.edit_TPMframeno,'String')));
    TPMstartframe = min(max(TPMstartframe,1),Tz);
    TPMmip = round(str2double(get(handles.edit_TPMMIP,'String')));
    TPMendframe = TPMstartframe+TPMmip-1;
    TPMendframe = min(max(TPMendframe,TPMstartframe),Tz);
    TPMimage = squeeze(max(Data.TPM(TPMstartframe:TPMendframe,:,:),[],1));
end
TI_Xstart = round(str2double(get(handles.edit_a1Xstart,'String')));
TI_Xstart = min(max(TI_Xstart,1),Tx);
TI_XMIP = round(str2double(get(handles.edit_a1XMIP,'String')));
TI_xend = TI_Xstart+TI_XMIP;
TI_xend = min(max(TI_xend,TI_Xstart),Tx);
TI_Ystart = round(str2double(get(handles.edit_a1Ystart,'String')));
TI_Ystart = min(max(TI_Ystart,1),Ty);
TI_YMIP = round(str2double(get(handles.edit_a1YMIP,'String')));
TI_yend = TI_Ystart+TI_YMIP;
TI_yend = min(max(TI_yend,TI_Ystart),Tx);
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    [Oz,Ox,Oy] = size(Data.TOCT);
    OCTstartframe = round(str2double(get(handles.edit_OCTframeno,'String')));
    OCTstartframe = min(max(OCTstartframe,1),Oz);
    OCTmip = round(str2double(get(handles.edit_OCTMIP,'String')));
    OCTendframe = OCTstartframe+OCTmip-1;
    OCTendframe = min(max(OCTendframe,OCTstartframe),Oz);
    OCTimage = squeeze(max(Data.TOCT(OCTstartframe:OCTendframe,:,:),[],1));
else
    [Oz,Ox,Oy] = size(Data.OCT);
    OCTstartframe = round(str2double(get(handles.edit_OCTframeno,'String')));
    OCTstartframe = min(max(OCTstartframe,1),Oz);
    OCTmip = round(str2double(get(handles.edit_OCTMIP,'String')));
    OCTendframe = OCTstartframe+OCTmip-1;
    OCTendframe = min(max(OCTendframe,OCTstartframe),Oz);
    OCTimage = squeeze(max(Data.OCT(OCTstartframe:OCTendframe,:,:),[],1));
end
A_Xstart = round(str2double(get(handles.edit_a2Xstart,'String')));
A_Xstart = min(max(A_Xstart,1),Ox);
A_XMIP = round(str2double(get(handles.edit_a2XMIP,'String')));
A_xend = A_Xstart+A_XMIP;
A_xend = min(max(A_xend,A_Xstart),Ox);
A_Ystart = round(str2double(get(handles.edit_a2Ystart,'String')));
A_Ystart = min(max(A_Ystart,1),Oy);
A_YMIP = round(str2double(get(handles.edit_a2YMIP,'String')));
A_yend = A_Ystart+A_YMIP;
A_yend = min(max(A_yend,A_Ystart),Ox);

minTPM = str2double(get(handles.edit_TPMmin,'String'));
maxTPM = str2double(get(handles.edit_TPMmax,'String'));
minOCT = str2double(get(handles.edit_OCTmin,'String'));
maxOCT = str2double(get(handles.edit_OCTmax,'String'));

axes(handles.axes1)
colormap('gray');
if get(handles.radiobutton_TPMlogScale,'Value')
    h = imagesc(log(TPMimage),[log(minTPM) log(maxTPM)]);
else
    h = imagesc(TPMimage,[minTPM maxTPM]);
end

xlim([TI_Xstart TI_xend]);
ylim([TI_Ystart TI_yend]);
axis image;

c = 'r';
fs = 14;
cp = 'c';
fsp = 20;
set(h, 'ButtonDownFcn', {@axes1_ButtonDown, handles});
if (get(handles.checkbox_transformedAngiogram1,'Value') == 1) & isfield(Data,'TTPMpoints')
    for u = 1:size(Data.TTPMpoints,1)
        if TPMstartframe == Data.TTPMpoints(u,1)
            hpt = text(Data.TTPMpoints(u,3),Data.TTPMpoints(u,2),num2str(u),'Color',c,'FontSize',fs);
            set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
        end
    end
elseif isfield(Data,'TPMpoints')
    for u = 1:size(Data.TPMpoints,1)
        if TPMstartframe == Data.TPMpoints(u,1)
            hpt = text(Data.TPMpoints(u,3),Data.TPMpoints(u,2),num2str(u),'Color',c,'FontSize',fs);
            set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
        end
    end
end

if isfield(Data,'ptstoCompare')
    if get(handles.checkbox_transformedAngiogram1,'Value') == 1
        for u = 1:size(Data.TptstoCompare,1)
            if TPMstartframe == Data.TptstoCompare(u,1)
                text(Data.TptstoCompare(u,3),Data.TptstoCompare(u,2),'*','Color',cp,'FontSize',fsp);
                %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
            end
        end
    else
        for u = 1:size(Data.ptstoCompare,1)
            if TPMstartframe == Data.ptstoCompare(u,1)
                text(Data.ptstoCompare(u,3),Data.ptstoCompare(u,2),'*','Color',cp,'FontSize',fsp);
                %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
            end
        end
    end
end



if  get(handles.checkbox_overlay,'Value') == 1
    img2 = double(OCTimage);
    img1 = TPMimage - min(TPMimage(:))/(max(TPMimage(:) - min(TPMimage(:))));
    img1(img1>maxTPM) = maxTPM;
    img1(img1<minTPM) = minTPM;
    img2 = img2 - min(img2(:))/(max(img2(:) - min(img2(:))));
    img2(img2>maxOCT) = maxOCT;
    img2(img2<minOCT) = minOCT;
    C =  imfuse(img1,img2, 'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
    imagesc(C)
    xlim([TI_Xstart TI_xend]);
    ylim([TI_Ystart TI_yend]);
    axis image;
end


axes(handles.axes2)
colormap('gray');
if get(handles.radiobutton_OCTlogScale,'Value')
    h = imagesc(log(OCTimage),[log(minOCT) log(maxOCT)]);
else
    h = imagesc(OCTimage,[minOCT maxOCT]);
end
xlim([A_Xstart A_xend]);
ylim([A_Ystart A_yend]);
axis image;
set(h, 'ButtonDownFcn', {@axes2_ButtonDown, handles});
if (get(handles.checkbox_transformedAngiogram2,'Value') == 1) & isfield(Data,'TOCTpoints')
     for u = 1:size(Data.TOCTpoints,1)
        if OCTstartframe == Data.TOCTpoints(u,1)
            hpt = text(Data.TOCTpoints(u,3),Data.TOCTpoints(u,2),num2str(u),'Color',c,'FontSize',fs);
%             set(hpt,'ButtonDownFcn', sprintf('OCT_deletepoint(%d)',u));
        end
    end
elseif isfield(Data,'OCTpoints')
    for u = 1:size(Data.OCTpoints,1)
        if OCTstartframe == Data.OCTpoints(u,1)
            hpt = text(Data.OCTpoints(u,3),Data.OCTpoints(u,2),num2str(u),'Color',c,'FontSize',fs);
            set(hpt,'ButtonDownFcn', sprintf('OCT_deletepoint(%d)',u));
        end
    end
end

if isfield(Data,'ptstoCompare')
    if (get(handles.checkbox_transformedAngiogram2,'Value') == 0) 
        for u = 1:size(Data.AptstoCompare,1)
            if OCTstartframe == Data.AptstoCompare(u,1)
                text(Data.AptstoCompare(u,3),Data.AptstoCompare(u,2),'*','Color',cp,'FontSize',fsp);
                %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
            end
        end
    else
        for u = 1:size(Data.ptstoCompare,1)
            if OCTstartframe == Data.ptstoCompare(u,1)
                text(Data.ptstoCompare(u,3),Data.ptstoCompare(u,2),'*','Color',cp,'FontSize',fsp);
                %%set(hpt,'ButtonDownFcn', sprintf('TPM_deletepoint(%d)',u));
            end
        end
    end
end

% if (get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1) && get(handles.radiobutton_overlayTPM,'Value') == 1
%     img2 = double(TPMimage);
%     img2 = 1-exp(-4*img2/max(img2(:)));
%     green = cat(3, zeros(size(img2)),ones(size(img2)), zeros(size(img2))); 
%     hold on 
%     h = imshow(green); 
%     hold off
%     set(h, 'AlphaData', img2) 
% end

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
if get(handles.radiobutton_addpoint,'Value')
    if isfield(Data,'TPMpoints')
        Data.TPMpoints = [Data.TPMpoints; z x y];
    else
        Data.TPMpoints = [z x y];
    end
elseif get(handles.radiobutton_testPoint,'Value') 
%     && (get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1)
%     if isfield(Data,'ptstoCompare')
%         Data.ptstoCompare = [Data.ptstoCompare; z x y];
%     else
        Data.ptstoCompare = [z x y];
        if isfield(Data,'TransformT2A')
            TRANSFORM = Data.TransformT2A;
            Data.AptstoCompare = round(TRANSFORM.b * Data.ptstoCompare * TRANSFORM.T + TRANSFORM.c(1,:));
%             TRANSFORM = Data.TransformA2T;
            Data.TptstoCompare = round(TRANSFORM.b * Data.ptstoCompare * TRANSFORM.T + TRANSFORM.c(1,:));
        end
%     end
end
% if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
%     if isfield(Data,'ptstoCompare')
%         Data.ptstoCompare = [Data.ptstoCompare; z x y];
%     else
%         Data.ptstoCompare = [z x y];
%     end
% else
%     if isfield(Data,'TPMpoints')
%         Data.TPMpoints = [Data.TPMpoints; z x y];
%     else
%         Data.TPMpoints = [z x y];
%     end
% end
draw(hObject, eventdata, handles);

function axes2_ButtonDown(hObject, eventdata, handles)

global Data

parent = (get(hObject, 'Parent'));
pts = round(get(parent, 'CurrentPoint'));
y = pts(1,1);
x = pts(1,2);
z = round(str2double(get(handles.edit_OCTframeno,'String')));
if get(handles.radiobutton_addpoint,'Value')
    if isfield(Data,'OCTpoints')
        Data.OCTpoints = [Data.OCTpoints; z x y];
    else
        Data.OCTpoints = [z x y];
    end    
elseif get(handles.radiobutton_testPoint,'Value') 
%     && (get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1)
%     if isfield(Data,'ptstoCompare')
%         Data.ptstoCompare = [Data.ptstoCompare; z x y];
%     else
        Data.ptstoCompare = [z x y];
        if isfield(Data,'TransformT2A')
            TRANSFORM = Data.TransformA2T;
            Data.TptstoCompare = round(TRANSFORM.b * Data.ptstoCompare * TRANSFORM.T + TRANSFORM.c(1,:));
            TRANSFORM = Data.TransformT2A;
            Data.AptstoCompare = round(TRANSFORM.b * Data.ptstoCompare * TRANSFORM.T + TRANSFORM.c(1,:));
        end
%     end
end
% if get(handles.radiobutton_TOCT,'Value') == 1 || get(handles.radiobutton_TTPM,'Value') == 1
%     if isfield(Data,'ptstoCompare')
%         Data.ptstoCompare = [Data.ptstoCompare; z x y];
%     else
%         Data.ptstoCompare = [z x y];
%     end
% else
%     if isfield(Data,'OCTpoints')
%         Data.OCTpoints = [Data.OCTpoints; z x y];
%     else
%         Data.OCTpoints = [z x y];
%     end
% end
draw(hObject, eventdata, handles);




function edit_TPMMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TPMMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TPMMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_TPMMIP as a double


if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
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

if get(handles.checkbox_transformedAngiogram2,'Value') == 1 || get(handles.checkbox_transformedAngiogram1,'Value') == 1
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
function tools_linearRegistration_Callback(hObject, eventdata, handles)
% hObject    handle to tools_linearRegistration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






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
function tools_savepoints_Callback(hObject, eventdata, handles)
% hObject    handle to tools_savepoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Angio2pts = Data.OCTpoints;
Angio1pts = Data.TPMpoints;
[filename,pathname] = uiputfile('.mat','Save points as');
save([pathname filename],'Angio1pts','Angio2pts');



% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to tools_clearCpoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function file_loadPoints_Callback(hObject, eventdata, handles)
% hObject    handle to file_loadPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
[pointFile,pointPath] = uigetfile('*.mat');
savedPoints = load(fullfile(pointPath,pointFile));
Data.OCTpoints = savedPoints.Angio2pts;
Data.TPMpoints = savedPoints.Angio1pts;
draw(hObject, eventdata, handles);


% --- Executes on button press in radiobutton_TPMlogScale.
function radiobutton_TPMlogScale_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_TPMlogScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_TPMlogScale
draw(hObject, eventdata, handles);

% --- Executes on button press in radiobutton_OCTlogScale.
function radiobutton_OCTlogScale_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_OCTlogScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_OCTlogScale
draw(hObject, eventdata, handles);


function edit_TPMmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TPMmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TPMmin as text
%        str2double(get(hObject,'String')) returns contents of edit_TPMmin as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_TPMmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_TPMmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_TPMmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TPMmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TPMmax as text
%        str2double(get(hObject,'String')) returns contents of edit_TPMmax as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_TPMmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_TPMmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_OCTmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_OCTmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_OCTmin as text
%        str2double(get(hObject,'String')) returns contents of edit_OCTmin as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_OCTmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_OCTmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_OCTmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_OCTmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_OCTmax as text
%        str2double(get(hObject,'String')) returns contents of edit_OCTmax as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_OCTmax_CreateFcn(hObject, ~, handles)
% hObject    handle to edit_OCTmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_registerAngiograms.
function pushbutton_registerAngiograms_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_registerAngiograms (see GCBO)
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
    Data.TransformT2A = TRANSFORM;
    img = zeros(size(Data.TPM));
    [Sz,Sx,Sy] = size(img);
    [Az,Ax,Ay] = size(Data.OCT);
%     TRANSFORM = Data.Transform;
    tic
%     for u = 1:Sx
%         for v = 1:Sy
%             for w=1:Sz
%                 idx = round(TRANSFORM.b * [w u v] * TRANSFORM.T + TRANSFORM.c(1,:));
%                 if idx(1) < 1 || idx(1) > Az || idx(2) < 1 || idx(2) > Ax || idx(3) < 1 || idx(3) > Ay
%                     img(w,u,v) = 0;
%                 else
% %                     img(w,u,v) = Data.OCT(min(max(idx(1),1),Az),min(max(idx(2),1),Ax),min(max(idx(3),1),Ay));
%                       img(w,u,v) = Data.OCT(idx(1),idx(2),idx(3));
%                 end
%             end
%         end
%     end


    [zz,xx,yy] = meshgrid(1:Sz,1:Sx,1:Sy);
    idx = [zz(:) xx(:) yy(:)];
    tidx = round(TRANSFORM.b * idx * TRANSFORM.T + TRANSFORM.c(1,:));
    kidx = find(tidx(:,1) >= 1 & tidx(:,1) <= Az & tidx(:,2) >= 1 & tidx(:,2) <= Ax & tidx(:,3) >= 1 & tidx(:,3) <= Ay);
    OCTidx = sub2ind(size(Data.OCT),tidx(kidx,1),tidx(kidx,2),tidx(kidx,3));
    TOCTidx = sub2ind(size(img),idx(kidx,1),idx(kidx,2),idx(kidx,3));
    img(TOCTidx) = Data.OCT(OCTidx);
    Data.TTPMpoints = round(TRANSFORM.b * Data.TPMpoints * TRANSFORM.T + TRANSFORM.c(1,:));
    Data.TOCT = img;
    
    [D,Z,TRANSFORM] = procrustes(TPMpoints, OCTpoints);
    Data.TransformA2T = TRANSFORM;
    img = zeros(size(Data.OCT));
    [Sz,Sx,Sy] = size(img);
    [Az,Ax,Ay] = size(Data.TPM);
%     TRANSFORM = Data.Transform;
%     for u = 1:Sx
%         for v = 1:Sy
%             for w=1:Sz
%                 idx = round(TRANSFORM.b * [w u v] * TRANSFORM.T + TRANSFORM.c(1,:));
%                 if idx(1) < 1 || idx(1) > Az || idx(2) < 1 || idx(2) > Ax || idx(3) < 1 || idx(3) > Ay
%                        img(w,u,v) = 0;
%                 else
% %                     img(w,u,v) = Data.TPM(min(max(idx(1),1),Az),min(max(idx(2),1),Ax),min(max(idx(3),1),Ay));
%                       img(w,u,v) = Data.TPM(idx(1),idx(2),idx(3));
%                 end
%             end
%         end
%     end
    [zz,xx,yy] = meshgrid(1:Sz,1:Sx,1:Sy);
    idx = [zz(:) xx(:) yy(:)];
    tidx = round(TRANSFORM.b * idx * TRANSFORM.T + TRANSFORM.c(1,:));
    kidx = find(tidx(:,1) >= 1 & tidx(:,1) <= Az & tidx(:,2) >= 1 & tidx(:,2) <= Ax & tidx(:,3) >= 1 & tidx(:,3) <= Ay);
    TPMidx = sub2ind(size(Data.TPM),tidx(kidx,1),tidx(kidx,2),tidx(kidx,3));
    TTPMidx = sub2ind(size(img),idx(kidx,1),idx(kidx,2),idx(kidx,3));
    img(TTPMidx) = Data.TPM(TPMidx);
%     Data.TTPMpoints = round(TRANSFORM.b * Data.TPMpoints * TRANSFORM.T + TRANSFORM.c(1,:));
%     Data.TOCT = img;
    Data.TTPM = img;
    Data.TOCTpoints = round(TRANSFORM.b * Data.OCTpoints * TRANSFORM.T + TRANSFORM.c(1,:));
    toc
end

draw(hObject, eventdata, handles);


function edit_a1Xstart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1Xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1Xstart as text
%        str2double(get(hObject,'String')) returns contents of edit_a1Xstart as a double

global Data
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Tx = size(Data.TTPM,2);
else
    Tx = size(Data.TPM,2); 
end
ii = str2double(get(handles.edit_a1Xstart,'String'));
% jj = Tx-ii+1;
jj = min(max(ii,1),Tx);
set(handles.slider_TIX,'Value',jj);
draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function edit_a1Xstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1Xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a1XMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1XMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1XMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a1XMIP as a double

draw(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function edit_a1XMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1XMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a1Ystart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1Ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1Ystart as text
%        str2double(get(hObject,'String')) returns contents of edit_a1Ystart as a double
global Data
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Ty = size(Data.TTPM,3);
else
    Ty = size(Data.TPM,3); 
end
ii = str2double(get(handles.edit_a1Ystart,'String'));
% jj = Tx-ii+1;
jj = min(max(ii,1),Ty);
set(handles.slider_TIY,'Value',jj);
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a1Ystart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1Ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a1YMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1YMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1YMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a1YMIP as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a1YMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1YMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a1Zstart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1Zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1Zstart as text
%        str2double(get(hObject,'String')) returns contents of edit_a1Zstart as a double


% --- Executes during object creation, after setting all properties.
function edit_a1Zstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1Zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a1ZMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1ZMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1ZMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a1ZMIP as a double


% --- Executes during object creation, after setting all properties.
function edit_a1ZMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1ZMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2Xstart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2Xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2Xstart as text
%        str2double(get(hObject,'String')) returns contents of edit_a2Xstart as a double
global Data
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    Ox = size(Data.TOCT,2);
else
    Ox = size(Data.OCT,2);
end
ii = str2double(get(handles.edit_a2Xstart,'String'));
% jj = Tx-ii+1;
jj = min(max(ii,1),Ox);
set(handles.slider_AX,'Value',jj);
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a2Xstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2Xstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2XMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2XMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2XMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a2XMIP as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a2XMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2XMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2Ystart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2Ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2Ystart as text
%        str2double(get(hObject,'String')) returns contents of edit_a2Ystart as a double
global Data
if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    Oy = size(Data.TOCT,3);
else
    Oy = size(Data.OCT,3);
end
ii = str2double(get(handles.edit_a2Ystart,'String'));
% jj = Tx-ii+1;
jj = min(max(ii,1),Oy);
set(handles.slider_AY,'Value',jj);
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a2Ystart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2Ystart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2YMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2YMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2YMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a2YMIP as a double
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit_a2YMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2YMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2Zstart_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2Zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2Zstart as text
%        str2double(get(hObject,'String')) returns contents of edit_a2Zstart as a double


% --- Executes during object creation, after setting all properties.
function edit_a2Zstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2Zstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2ZMIP_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2ZMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2ZMIP as text
%        str2double(get(hObject,'String')) returns contents of edit_a2ZMIP as a double


% --- Executes during object creation, after setting all properties.
function edit_a2ZMIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2ZMIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_TIX_Callback(hObject, eventdata, handles)
% hObject    handle to slider_TIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Data
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Tx = size(Data.TTPM,2);
else
    Tx = size(Data.TPM,2); 
end
jj = round(get(handles.slider_TIX,'Value'));
jj = min(max(jj,1),Tx);
% ii = Tz-jj+1;
set(handles.edit_a1Xstart,'String',num2str(jj));
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function slider_TIX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_TIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_TIY_Callback(hObject, eventdata, handles)
% hObject    handle to slider_TIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Data
if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
    Ty = size(Data.TTPM,3);
else
    Ty = size(Data.TPM,3); 
end
jj = round(get(handles.slider_TIY,'Value'));
jj = min(max(jj,1),Ty);
ii = Ty-jj+1;
set(handles.edit_a1Ystart,'String',num2str(ii));
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function slider_TIY_CreateFcn(hObject, eventdata, ~)
% hObject    handle to slider_TIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_AX_Callback(hObject, eventdata, handles)
% hObject    handle to slider_AX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Data

if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    Ox = size(Data.TOCT,2);
else
    Ox = size(Data.OCT,2);
end
jj = round(get(handles.slider_AX,'Value'));
jj = min(max(jj,1),Ox);
% ii = Tz-jj+1;
set(handles.edit_a2Xstart,'String',num2str(jj));
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function slider_AX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_AX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_AY_Callback(hObject, eventdata, handles)
% hObject    handle to slider_AY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Data

if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
    Oy = size(Data.TOCT,3);
else
    Oy = size(Data.OCT,3);
end
jj = round(get(handles.slider_AY,'Value'));
jj = min(max(jj,1),Oy);
ii = Oy-jj+1;
set(handles.edit_a2Ystart,'String',num2str(ii));
draw(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function slider_AY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_AY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider_TIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_TIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_TVX_Callback(hObject, eventdata, handles)
% hObject    handle to slider_TVX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_TVX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_TVX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton_TPMmotionCorrection.
function pushbutton_TPMmotionCorrection_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_TPMmotionCorrection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
% hWait = waitbar( 0, 'Correcting motion' );
nZ = size(Data.TPM,1);
[optimizer, metric] = imregconfig('monomodal');
tic
for u = 1:nZ-1
    u
    Data.TPM(u+1,:,:) = imregister(squeeze(Data.TPM(u+1,:,:)), squeeze(Data.TPM(u,:,:)),'affine',optimizer,metric);
%     waitbar(u/(nZ),hWait);
%    [~,Data.TPM(u+1,:,:)]=imregdemons(squeeze(Data.TPM(u+1,:,:)),squeeze(Data.TPM(u,:,:)), ...
%         [500 400 200],'AccumulatedFieldSmoothing', 1.3, 'DisplayWaitbar', false);
%     tform = imregtform(squeeze(Data.TPM(u+1,:,:)), squeeze(Data.TPM(u,:,:)), 'affine', optimizer, metric);
%     Data.TPM(u+1,:,:) = imwarp(squeeze(Data.TPM(u+1,:,:)),tform,'OutputView',imref2d(size(squeeze(Data.TPM(u,:,:)))));
    toc
end
% close(hWait);


% --- Executes on button press in checkbox_transformedAngiogram1.
function checkbox_transformedAngiogram1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_transformedAngiogram1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_transformedAngiogram1

global Data
if ~ isfield(Data,'TTPM')
    h = msgbox('Please register Angiogram1 to angiogram2 before using this radio button');
    uiwait(h);
    set(handles.checkbox_transformedAngiogram1,'Value',0);
    return
end
TPMframeno = str2double(get(handles.edit_OCTframeno,'String'));
Tz = size(Data.TPM,1);
TzT = size(Data.TTPM,1);
if ~(Tz == 1 && TzT == 1)
    if get(handles.checkbox_transformedAngiogram1,'Value') == 1 && isfield(Data,'TTPM')
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
end

draw(hObject, eventdata, handles);


% --- Executes on button press in checkbox_transformedAngiogram2.
function checkbox_transformedAngiogram2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_transformedAngiogram2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_transformedAngiogram2
global Data
if ~ isfield(Data,'TOCT')
    h = msgbox('Please register Angiogram2 to angiogram1 before using this radio button');
    uiwait(h);
    set(handles.checkbox_transformedAngiogram2,'Value',0);
    return
end
OCTframeno = str2double(get(handles.edit_OCTframeno,'String'));
Oz = size(Data.OCT,1);
OzT = size(Data.TOCT,1);
if ~(Oz == 1 && OzT == 1)
    if get(handles.checkbox_transformedAngiogram2,'Value') == 1 && isfield(Data,'TOCT')
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
end
draw(hObject, eventdata, handles);


% --- Executes on button press in checkbox_overlay.
function checkbox_overlay_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_overlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_overlay
draw(hObject, eventdata, handles);

% --------------------------------------------------------------------
function Tools_nonLinearRegistrationSDI_Callback(hObject, eventdata, handles)
% hObject    handle to Tools_nonLinearRegistrationSDI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global Data
% 
% if size(Data.TOCT,1) == 1
%     Fx = scatteredInterpolant(Data.TOCTpoints(:,2:3),Data.TPMpoints(:,2));
%     Fy = scatteredInterpolant(Data.TOCTpoints(:,2:3),Data.TPMpoints(:,3));
%     TOCT = zeros(size(Data.TOCT));
%     [sZ,sX,sY]= size(TOCT);
%     for v = 1:sX
%         for w = 1:sY
%             tx = round(Fx(v,w));
%             ty = round(Fy(v,w));
%             xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
%             yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
%             img = Data.TOCT(1,xx,yy);
%             TOCT(1,v,w) = mean(img(:));
%         end
%     end
% else 
%     
% end
% Data.TOCT = TOCT;

% --------------------------------------------------------------------
function Tools_nonLinearRegistrationimregdemon_Callback(hObject, eventdata, handles)
% hObject    handle to Tools_nonLinearRegistrationimregdemon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Data
% if isfield(Data,'TOCT')
%     [D,MOVING_REG] = imregdemons(squeeze(Data.TOCT),squeeze(Data.TPM));
% else
%     [D,MOVING_REG] = imregdemons(squeeze(Data.OCT),squeeze(Data.TPM)); 
% end
% if ismatrix(MOVING_REG)
%     [Sx, Sy] = size(MOVING_REG);
%     Data.TOCT = reshape(MOVING_REG,[1 Sx Sy]);
% end
% draw(hObject, eventdata, handles);



% --------------------------------------------------------------------
function file_savePoints_Callback(hObject, eventdata, handles)
% hObject    handle to file_savePoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
Angio2pts = Data.OCTpoints;
Angio1pts = Data.TPMpoints;
[filename,pathname] = uiputfile('.mat','Save points as');
save([pathname filename],'Angio1pts','Angio2pts');

% --------------------------------------------------------------------
function file_saveTangiogram1_Callback(hObject, eventdata, handles)
% hObject    handle to file_saveTangiogram1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
if ~ isfield(Data,'TTPM')
    h = msgbox('Angiogram1 was not tranformed to Angiogram2');
    uiwait(h);
    return
end
angio = Data.TTPM; 
[filename,pathname] = uiputfile('.mat','Save transformed TPM as');
save([pathname filename],'angio');


% --------------------------------------------------------------------
function File_saveTangiogram2_Callback(hObject, eventdata, handles)
% hObject    handle to File_saveTangiogram2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
if ~ isfield(Data,'TOCT')
    h = msgbox('Angiogram2 was not tranformed to Angiogram1');
    uiwait(h);
    return
end
angio = Data.TOCT; 
[filename,pathname] = uiputfile('.mat','Save transformed OCT as');
save([pathname filename],'angio');


% --------------------------------------------------------------------
function LinearReg_1to2_Callback(hObject, eventdata, handles)
% hObject    handle to LinearReg_1to2 (see GCBO)
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
    Data.LTTPM = img;
    [D,Z,TRANSFORM] = procrustes(OCTpoints,TPMpoints);
    Data.TTPMpoints = round(TRANSFORM.b * Data.TPMpoints * TRANSFORM.T + TRANSFORM.c(1,:));
    Data.Tlist1to2{1} = 'L';
end
draw(hObject, eventdata, handles);

% --------------------------------------------------------------------
function LinearReg_2to1_Callback(hObject, eventdata, handles)
% hObject    handle to LinearReg_2to1 (see GCBO)
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
    [D,Z,TRANSFORM] = procrustes(TPMpoints, OCTpoints);
    Data.TOCTpoints = round(TRANSFORM.b * Data.OCTpoints * TRANSFORM.T + TRANSFORM.c(1,:));
    Data.TOCT = img;
    Data.LTOCT = img;
    Data.Tlist2to1{1} = 'L';
end
draw(hObject, eventdata, handles);

% --------------------------------------------------------------------
function NLSDI_1to2_Callback(hObject, eventdata, handles)
% hObject    handle to NLSDI_1to2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
lst = {'Raw Data'};
if isfield(Data,'LTTPM')
    lst(end+1) = {'Linear Registered data'};
end
if isfield(Data,'NLregTTPM')
    lst(end+1) = {'Non-Linear intensity based reg data'};
end
[indx,tf] = listdlg('PromptString','Perform on',...
                           'SelectionMode','single',...
                           'ListString',lst);
if isequal(lst{indx},'Raw Data')
    if size(Data.TPM,1) == 1
        Fx = scatteredInterpolant(Data.TPMpoints(:,2:3),Data.OCTpoints(:,2));
        Fy = scatteredInterpolant(Data.TPMpoints(:,2:3),Data.OCTpoints(:,3));
        TTPM = zeros(size(Data.OCT));
        [sZ,sX,sY]= size(TTPM);
        [SZ1, sX1, sY1] = size(Data.TPM);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
                xx = min(max(tx-1,1),sX1):min(max(tx+1,1),sX1);
                yy = min(max(ty-1,1),sY1):min(max(ty+1,1),sY1);
                img = Data.TPM(1,xx,yy);
                TTPM(1,v,w) = mean(img(:));
            end
        end
    else 

    end
    Data.TTPM = TTPM;
    Data.NLSTTPM = TTPM;
    Data.Tlist1to2{1} = 'NL-SDI'; 
elseif isequal(lst{indx},'Linear Registered data')
    if size(Data.LTTPM,1) == 1
        Fx = scatteredInterpolant(Data.TTPMpoints(:,2:3),Data.OCTpoints(:,2));
        Fy = scatteredInterpolant(Data.TTPMpoints(:,2:3),Data.OCTpoints(:,3));
        TTPM = zeros(size(Data.TTPM));
        [sZ,sX,sY]= size(TTPM);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
                xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
                yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
                img = Data.TTPM(1,xx,yy);
                TTPM(1,v,w) = mean(img(:));
            end
        end
    else 

    end
    Data.TTPM = TTPM;
    Data.NLSTTPM = TTPM;
    Data.Tlist1to2{1} = ['L']; 
    Data.Tlist1to2{2} = ['NL-SDI']; 
elseif isequal(lst{indx},'Non-Linear intensity based reg data')
    if size(Data.NLregTTPM,1) == 1
        Fx = scatteredInterpolant(Data.NLregTTPMpoints(:,2:3),Data.OCTpoints(:,2));
        Fy = scatteredInterpolant(Data.NLregTTPMpoints(:,2:3),Data.OCTpoints(:,3));
        TTPM = zeros(size(Data.NLregTTPM));
        [sZ,sX,sY]= size(TTPM);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
                xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
                yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
                img = Data.NLregTTPM(1,xx,yy);
                TTPM(1,v,w) = mean(img(:));
            end
        end
    else 

    end
    Data.TTPM = TTPM;
    Data.NLSTTPM = TTPM;
    Data.Tlist1to2{end+1} = 'NL-SDI'; 
end
draw(hObject, eventdata, handles);
% --------------------------------------------------------------------
function NLSDI_2to1_Callback(hObject, eventdata, handles)
% hObject    handle to NLSDI_2to1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
lst = {'Raw Data'};
if isfield(Data,'TOCT')
    lst(end+1) = {'Linear Registered data'};
end
if isfield(Data,'NLregTOCT')
    lst(end+1) = {'Non-Linear intensity based reg data'};
end
[indx,tf] = listdlg('PromptString','Perform on',...
                           'SelectionMode','single',...
                           'ListString',lst);
if isequal(lst{indx},'Raw Data')
    if size(Data.OCT,1) == 1
        Fx = scatteredInterpolant(Data.OCTpoints(:,2:3),Data.TPMpoints(:,2));
        Fy = scatteredInterpolant(Data.OCTpoints(:,2:3),Data.TPMpoints(:,3));
        TOCT = zeros(size(Data.TPM));
        [sZ,sX,sY]= size(TOCT);
        [sZ1,sX1,sY1]= size(Data.OCT);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
                xx = min(max(tx-1,1),sX1):min(max(tx+1,1),sX);
                yy = min(max(ty-1,1),sY1):min(max(ty+1,1),sY1);
                img = Data.OCT(1,xx,yy);
                TOCT(1,v,w) = mean(img(:));
            end
        end
    else 

    end
    Data.TOCT = TOCT;
    Data.NLSTOCT = TOCT;
    Data.Tlist2to1{1} = 'NL-SDI'; 
elseif isequal(lst{indx},'Linear Registered data')
    if size(Data.TOCT,1) == 1
        Fx = scatteredInterpolant(Data.TOCTpoints(:,2:3),Data.TPMpoints(:,2));
        Fy = scatteredInterpolant(Data.TOCTpoints(:,2:3),Data.TPMpoints(:,3));
        TOCT = zeros(size(Data.TOCT));
        [sZ,sX,sY]= size(TOCT);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
%                 xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
%                 yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
                xx = min(max(tx,1),sX);
                yy = min(max(ty,1),sY);
                img = Data.TOCT(1,xx,yy);
                TOCT(1,v,w) = mean(img(:));
            end
        end
    else
        Fz = scatteredInterpolant(Data.TOCTpoints,Data.TPMpoints(:,1));
        Fx = scatteredInterpolant(Data.TOCTpoints,Data.TPMpoints(:,2));
        Fy = scatteredInterpolant(Data.TOCTpoints,Data.TPMpoints(:,3));
        TOCT = zeros(size(Data.TOCT));
        [sZ,sX,sY]= size(TOCT);
        for u = 1:sZ
            tic
            for v = 1:sX
                for w = 1:sY
                    tz = round(Fz(u,v,w));
                    tx = round(Fx(u,v,w));
                    ty = round(Fy(u,v,w));
                    zz = min(max(tz-1,1),sZ):min(max(tz+1,1),sZ);
                    xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
                    yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
                    img = Data.TOCT(zz,xx,yy);
                    TOCT(u,v,w) = mean(img(:));
                end
            end
            toc
        end
    end
    Data.TOCT = TOCT;
    Data.NLSTOCT = TOCT;
    Data.Tlist2to1{1} = 'L'; 
    Data.Tlist2to1{2} = 'NL-SDI'; 
elseif isequal(lst{indx},'Non-Linear intensity based reg data')
    if size(Data.NLregTOCT,1) == 1
        Fx = scatteredInterpolant(Data.NLregTOCTpoints(:,2:3),Data.TPMpoints(:,2));
        Fy = scatteredInterpolant(Data.NLregTOCTpoints(:,2:3),Data.TPMpoints(:,3));
        TOCT = zeros(size(Data.TOCT));
        [sZ,sX,sY]= size(TOCT);
        for v = 1:sX
            for w = 1:sY
                tx = round(Fx(v,w));
                ty = round(Fy(v,w));
                xx = min(max(tx-1,1),sX):min(max(tx+1,1),sX);
                yy = min(max(ty-1,1),sY):min(max(ty+1,1),sY);
                img = Data.NLregTOCT(1,xx,yy);
                TOCT(1,v,w) = mean(img(:));
            end
        end
    else 

    end
    Data.TOCT = TOCT;
    Data.NLSTOCT = TOCT;
    Data.Tlist2to1{end+1} = 'NL-SDI'; 
end
draw(hObject, eventdata, handles);
% --------------------------------------------------------------------
function NLimregdemons_1to2_Callback(hObject, eventdata, handles)
% hObject    handle to NLimregdemons_1to2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Data
lst = {'Raw Data'};
if isfield(Data,'LTTPM')
    lst(end+1) = {'Linear Registered data'};
end
if isfield(Data,'NLSTTPM')
    lst(end+1) = {'Non-Linear scattered data interplolted reg data'};
end
[indx,tf] = listdlg('PromptString','Perform on',...
                           'SelectionMode','single',...bg
                           'ListString',lst);
if isequal(lst{indx},'Raw Data')
    [D,MOVING_REG] = imregdemons(squeeze(Data.TPM),squeeze(Data.OCT)); 
%     Data.NLregTTPMpoints = round(Data.TPMpoints);
%     for u = 1:size(Data.OCTpoints,1)
%         Data.NLregTOCTpoints(u,2) = Data.TPMpoints(u,2)+D(Data.NLregTTPMpoints(u,2),Data.NLregTTPMpoints(u,3),1);
%         Data.NLregTOCTpoints(u,3) = Data.TPMpoints(u,3)+D(Data.NLregTTPMpoints(u,2),Data.NLregTTPMpoints(u,3),2);
%     end
    Data.Tlist1to2{1} = 'NL-imregdemon'; 
elseif isequal(lst{indx},'Linear Registered data')
    [D,MOVING_REG] = imregdemons(squeeze(Data.TTPM),squeeze(Data.OCT));
%     [D,MOVING_REG] = imregdemons(histeq(mat2gray(squeeze(Data.TTPM))),histeq(mat2gray(squeeze(Data.OCT))));
%     MOVING_REG = imwarp(squeeze(Data.TTPM),D);
%     Data.NLregTTPMpoints = Data.TTPMpoints;
    Data.Tlist1to2{1} = 'L'; 
    Data.Tlist1to2{2}='NL-imregdemon';
%     for u = 1:size(Data.TTPMpoints,1)
%         Data.NLregTTPMpoints(u,2) = Data.TTPMpoints(u,2)+D(Data.TTPMpoints(u,2),Data.TTPMpoints(u,3),1);
%         Data.NLregTTPMpoints(u,3) = Data.TTPMpoints(u,3)+D(Data.TTPMpoints(u,2),Data.TTPMpoints(u,3),2);
%     end
elseif isequal(lst{indx},'Non-Linear scattered data interplolted reg data')
    [D,MOVING_REG] = imregdemons(squeeze(Data.NLSTTPM),squeeze(Data.OCT));
    Data.Tlist1to2{end+1} = 'NL-imregdemon';
%     Data.NLregTTPMpoints = Data.TTPMpoints;
%     for u = 1:size(Data.TTPMpoints,1)
%         Data.NLregTTPMpoints(u,2) = Data.TTPMpoints(u,2)+D(Data.TTPMpoints(u,2),Data.TTPMpoints(u,3),1);
%         Data.NLregTTPMpoints(u,3) = Data.TTPMpoints(u,3)+D(Data.TTPMpoints(u,2),Data.TTPMpoints(u,3),2);
%     end
end

if ismatrix(MOVING_REG)
    [Sx, Sy] = size(MOVING_REG);
    Data.TTPM = reshape(MOVING_REG,[1 Sx Sy]);
    Data.NLregTTPM = reshape(MOVING_REG,[1 Sx Sy]);
else
    Data.TTPM = MOVING_REG;
    Data.NLregTTPM = MOVING_REG;
end
Data.D1to2 = D;

draw(hObject, eventdata, handles);

% --------------------------------------------------------------------
function NLimregdemons_2to1_Callback(hObject, eventdata, handles)
% hObject    handle to NLimregdemons_2to1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
lst = {'Raw Data'};
if isfield(Data,'LTOCT')
    lst(end+1) = {'Linear Registered data'};
end
if isfield(Data,'NLSTOCT')
    lst(end+1) = {'Non-Linear scattered data interplolted reg data'};
end
[indx,tf] = listdlg('PromptString','Perform on',...
                           'SelectionMode','single',...
                           'ListString',lst);
if isequal(lst{indx},'Raw Data')
    [D,MOVING_REG] = imregdemons(squeeze(Data.OCT),squeeze(Data.TPM));
    Data.NLregTOCTpoints = round(Data.OCTpoints);
    for u = 1:size(Data.OCTpoints,1)
        Data.NLregTOCTpoints(u,2) = Data.OCTpoints(u,2)+D(Data.NLregTOCTpoints(u,2),Data.NLregTOCTpoints(u,3),1);
        Data.NLregTOCTpoints(u,3) = Data.OCTpoints(u,3)+D(Data.NLregTOCTpoints(u,2),Data.NLregTOCTpoints(u,3),2);
    end
    Data.Tlist2to1{1} = 'NL-imregdemon'; 
elseif isequal(lst{indx},'Linear Registered data')   
    if get(handles.radiobutton_nohist,'value')
        [D,MOVING_REG] = imregdemons(squeeze(Data.LTOCT),squeeze(Data.TPM));
    elseif get(handles.radiobutton_hist,'value')
        [D,~] = imregdemons(histeq(mat2gray(squeeze(Data.LTOCT))),histeq(mat2gray(squeeze(Data.TPM))));
        MOVING_REG = imwarp(squeeze(Data.LTOCT),D);
    elseif get(handles.radiobutton_adaptiveHist,'value')
        boxSize = str2double(get(handles.edit_AhistSize,'String'));
        [D,~] = imregdemons(adapthisteq(mat2gray(squeeze(Data.LTOCT)),'NumTiles',[75 75]),adapthisteq(mat2gray(squeeze(Data.TPM)),'NumTiles',[boxSize boxSize]));
        MOVING_REG = imwarp(squeeze(Data.LTOCT),D);
    end
%     [D,MOVING_REG] = imregdemons(adapthisteq(mat2gray(squeeze(Data.TOCT)),'NumTiles',[75 75]),adapthisteq(mat2gray(squeeze(Data.TPM)),'NumTiles',[75 75]));
%     [D,MOVING_REG] = imregdemons(histeq(mat2gray(squeeze(Data.TOCT))),histeq(mat2gray(squeeze(Data.TPM))));
%     MOVING_REG = imwarp(squeeze(Data.TOCT),D);
%     [D,MOVING_REG] = imregdemons(squeeze(Data.TOCT),squeeze(Data.TPM));
    Data.NLregTOCTpoints = Data.TOCTpoints;
    Data.Tlist2to1{1} = 'L'; 
    Data.Tlist2to1{2} = 'NL-imregdemon'; 
%     for u = 1:size(Data.TOCTpoints,1)
%         Data.NLregTOCTpoints(u,2) = Data.TOCTpoints(u,2)+D(Data.TOCTpoints(u,2),Data.TOCTpoints(u,3),1);
%         Data.NLregTOCTpoints(u,3) = Data.TOCTpoints(u,3)+D(Data.TOCTpoints(u,2),Data.TOCTpoints(u,3),2);
%     end
elseif isequal(lst{indx},'Non-Linear scattered data interplolted reg data')
    [D,MOVING_REG] = imregdemons(squeeze(Data.NLSTOCT),squeeze(Data.TPM));
    Data.Tlist2to1{end+1} = 'NL-imregdemon';
end
if ismatrix(MOVING_REG)
    [Sx, Sy] = size(MOVING_REG);
    Data.TOCT = reshape(MOVING_REG,[1 Sx Sy]);
    Data.NLregTTPM = reshape(MOVING_REG,[1 Sx Sy]);
else
    Data.TOCT = MOVING_REG;
    Data.NLregTOCT = MOVING_REG;
end
Data.D2to1 = D;
draw(hObject, eventdata, handles);


% --------------------------------------------------------------------
function file_saveTransformation_Callback(hObject, eventdata, handles)
% hObject    handle to file_saveTransformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data

% save in source folder
k = strfind(Data.SourcePath,filesep);
clear Transformation
filename = [Data.SourcePath(1:k(end)) 'Transformation.mat'];
if isfile(filename)
    load(filename,'Transformation')
    v = 1;
    for u = 1:length(Transformation)
        if strcmp(Transformation(u).DestinationPath,Data.DestinationPath)
            break;
        end
        v = v+1;
    end
else
    v = 1;
end
if isfield(Data,'TPMpoints') && isfield(Data,'OCTpoints')
    Transformation(v).DestinationPts = Data.TPMpoints;
    Transformation(v).SourcePts = Data.OCTpoints;
end
if isfield(Data,'D2to1')
    Transformation(v).DisplacementField = Data.D2to1;
end
% if isfield(Data,'Tlist1to2')
Transformation(v).Tlist = Data.Tlist2to1;
% end
Transformation(v).DestinationPath = Data.DestinationPath;
Transformation(v).SourcePath = Data.SourcePath;
save(filename,'Transformation');

% save in destination folder
k = strfind(Data.DestinationPath,filesep);
filename = [Data.DestinationPath(1:k(end)) 'Transformation.mat'];
clear Transformation
if isfile(filename)
    load(filename,'Transformation')
    v = 1;
    for u = 1:length(Transformation)
        if strcmp(Transformation(u).SourcePath,Data.SourcePath)
            break;
        end
        v = v+1;
    end
else
    v = 1;
end
if isfield(Data,'TPMpoints') && isfield(Data,'OCTpoints')
    Transformation(v).SourcePts = Data.TPMpoints;
    Transformation(v).DestinationPts = Data.OCTpoints;
end
if isfield(Data,'D1to2')
    Transformation(v).DisplacementField = Data.D1to2;
end
% if isfield(Data,'Tlist1to2')
Transformation(v).Tlist = Data.Tlist2to1;
% end
Transformation(v).SourcePath = Data.DestinationPath;
Transformation(v).DestinationPath = Data.SourcePath;
save(filename,'Transformation');

    



function edit_img1lowpercentile_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img1lowpercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img1lowpercentile as text
%        str2double(get(hObject,'String')) returns contents of edit_img1lowpercentile as a double


% --- Executes during object creation, after setting all properties.
function edit_img1lowpercentile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img1lowpercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_img1toppercentile_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img1toppercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img1toppercentile as text
%        str2double(get(hObject,'String')) returns contents of edit_img1toppercentile as a double


% --- Executes during object creation, after setting all properties.
function edit_img1toppercentile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img1toppercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_img2lowpercentile_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img2lowpercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img2lowpercentile as text
%        str2double(get(hObject,'String')) returns contents of edit_img2lowpercentile as a double


% --- Executes during object creation, after setting all properties.
function edit_img2lowpercentile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img2lowpercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_img2toppercentile_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img2toppercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img2toppercentile as text
%        str2double(get(hObject,'String')) returns contents of edit_img2toppercentile as a double


% --- Executes during object creation, after setting all properties.
function edit_img2toppercentile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img2toppercentile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_AhistSize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AhistSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AhistSize as text
%        str2double(get(hObject,'String')) returns contents of edit_AhistSize as a double


% --- Executes during object creation, after setting all properties.
function edit_AhistSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AhistSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
