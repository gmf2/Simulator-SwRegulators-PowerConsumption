function varargout = PowerConsumption(varargin)
% POWERCONSUMPTION MATLAB code for PowerConsumption.fig
%      POWERCONSUMPTION, by itself, creates a new POWERCONSUMPTION or raises the existing
%      singleton*.
%
%      H = POWERCONSUMPTION returns the handle to a new POWERCONSUMPTION or the handle to
%      the existing singleton*.
%
%      POWERCONSUMPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWERCONSUMPTION.M with the given input arguments.
%
%      POWERCONSUMPTION('Property','Value',...) creates a new POWERCONSUMPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PowerConsumption_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PowerConsumption_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PowerConsumption

% Last Modified by GUIDE v2.5 12-Dec-2018 12:24:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PowerConsumption_OpeningFcn, ...
                   'gui_OutputFcn',  @PowerConsumption_OutputFcn, ...
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


% --- Executes just before PowerConsumption is made visible.
function PowerConsumption_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PowerConsumption (see VARARGIN)

% Choose default command line output for PowerConsumption
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global Py_sol;
Py_sol=0;
global Pz_sol;
Pz_sol=0;
global Pf_sol;
Pf_sol=0;
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
Pa_sol=0;
global Pb_sol;
Pb_sol=0;
global Pc_sol;
Pc_sol=0;
global Pd_sol;
Pd_sol=0;

global C_Gate;
C_Gate=0;
global Ron;
Ron=0;
global f;
f=0;
global Vdd;
Vdd=0;
global Creg;
Creg=0;
global delay_reg;
delay_reg=0;
% UIWAIT makes PowerConsumption wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PowerConsumption_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function SliderDInputA_Callback(hObject, eventdata, handles)
% hObject    handle to SliderDInputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Pa_sol;
valorA=get(hObject,'value');
    if isequal(valorA,0)
        valorA=0.001;
    elseif isequal(valorA,100)
        valorA=99.999;
    end
set(handles.EditDInputA,'string',num2str(valorA));
Pa_sol=valorA;
set_param('PowerDisp1/Pulse Generator','PulseWidth',num2str(valorA));
   
    
% --- Executes during object creation, after setting all properties.
function SliderDInputA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderDInputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function EditDInputA_Callback(hObject, eventdata, handles)
% hObject    handle to EditDInputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditDInputA as text
%        str2double(get(hObject,'String')) returns contents of EditDInputA as a double
global Pa_sol;
editA=get(hObject,'string');
    if isequal(editA,'0')
       editA='0.001';
    elseif isequal(editA,'100')
        editA='99.999';
    end
    if str2num(editA)>0.001 && str2num(editA)<100
        set(handles.SliderDInputA,'value',str2double(editA));
        Pa_sol=str2num(editA);
        set_param('PowerDisp1/Pulse Generator','PulseWidth',editA);
    else
        warndlg('Number between 0 and 100')
    end
    
    
 % --- Executes during object creation, after setting all properties.
function EditDInputA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditDInputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SliderDInputB_Callback(hObject, eventdata, handles)
% hObject    handle to SliderDInputB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Pb_sol;
valorB=get(hObject,'value');
    if isequal(valorB,0)
        valorB=0.001;
    elseif isequal(valorB,100)
        valorB=99.999;
    end
    
set(handles.EditDInputB,'string',num2str(valorB));
Pb_sol=valorB;
set_param('PowerDisp1/Pulse Generator1','PulseWidth',num2str(valorB));
   
    

% --- Executes during object creation, after setting all properties.
function SliderDInputB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderDInputB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function EditDInputB_Callback(hObject, eventdata, handles)
% hObject    handle to EditDInputB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditDInputB as text
%        str2double(get(hObject,'String')) returns contents of EditDInputB as a double
global Pb_sol;
editB=get(hObject,'string');

    if isequal(editB,'0')
       editB='0.001';
    elseif isequal(editB,'100')
        editB='99.999';
    end
     if str2num(editB)>0.001 && str2num(editB)<100
       set(handles.SliderDInputB,'value',str2double(editB));
       Pb_sol= str2num(editB);
       set_param('PowerDisp1/Pulse Generator1','PulseWidth',editB);
    else
        warndlg('Number between 0 and 100')
    end




% --- Executes during object creation, after setting all properties.
function EditDInputB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditDInputB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SliderDInputC_Callback(hObject, eventdata, handles)
% hObject    handle to SliderDInputC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Pc_sol;    
valorC=get(hObject,'value');
    set(handles.EditDInputC,'string',num2str(valorC));
    if isequal(valorC,0)
        valorC=0.001;
    elseif isequal(valorC,100)
        valorC=99.999;
    end
%    guidata(hObject.handles);
    %find_system('Name','PowerDisp1');
    %open_system('PowerDisp1');
    set(handles.EditDInputC,'string',num2str(valorC));
    set_param('PowerDisp1/Pulse Generator2','PulseWidth',num2str(valorC));
    Pc_sol=valorC;

% --- Executes during object creation, after setting all properties.
function SliderDInputC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderDInputC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function EditDInputC_Callback(hObject, eventdata, handles)
% hObject    handle to EditDInputC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditDInputC as text
%        str2double(get(hObject,'String')) returns contents of EditDInputC as a double
global Pc_sol;
editC=get(hObject,'string');
    if isequal(editC,'0')
       editC='0.001';
    elseif isequal(editC,'100')
        editC='99.999';
    end
    if str2num(editC)>0.001 && str2num(editC)<100
      set(handles.SliderDInputC,'value',str2num(editC));
      Pc_sol= str2num(editC);
      set_param('PowerDisp1/Pulse Generator2','PulseWidth',editC);
    else
       warndlg('Number between 0 and 100')
    end



% --- Executes during object creation, after setting all properties.
function EditDInputC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditDInputC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SliderDInputD_Callback(hObject, eventdata, handles)
% hObject    handle to SliderDInputD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global Pd_sol;
    valorD=get(hObject,'value');
    if isequal(valorD,0)
        valorD=0.001;
    elseif isequal(valorD,100)
        valorD=99.999;
    end
    set(handles.EditDInputD,'string',num2str(valorD));
%    guidata(hObject.handles);
    %find_system('Name','PowerDisp1');
    %open_system('PowerDisp1');
    Pd_sol=valorD;
    set_param('PowerDisp1/Pulse Generator3','PulseWidth',num2str(valorD));
    %disp(valorD)
    %Parametros_step=get_param('PowerDisp1/Pulse Generator3','dialogparameters');
    %disp(Parametros_step)
    
% --- Executes during object creation, after setting all properties.
function SliderDInputD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderDInputD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function EditDInputD_Callback(hObject, eventdata, handles)
% hObject    handle to EditDInputD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditDInputD as text
%        str2double(get(hObject,'String')) returns contents of EditDInputD as a double
global Pd_sol;
editD=get(hObject,'string');
    if isequal(editD,'0')
       editD='0.001';
    elseif isequal(editD,'100')
        editD='99.999';
    end
    if str2num(editD)>0.001 && str2num(editD)<100
      set(handles.SliderDInputD,'value',str2double(editD));
      Pd_sol=str2num(editD);
      set_param('PowerDisp1/Pulse Generator3','PulseWidth',editD);


    else
        warndlg('Number between 0 and 100')
    end




% --- Executes during object creation, after setting all properties.
function EditDInputD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditDInputD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_Gate_Callback(hObject, eventdata, handles)
% hObject    handle to C_Gate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_Gate as text
%        str2double(get(hObject,'String')) returns contents of C_Gate as a double
global C_Gate;
C_Gate = get (hObject, 'String');
C_Gate = str2double (C_Gate);

% --- Executes during object creation, after setting all properties.
function C_Gate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_Gate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ron_Callback(hObject, eventdata, handles)
% hObject    handle to Ron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ron as text
%        str2double(get(hObject,'String')) returns contents of Ron as a double
global Ron;
Ron = get (hObject, 'String');
Ron = str2double (Ron);

% --- Executes during object creation, after setting all properties.
function Ron_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double
global f;
f = get (hObject, 'String');
f = str2double (f);

% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vdd_Callback(hObject, eventdata, handles)
% hObject    handle to Vdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vdd as text
%        str2double(get(hObject,'String')) returns contents of Vdd as a double
global Vdd;
Vdd = get (hObject, 'String');
Vdd = str2double (Vdd);


% --- Executes during object creation, after setting all properties.
function Vdd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function C_Reg_Callback(hObject, eventdata, handles)
% hObject    handle to C_Reg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_Reg as text
%        str2double(get(hObject,'String')) returns contents of C_Reg as a double
global Creg;
Creg = get (hObject, 'String');
Creg = str2double (Creg);

% --- Executes during object creation, after setting all properties.
function C_Reg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_Reg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function delay_reg_Callback(hObject, eventdata, handles)
% hObject    handle to delay_reg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delay_reg as text
%        str2double(get(hObject,'String')) returns contents of delay_reg as a double
global delay_reg;
delay_reg = get (hObject, 'String');
delay_reg = str2double (delay_reg);

% --- Executes during object creation, after setting all properties.
function delay_reg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delay_reg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PowerConsumption_solution;