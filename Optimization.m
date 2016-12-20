function varargout = Optimization(varargin)
%OPTIMIZATION M-file for Optimization.fig
%      OPTIMIZATION, by itself, creates a new OPTIMIZATION or raises the existing
%      singleton*.
%
%      H = OPTIMIZATION returns the handle to a new OPTIMIZATION or the handle to
%      the existing singleton*.
%
%      OPTIMIZATION('Property','Value',...) creates a new OPTIMIZATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Optimization_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      OPTIMIZATION('CALLBACK') and OPTIMIZATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in OPTIMIZATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Optimization

% Last Modified by GUIDE v2.5 21-Dec-2016 00:56:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Optimization_OpeningFcn, ...
                   'gui_OutputFcn',  @Optimization_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Optimization is made visible.
function Optimization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Optimization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Optimization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Optimization_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in objectiveFunction.
function objectiveFunction_Callback(hObject, eventdata, handles)
% hObject    handle to objectiveFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns objectiveFunction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from objectiveFunction


% --- Executes during object creation, after setting all properties.
function objectiveFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to objectiveFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startPoint_Callback(hObject, eventdata, handles)
% hObject    handle to startPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startPoint as text
%        str2double(get(hObject,'String')) returns contents of startPoint as a double


% --- Executes during object creation, after setting all properties.
function startPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowerBound_Callback(hObject, eventdata, handles)
% hObject    handle to lowerBound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowerBound as text
%        str2double(get(hObject,'String')) returns contents of lowerBound as a double


% --- Executes during object creation, after setting all properties.
function lowerBound_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowerBound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function upperBound_Callback(hObject, eventdata, handles)
% hObject    handle to upperBound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upperBound as text
%        str2double(get(hObject,'String')) returns contents of upperBound as a double


% --- Executes during object creation, after setting all properties.
function upperBound_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upperBound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in solverTech.
function solverTech_Callback(hObject, eventdata, handles)
% hObject    handle to solverTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns solverTech contents as cell array
%        contents{get(hObject,'Value')} returns selected item from solverTech


% --- Executes during object creation, after setting all properties.
function solverTech_CreateFcn(hObject, eventdata, handles)
% hObject    handle to solverTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
