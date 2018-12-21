function varargout = SwtichingTopologies(varargin)
% SWTICHINGTOPOLOGIES MATLAB code for SwtichingTopologies.fig
%      SWTICHINGTOPOLOGIES, by itself, creates a new SWTICHINGTOPOLOGIES or raises the existing
%      singleton*.
%
%      H = SWTICHINGTOPOLOGIES returns the handle to a new SWTICHINGTOPOLOGIES or the handle to
%      the existing singleton*.
%
%      SWTICHINGTOPOLOGIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SWTICHINGTOPOLOGIES.M with the given input arguments.
%
%      SWTICHINGTOPOLOGIES('Property','Value',...) creates a new SWTICHINGTOPOLOGIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SwtichingTopologies_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SwtichingTopologies_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SwtichingTopologies

% Last Modified by GUIDE v2.5 19-Nov-2018 17:27:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SwtichingTopologies_OpeningFcn, ...
                   'gui_OutputFcn',  @SwtichingTopologies_OutputFcn, ...
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


% --- Executes just before SwtichingTopologies is made visible.
function SwtichingTopologies_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SwtichingTopologies (see VARARGIN)

% Choose default command line output for SwtichingTopologies
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global buck;
global boost;
global buckboost;
axes(handles.axes1);
imshow(buck)
axes(handles.axes2);
imshow(boost)
axes(handles.axes3);
imshow(buckboost)


% UIWAIT makes SwtichingTopologies wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SwtichingTopologies_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Buck.
function Buck_Callback(hObject, eventdata, handles)
% hObject    handle to Buck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BuckTopology;

% --- Executes on button press in Boost.
function Boost_Callback(hObject, eventdata, handles)
% hObject    handle to Boost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BoostTopology;

% --- Executes on button press in BuckBoost.
function BuckBoost_Callback(hObject, eventdata, handles)
% hObject    handle to BuckBoost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BuckBoostTopology;