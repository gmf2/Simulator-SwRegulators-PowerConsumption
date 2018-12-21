function varargout = SolutionBuckTopology(varargin)
% SOLUTIONBUCKTOPOLOGY MATLAB code for SolutionBuckTopology.fig
%      SOLUTIONBUCKTOPOLOGY, by itself, creates a new SOLUTIONBUCKTOPOLOGY or raises the existing
%      singleton*.
%
%      H = SOLUTIONBUCKTOPOLOGY returns the handle to a new SOLUTIONBUCKTOPOLOGY or the handle to
%      the existing singleton*.
%
%      SOLUTIONBUCKTOPOLOGY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLUTIONBUCKTOPOLOGY.M with the given input arguments.
%
%      SOLUTIONBUCKTOPOLOGY('Property','Value',...) creates a new SOLUTIONBUCKTOPOLOGY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SolutionBuckTopology_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SolutionBuckTopology_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SolutionBuckTopology

% Last Modified by GUIDE v2.5 22-Nov-2018 15:57:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SolutionBuckTopology_OpeningFcn, ...
                   'gui_OutputFcn',  @SolutionBuckTopology_OutputFcn, ...
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


% --- Executes just before SolutionBuckTopology is made visible.
function SolutionBuckTopology_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SolutionBuckTopology (see VARARGIN)

% Choose default command line output for SolutionBuckTopology
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%Imagenes ON y OFF
global buckon;
global buckoff;
global yswresult;
global xswresult;
global xidresult;
global yidresult;
global xilresult;
global yilresult;
global FS_data;
global AiLmax_sol;
global AiLmin_sol;

%global waveform;

%Photos ON/OFF
buckon=imread('Buck ON.jpg');
buckoff=imread('Buck OFF.jpg');
%waveform=imread('C:\Users\Gabriel\Documents\matlab\EYTU\WaveForm.jpg');

%Generate photos
axes(handles.axes1);
imshow(buckon);
axes(handles.axes5);
imshow(buckoff);

%Generate graphics
%Isw
axes(handles.axes6);
plot(xswresult,yswresult);
axis([0 2*(1/FS_data) 0 2*AiLmax_sol]);
%Id
axes(handles.axes7);
plot(xidresult,yidresult);
axis([0 2*(1/FS_data) 0 2*AiLmax_sol]);
%IL
axes(handles.axes9);
plot(xilresult,yilresult);
axis([0 2*(1/FS_data) 0 2*AiLmax_sol]);
%Valores:
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


%D
set (handles.Edit_D, 'String', d_sol);
%L
set (handles.Edit_L, 'String', L_sol);
%C
set (handles.Edit_C, 'String', C_sol);
%Vi
set (handles.Edit_Vi, 'String', vi_sol);
%vo
set (handles.Edit_Vo, 'String', vo_sol);
%Io
set (handles.Edit_Io, 'String', Io_sol);
%IL
set (handles.Edit_IL, 'String', IL_sol);
%Id
set (handles.Edit_Id, 'String', Id_sol);
%Isw
set (handles.Edit_Isw, 'String', Isw_sol);
%n
set (handles.Edit_n, 'String', eff_sol);
%AVO
set (handles.Edit_AIL, 'String', AiLpos_sol);
%AIL
set (handles.Edit_AVO, 'String', AVO_sol);
%AILmax
set (handles.Edit_iLmax, 'String', AiLmax_sol);
%AILmin
set (handles.Edit_ILmin, 'String', AiLmin_sol);
% UIWAIT makes SolutionBuckTopology wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SolutionBuckTopology_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Edit_D_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_D as text
%        str2double(get(hObject,'String')) returns contents of Edit_D as a double


% --- Executes during object creation, after setting all properties.
function Edit_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_L_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_L as text
%        str2double(get(hObject,'String')) returns contents of Edit_L as a double


% --- Executes during object creation, after setting all properties.
function Edit_L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_C_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_C as text
%        str2double(get(hObject,'String')) returns contents of Edit_C as a double


% --- Executes during object creation, after setting all properties.
function Edit_C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Vi_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Vi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Vi as text
%        str2double(get(hObject,'String')) returns contents of Edit_Vi as a double


% --- Executes during object creation, after setting all properties.
function Edit_Vi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Vi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Vo_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Vo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Vo as text
%        str2double(get(hObject,'String')) returns contents of Edit_Vo as a double


% --- Executes during object creation, after setting all properties.
function Edit_Vo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Vo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Io_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Io (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Io as text
%        str2double(get(hObject,'String')) returns contents of Edit_Io as a double


% --- Executes during object creation, after setting all properties.
function Edit_Io_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Io (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_IL_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_IL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_IL as text
%        str2double(get(hObject,'String')) returns contents of Edit_IL as a double


% --- Executes during object creation, after setting all properties.
function Edit_IL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_IL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Id_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Id as text
%        str2double(get(hObject,'String')) returns contents of Edit_Id as a double


% --- Executes during object creation, after setting all properties.
function Edit_Id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Isw_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Isw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Isw as text
%        str2double(get(hObject,'String')) returns contents of Edit_Isw as a double


% --- Executes during object creation, after setting all properties.
function Edit_Isw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Isw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_n_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_n as text
%        str2double(get(hObject,'String')) returns contents of Edit_n as a double


% --- Executes during object creation, after setting all properties.
function Edit_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_AVO_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_AVO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_AVO as text
%        str2double(get(hObject,'String')) returns contents of Edit_AVO as a double


% --- Executes during object creation, after setting all properties.
function Edit_AVO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_AVO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_AIL_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_AIL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_AIL as text
%        str2double(get(hObject,'String')) returns contents of Edit_AIL as a double


% --- Executes during object creation, after setting all properties.
function Edit_AIL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_AIL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_iLmax_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_iLmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_iLmax as text
%        str2double(get(hObject,'String')) returns contents of Edit_iLmax as a double


% --- Executes during object creation, after setting all properties.
function Edit_iLmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_iLmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_ILmin_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_ILmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_ILmin as text
%        str2double(get(hObject,'String')) returns contents of Edit_ILmin as a double


% --- Executes during object creation, after setting all properties.
function Edit_ILmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_ILmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
