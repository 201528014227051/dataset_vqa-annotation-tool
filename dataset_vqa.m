function varargout = dataset_vqa(varargin)
% DATASET_VQA MATLAB code for dataset_vqa.fig
%      DATASET_VQA, by itself, creates a new DATASET_VQA or raises the existing
%      singleton*.
%
%      H = DATASET_VQA returns the handle to a new DATASET_VQA or the handle to
%      the existing singleton*.
%
%      DATASET_VQA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATASET_VQA.M with the given input arguments.
%
%      DATASET_VQA('Property','Value',...) creates a new DATASET_VQA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dataset_vqa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dataset_vqa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dataset_vqa

% Last Modified by GUIDE v2.5 23-Feb-2019 23:31:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dataset_vqa_OpeningFcn, ...
                   'gui_OutputFcn',  @dataset_vqa_OutputFcn, ...
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


% --- Executes just before dataset_vqa is made visible.
function dataset_vqa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dataset_vqa (see VARARGIN)

% Choose default command line output for dataset_vqa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dataset_vqa wait for user response (see UIRESUME)
% uiwait(handles.vqa);


% --- Outputs from this function are returned to the command line.
function varargout = dataset_vqa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3



function anses_Callback(hObject, eventdata, handles)
% hObject    handle to anses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anses as text
%        str2double(get(hObject,'String')) returns contents of anses as a double


% --- Executes during object creation, after setting all properties.
function anses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_to_txt.
function save_to_txt_Callback(hObject, eventdata, handles)
% hObject    handle to save_to_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
names = getappdata(handles.vqa,'names');
name_id = getappdata(handles.vqa,'name_id');
eq4 = get(handles.eq4,'string');
eq5 = get(handles.eq5,'string');
anses = get(handles.anses,'string');
%组织内容
ans = strsplit(anses, ';');
in_1 = [names(name_id).name,':What is the theme of this picture?',ans{1}];
in_2 = [names(name_id).name,':Does this picture contain an airplane?',ans{2}];
in_3 = [names(name_id).name,':Does this picture contain trees?',ans{3}];
in_4 = [names(name_id).name,':How many ', eq4,' in the picture?',ans{4}];
in_5 = [names(name_id).name,':What is the location of the ', eq5,' in this picture?',ans{5}];
%写入txt
fid = fopen('./ucm_res.txt','a+');
fprintf(fid, '%s\n', in_1);
fprintf(fid, '%s\n', in_2);
fprintf(fid, '%s\n', in_3);
fprintf(fid, '%s\n', in_4);
fprintf(fid, '%s\n', in_5);
fclose(fid);
set(handles.show, 'string','saved!');




% --- Executes on button press in open_file.
function open_file_Callback(hObject, eventdata, handles)
% hObject    handle to open_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*','请选择图片所在文件夹,并选中第一个图像文件');
names = dir(pathname);
for i=3:length(names)
    if strcmp(names(i).name,'1500.tif')%names(i).name=='132.tif'
        id_restart = i+1;
    end
end
file_name = fullfile(pathname, names(id_restart).name);
img_content = imread(file_name);
name_id = id_restart;
axes(handles.axes1);
imshow(img_content);
%set(handles.show, 'string','begin to answer');
set(handles.show, 'string', names(name_id).name);
setappdata(handles.vqa,'pathname',pathname);
setappdata(handles.vqa,'names',names);
setappdata(handles.vqa,'name_id',name_id);


% --- Executes on button press in next_img.
function next_img_Callback(hObject, eventdata, handles)
% hObject    handle to next_img (see GCBO)

names = getappdata(handles.vqa,'names');
name_id = getappdata(handles.vqa,'name_id');
pathname = getappdata(handles.vqa,'pathname');

name_id = name_id +1;
file_name = fullfile(pathname, names(name_id).name);
img_content = imread(file_name);
axes(handles.axes1);
imshow(img_content);
set(handles.show, 'string',names(name_id).name);
set(handles.eq4, 'string','');
set(handles.eq5, 'string','');
set(handles.anses, 'string','');

setappdata(handles.vqa,'pathname',pathname);
setappdata(handles.vqa,'names',names);
setappdata(handles.vqa,'name_id',name_id);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5



function eq4_Callback(hObject, eventdata, handles)
% hObject    handle to eq4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq4 as text
%        str2double(get(hObject,'String')) returns contents of eq4 as a double


% --- Executes during object creation, after setting all properties.
function eq4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eq5_Callback(hObject, eventdata, handles)
% hObject    handle to eq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq5 as text
%        str2double(get(hObject,'String')) returns contents of eq5 as a double


% --- Executes during object creation, after setting all properties.
function eq5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show as text
%        str2double(get(hObject,'String')) returns contents of show as a double


% --- Executes during object creation, after setting all properties.
function show_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
