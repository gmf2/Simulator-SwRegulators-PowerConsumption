function varargout = PowerConsumption_solution(varargin)
% POWERCONSUMPTION_SOLUTION MATLAB code for PowerConsumption_solution.fig
%      POWERCONSUMPTION_SOLUTION, by itself, creates a new POWERCONSUMPTION_SOLUTION or raises the existing
%      singleton*.
%
%      H = POWERCONSUMPTION_SOLUTION returns the handle to a new POWERCONSUMPTION_SOLUTION or the handle to
%      the existing singleton*.
%
%      POWERCONSUMPTION_SOLUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWERCONSUMPTION_SOLUTION.M with the given input arguments.
%
%      POWERCONSUMPTION_SOLUTION('Property','Value',...) creates a new POWERCONSUMPTION_SOLUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PowerConsumption_solution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PowerConsumption_solution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PowerConsumption_solution

% Last Modified by GUIDE v2.5 12-Dec-2018 13:13:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PowerConsumption_solution_OpeningFcn, ...
                   'gui_OutputFcn',  @PowerConsumption_solution_OutputFcn, ...
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


% --- Executes just before PowerConsumption_solution is made visible.
function PowerConsumption_solution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PowerConsumption_solution (see VARARGIN)

% Choose default command line output for PowerConsumption_solution
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%Activity factors 
global delay_sol;
delay_sol=0;
global Pa_pot_sol;
Pa_pot_sol=0;
global Pb_pot_sol;
Pb_pot_sol=0;
global Pc_pot_sol;
Pc_pot_sol=0;
global Pd_pot_sol;
Pd_pot_sol=0;
global Py_pot_sol;
Py_pot_sol=0;
global Pz_pot_sol;
Pz_pot_sol=0;
global Pf_pot_sol;
Pf_pot_sol=0;
global Ptotal_pot_sol;
Ptotal_pot_sol=0;

global Pa_sol;
Pa_sol=Pa_sol/100;
global Pb_sol;
Pb_sol=Pb_sol/100;
global Pc_sol;
Pc_sol=Pc_sol/100;
global Pd_sol;
Pd_sol=Pd_sol/100;
global Pa_delay_sol;
Pa_delay_sol=0;
global Pb_delay_sol;
Pb_delay_sol=0;
global Pc_delay_sol;
Pc_delay_sol=0;
global Pd_delay_sol;
Pd_delay_sol=0;
global Py_delay_sol;
Py_delay_sol=0;
global Pz_delay_sol;
Pz_delay_sol=0;
global Pf_delay_sol;
Pf_delay_sol=0;

global C_Gate;
global Ron;
global f;
global Vdd;
global Creg;
global delay_reg;
%Activity factors
%Pa,Pb,Pc,Pd
Pa_delay_sol=Pa_sol*(1-Pa_sol);
Pb_delay_sol=Pb_sol*(1-Pb_sol);
Pc_delay_sol=Pc_sol*(1-Pc_sol);
Pd_delay_sol=Pd_sol*(1-Pd_sol);
%Py
P1y=Pa_sol*Pb_sol;
Py_delay_sol=P1y*(1-P1y);
set (handles.Py_sol, 'String', Py_delay_sol);
%Pz
P1z=Pc_sol*Pd_sol;
Pz_delay_sol=P1z*(1-P1z);
set (handles.Pz_sol, 'String', Pz_delay_sol);
%Pf
P0f=(1-(1-P1y))*(1-(1-P1z));
Pf_delay_sol=P0f*(1-P0f);
set (handles.Pf_sol, 'String', Pf_delay_sol);

%delay 
if f~=0
    delay_sol=(1/(f*10^6))*(10^9);  
else 
    delay_sol=(0.69*Ron*(C_Gate*(10^(-12)))+0.69*Ron*(Creg*(10^(-12)))+(delay_reg*(10^(-9))))*(10^9);
    f=(1/(delay_sol*(10^(-9))))*(10^(-6));
end
set (handles.delay_sol, 'String', delay_sol);
set (handles.f_sol, 'String', f);

%Potencias
%Pot_a
Pa_pot_sol=(Pa_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pa_pot_sol, 'String', Pa_pot_sol);
%Pot_b
Pb_pot_sol=(Pb_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pb_pot_sol, 'String', Pb_pot_sol);
%Pot_c
Pc_pot_sol=(Pc_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pc_pot_sol, 'String', Pc_pot_sol);
%Pot d
Pd_pot_sol=(Pd_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pd_pot_sol, 'String', Pd_pot_sol);
%Pot_y
Py_pot_sol=(Py_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Py_pot_sol, 'String', Py_pot_sol);
%Pot_z
Pz_pot_sol=(Pz_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pz_pot_sol, 'String', Pz_pot_sol);
%Pot_f
Pf_pot_sol=(Pf_delay_sol*(Vdd*Vdd)*(Creg*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pf_pot_sol, 'String', Pf_pot_sol);
%Pot_total
Pf_pot_sol=(Pf_delay_sol*(Vdd*Vdd)*(C_Gate*(10^(-12)))*(f*(10^6)))*(10^3);
set (handles.Pf_pot_sol, 'String', Pf_pot_sol);
%Ptotal_pot_sol;
Ptotal_pot_sol=(Pa_pot_sol*(10^(-3)))+(Pb_pot_sol*(10^(-3)))+(Pc_pot_sol*(10^(-3)))+(Pd_pot_sol*(10^(-3)))+(Py_pot_sol*(10^(-3)))+(Pf_pot_sol*(10^(-3)))+(Pz_pot_sol^(10^(-3)));
set (handles.Ptotal_pot_sol, 'String', Ptotal_pot_sol);


% UIWAIT makes PowerConsumption_solution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PowerConsumption_solution_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Py_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Py_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Py_sol as text
%        str2double(get(hObject,'String')) returns contents of Py_sol as a double


% --- Executes during object creation, after setting all properties.
function Py_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Py_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pz_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pz_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pz_sol as text
%        str2double(get(hObject,'String')) returns contents of Pz_sol as a double


% --- Executes during object creation, after setting all properties.
function Pz_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pz_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pf_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pf_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pf_sol as text
%        str2double(get(hObject,'String')) returns contents of Pf_sol as a double


% --- Executes during object creation, after setting all properties.
function Pf_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pf_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pa_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pa_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pa_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pa_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pa_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pa_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pb_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pb_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pb_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pb_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pb_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pb_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pc_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pc_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pc_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pc_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pc_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pc_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pd_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pd_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pd_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pd_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pd_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pd_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Py_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Py_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Py_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Py_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Py_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Py_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pz_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pz_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pz_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pz_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pz_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pz_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Pf_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Pf_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pf_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Pf_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Pf_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pf_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delay_sol_Callback(hObject, eventdata, handles)
% hObject    handle to text_99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_99 as text
%        str2double(get(hObject,'String')) returns contents of text_99 as a double


% --- Executes during object creation, after setting all properties.
function delay_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ptotal_pot_sol_Callback(hObject, eventdata, handles)
% hObject    handle to Ptotal_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ptotal_pot_sol as text
%        str2double(get(hObject,'String')) returns contents of Ptotal_pot_sol as a double


% --- Executes during object creation, after setting all properties.
function Ptotal_pot_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ptotal_pot_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_sol_Callback(hObject, eventdata, handles)
% hObject    handle to f_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f_sol as text
%        str2double(get(hObject,'String')) returns contents of f_sol as a double


% --- Executes during object creation, after setting all properties.
function f_sol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
