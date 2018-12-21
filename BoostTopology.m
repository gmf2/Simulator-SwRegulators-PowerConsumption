function varargout = BoostTopology(varargin)
% boostTOPOLOGY MATLAB code for boostTopology.fig
%      boostTOPOLOGY, by itself, creates a new boostTOPOLOGY or raises the existing
%      singleton*.
%
%      H = boostTOPOLOGY returns the handle to a new boostTOPOLOGY or the handle to
%      the existing singleton*.
%
%      boostTOPOLOGY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in boostTOPOLOGY.M with the given input arguments.
%
%      boostTOPOLOGY('Property','Value',...) creates a new boostTOPOLOGY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before boostTopology_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to boostTopology_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help boostTopology

% Last Modified by GUIDE v2.5 26-Nov-2018 22:39:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BoostTopology_OpeningFcn, ...
                   'gui_OutputFcn',  @BoostTopology_OutputFcn, ...
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


% --- Executes just before boostTopology is made visible.
function BoostTopology_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to boostTopology (see VARARGIN)

% Choose default command line output for boostTopology
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global boost;
axes(handles.axes1);
imshow(boost)
global d_sol;
d_sol =0;
global IL_sol;
IL_sol=0;
global Io_sol;
Io_sol=0;
global Id_sol;
Id_sol = 0;
global Isw_sol;
Isw_sol=0;
global AiLpos_sol;
AiLpos_sol=0;
global vi_sol;
vi_sol=0;
global vo_sol;
vo_sol=0;
global L_sol;
L_sol=0;
global C_sol;
C_sol=0;
global AVO_sol;
AVO_sol=0;
global eff_sol;
eff_sol=0;
global AiLmax_sol;
AiLmax_sol=0;
global AiLmin_sol;
AiLmin_sol=0;

%Data from Text
global vo_data;
vo_data=0;
global vf_data;
vf_data=0;
global vsw_data;
vsw_data=0;
global vi_data;
vi_data=0;
global d_data;
d_data=0;
global RLD_data;
RLD_data=0;
global FS_data;
FS_data=0;
global L_data;
L_data=0;
global C_data;
C_data=0;
global AVO_data;
AVO_data=0;
global AiLpos;
AiLpos=0;
global xswresult;
xswresult=0;
global yswresult;
yswresult=0;
global xidresult;
xidresult=0;
global yidresult;
yidresult=0;
global xilresult;
xilresult=0;
global yilresult;
yilresult=0;
global CCM;
CCM=0;


% UIWAIT makes boostTopology wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BoostTopology_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Text_VI_Callback(hObject, eventdata, handles)
% hObject    handle to Text_VI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_VI as text
%        str2double(get(hObject,'String')) returns contents of Text_VI as a double
global vi_data;
vi_data = get (hObject, 'String');
vi_data = str2double (vi_data);

% --- Executes during object creation, after setting all properties.
function Text_VI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_VI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Text_RLD_Callback(hObject, eventdata, handles)
% hObject    handle to Text_RLD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_RLD as text
%        str2double(get(hObject,'String')) returns contents of Text_RLD as a double
global RLD_data;
RLD_data = get(hObject,'String');
RLD_data = str2double (RLD_data);

% --- Executes during object creation, after setting all properties.
function Text_RLD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_RLD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Text_VO_Callback(hObject, eventdata, handles)
% hObject    handle to Text_VO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_VO as text
%        str2double(get(hObject,'String')) returns contents of Text_VO as a double
global vo_data;
vo_data = get (hObject, 'String');
vo_data = str2double (vo_data);

% --- Executes during object creation, after setting all properties.
function Text_VO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_VO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Text_vf_Callback(hObject, eventdata, handles)
% hObject    handle to Text_vf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_vf as text
%        str2double(get(hObject,'String')) returns contents of Text_vf as a double
global vf_data;
vf_data = get (hObject, 'String');
vf_data = str2double (vf_data);

% --- Executes during object creation, after setting all properties.
function Text_vf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_vf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Text_FS_Callback(hObject, eventdata, handles)
% hObject    handle to Text_FS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_FS as text
%        str2double(get(hObject,'String')) returns contents of Text_FS as a double
global FS_data;
FS_data = get (hObject, 'String');
FS_data = str2double (FS_data);

% --- Executes during object creation, after setting all properties.
function Text_FS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_FS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TextL_Callback(hObject, eventdata, handles)
% hObject    handle to TextL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextL as text
%        str2double(get(hObject,'String')) returns contents of TextL as a double
global L_data;
L_data = get (hObject, 'String');
L_data = str2double (L_data);

% --- Executes during object creation, after setting all properties.
function TextL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TextC_Callback(hObject, eventdata, handles)
% hObject    handle to TextC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextC as text
%        str2double(get(hObject,'String')) returns contents of TextC as a double
global C_data;
C_data = get (hObject, 'String');
C_data = str2double (C_data);

% --- Executes during object creation, after setting all properties.
function TextC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TextVswitch_Callback(hObject, eventdata, handles)
% hObject    handle to TextVswitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextVswitch as text
%        str2double(get(hObject,'String')) returns contents of TextVswitch as a double
global vsw_data;
vsw_data = get (hObject, 'String');
vsw_data = str2double (vsw_data);


% --- Executes during object creation, after setting all properties.
function TextVswitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextVswitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TextAVO_Callback(hObject, eventdata, handles)
% hObject    handle to TextAVO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TextAVO as text
%        str2double(get(hObject,'String')) returns contents of TextAVO as a double
global AVO_data;
AVO_data = get (hObject, 'String');
AVO_data  = str2double (AVO_data);

% --- Executes during object creation, after setting all properties.
function TextAVO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TextAVO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Text_D_Callback(hObject, eventdata, handles)
% hObject    handle to Text_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Text_D as text
%        str2double(get(hObject,'String')) returns contents of Text_D as a double
global d_data;
d_data = get(hObject,'String');
d_data = str2double (d_data);


% --- Executes during object creation, after setting all properties.
function Text_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Text_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global AiLpos;
AiLpos = get(hObject,'String');
AiLpos = str2double (AiLpos);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CCM.
function CCM_Callback(hObject, eventdata, handles)
% hObject    handle to CCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CCM
global CCM;
CCM = get(hObject,'Value');

% --- Executes on button press in Solutionboost.
function SolutionBoost_Callback(hObject, eventdata, handles)
% hObject    handle to Solutionboost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Data for solution
global d_sol;
global IL_sol;
global Io_sol;
global Id_sol;
global Isw_sol;
global AiLpos_sol;
global vi_sol;
global vo_sol;
global L_sol;
global C_sol;
global AVO_sol;
global eff_sol;
global AiLmax_sol;
global AiLmin_sol;

%Data from Text
global vo_data;
global vf_data;
global vsw_data;
global vi_data;
global d_data;
global RLD_data;
global FS_data;
global L_data;
global C_data;
global AVO_data;
global AiLpos;
global xswresult;
global yswresult;
global xidresult;
global yidresult;
global xilresult;
global yilresult;
global CCM;

if (isempty(d_data) || isnan(d_data))
    d_data=0;
end
if (isempty(vi_data) || isnan(vi_data))
    vi_data=0;
end
if (isempty(AiLpos) || isnan(AiLpos) )
    AiLpos=0;
end
if (isempty(AVO_data) || isnan(AVO_data))
    AVO_data=0;
end
if (isempty(vsw_data) || isnan(vsw_data) )
    vsw_data=0;
end
if (isempty(C_data) || isnan(C_data) )
    C_data=0;
end
if (isempty(L_data) || isnan(L_data))
    L_data=0;
end
if (isempty(FS_data) || isnan(FS_data))
    FS_data=0;
end
if (isempty(vf_data) || isnan(vf_data) )
    vf_data=0;
end
if (isempty(vo_data) || isnan(vo_data))
    vo_data=0;
end
if (isempty(RLD_data) || isnan(RLD_data))
    RLD_data=0;
end
if (isempty(CCM) || isnan(CCM))
    CCM=0;
end


%Valor D
if (eq(d_data,0))
    d_sol = (vo_data - vi_data + vf_data)/(vo_data - vsw_data + vf_data);
    
else
    d_sol=d_data;
end
%Valor Vi
if (eq(vi_data,0))
    vi_sol=vo_data + vf_data - d_sol * (vo_data - vsw_data +vf_data);
else
    vi_sol=vi_data;
end

%Valor Vo
%TENER EN CUENTA VI CUANDO TE LO DAN Y CUANDO HAY QUE CALCULARLO)
if (eq(vo_data,0))
    vo_sol= (vf_data - vi_data - d_sol * (vf_data - vsw_data))/(d_data - 1);
else
    vo_sol=vo_data;
end


%Valor Io and IL
    L_data=L_data*10^(-6);

if(~eq(RLD_data,0))
    Io_sol= (vo_sol/RLD_data);
    IL_sol = Io_sol/(1-d_sol);      
    if (CCM == 1 && (eq(AiLpos,0)))
         AiLpos_sol=2*IL_sol;
    elseif (CCM == 1 && (~eq(AiLpos,0)))
         AiLpos_sol = AiLpos;
    elseif (CCM == 0 && (~eq(AiLpos,0)))
         AiLpos_sol = AiLpos;
    elseif (CCM == 0 && (~eq(L_data,0)) && (eq(AiLpos,0)))
         AiLpos_sol = ((vi_sol-vsw_data)*d_sol*(1/FS_data))/L_data;
    end
elseif (eq(RLD_data,0))
%     elseif (~eq(IL_sol,0))
%         % Si no dan la RLD tiene que ser CCM ???       
%         AiLpos_sol=2*IL_sol;
%         Io_sol = (1- d_sol)*(AiLpos_sol/2);
%     elseif (~eq(AiLpos_sol,0))
%         IL_sol = AiLpos_sol/2;
%         Io_sol = (1- d_sol)*(IL_sol);
 if ((eq(AiLpos,0)) && (~eq(L_data,0)))
    AiLpos_sol = ((vi_data-vsw_data)*d_sol*(1/FS_data))/L_data;
    IL_sol=(AiLpos_sol/2);
    Io_sol=IL_sol*(1-d_data);
 elseif ((~eq(AiLpos,0)) && (~eq(L_data,0)))
    IL_sol=(AiLpos/2);
    Io_sol=IL_sol*(1-d_data);
 end
end

% elseif ((eq(AiLpos,0)) && (~eq(L_data,0)))
%     AiLpos_sol = ((vi_data-vsw_data)*d_sol*(1/FS_data))/L_data;
%     IL_sol=(AiLpos_sol/2);
%     Io_sol=IL_sol*(1-d_data);
%      AiLpos_sol = ((vi_sol-vsw_data)*d_sol*(1/FS_data))/L_data;

%Valor L

if (eq(L_data,0))
   L_sol=(((vi_data-vsw_data)*d_sol*(1/FS_data))/AiLpos_sol)*10^6;
else
    L_sol=L_data*10^6;
end

%Valor ID and Isw
Id_sol= Io_sol;
Isw_sol=IL_sol*(d_sol);

%Valor C and AVO
C_data=C_data*10^(-6);
if (eq(AVO_data,0) && ~eq(C_data,0))
    AVO_sol= (1/C_data)* Io_sol*d_sol*(1/FS_data);
    C_sol=C_data*(10^6);
elseif (eq(C_data,0) && ~eq(AVO_data,0))
    C_sol =((1/AVO_data)* Io_sol*d_sol*(1/FS_data))*(10^6);
    AVO_sol= AVO_data;
else
    C_sol='NaN';
    AVO_sol='NaN';
end
     
%Valor efficiency
eff_sol=(vo_sol*Io_sol/((Io_sol/(1-d_sol))*vi_sol));

%Ail max y min
AiLmax_sol = IL_sol + AiLpos_sol/2;
AiLmin_sol = IL_sol - AiLpos_sol/2;

%Graphics Isw
% P1=[d_sol*(1/FS_data) AiLmax_sol];P2=[0 AiLmin_sol];
xswresult=0:(2*(1/FS_data)/100):2*(1/FS_data);
msw=(AiLmax_sol-AiLmin_sol)/(d_sol*(1/FS_data));
yswresult=yisw(xswresult,msw,AiLmin_sol,(AiLmin_sol-((AiLmax_sol-AiLmin_sol)/d_sol)),d_sol*(1/FS_data),(1/FS_data));

%Graphic Id
xidresult=0:(2*(1/FS_data)/100):2*(1/FS_data);
mid=(AiLmin_sol-AiLmax_sol)/((1/FS_data)*(1-d_sol));
b=(AiLmax_sol-((d_sol/(1-d_sol))*(AiLmin_sol-AiLmax_sol)));
b1=(AiLmax_sol- ((1+d_sol)/(1-d_sol))*(AiLmin_sol-AiLmax_sol));
yidresult=yid(xidresult,mid,b,b1,d_sol*(1/FS_data),(1/FS_data));
% P1id=[(1/FS_data) AiLmin_sol];P2id=[d_sol*(1/FS_data) AiLmax_sol];

%Graphic iL
xilresult=0:(2*(1/FS_data)/100):2*(1/FS_data);
m1iL=(AiLmax_sol-AiLmin_sol)/(d_sol*(1/FS_data));
m2iL=(AiLmin_sol-AiLmax_sol)/((1/FS_data)*(1-d_sol));
b1=AiLmin_sol;
b2=(AiLmax_sol-((d_sol/(1-d_sol))*(AiLmin_sol-AiLmax_sol)));
b3=(AiLmin_sol-((AiLmax_sol-AiLmin_sol)/d_sol));
b4=(AiLmax_sol- ((1+d_sol)/(1-d_sol))*(AiLmin_sol-AiLmax_sol));
yilresult=yil(xilresult,m1iL,m2iL,b1,b2,b3,b4,d_sol*(1/FS_data),(1/FS_data));

SolutionBoostTopology;
