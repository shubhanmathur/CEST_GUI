function varargout = ratioCEST_gui(varargin)
% RATIOCEST_GUI MATLAB code for ratioCEST_gui.fig
%      RATIOCEST_GUI, by itself, creates a new RATIOCEST_GUI or raises the existing
%      singleton*.
%
%      H = RATIOCEST_GUI returns the handle to a new RATIOCEST_GUI or the handle to
%      the existing singleton*.
%
%      RATIOCEST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RATIOCEST_GUI.M with the given input arguments.
%
%      RATIOCEST_GUI('Property','Value',...) creates a new RATIOCEST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ratioCEST_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ratioCEST_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ratioCEST_gui

% Last Modified by GUIDE v2.5 21-Sep-2021 12:04:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ratioCEST_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @ratioCEST_gui_OutputFcn, ...
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


% --- Executes just before ratioCEST_gui is made visible.
function ratioCEST_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ratioCEST_gui (see VARARGIN)

% Choose default command line output for ratioCEST_gui
handles.output = hObject;


% exp_path 
%set(handles.exp_path, 'string', 'C:/Users/Stabinska/Documents/MRData/Bruker 500MHz/mslice_cestRARE_test/20210416_110320_mslice_cestRARE_test_20210416_Iopamidol_mic_1_7')
set(handles.exp_path, 'string', 'C:\Users\Stabinska\Documents\_Studies\ZiniaKidney')
%set(handles.exp_path, 'string', '')

% anatomic_exp_no
set(handles.anatomic_exp_no, 'string', '')

% pre_exp_no
set(handles.pre_exp_no, 'string', '')

% post_exp_no
set(handles.post_exp_no, 'string', '')

% post_exp_no
set(handles.wassr_no, 'string', '')

% filter_checkbox
set(handles.filter_checkbox, 'value', 0)


% maps_popupmenu
set(handles.maps_popupmenu, 'Value', 1);

% maps_axes
axes(handles.maps_axes);
handles.dyn_pos = 1;
handles.slice_pos = 1;

try
handles.Stack = handles.Mpre_stack;  % initial stack is the pre-injection stac
imagesc(handles.Stack(:, :, handles.slice_pos, handles.dyn_pos))
catch
imagesc(zeros(64, 64));
end

colormap gray;
axis off;
%hold on;
%contour(handles.Mask , 1, 'm-','LineWidth',2)

% norm_checkbox
set(handles.norm_checkbox, 'Value', 0);

% M0onoff_checkbox
set(handles.M0onoff_checkbox, 'Value', 1);

% pixeloverlay_checkbox
set(handles.pixeloverlay_checkbox, 'Value', 0);


% dynamics_axes
axes(handles.dynamics_axes);
set(handles.dynamics_axes,'YAxisLocation','right');
xlabel('Dynamic number');
ylabel('M_{z}');
box on;

% slice_slider - Slice range
set(handles.slice_slider, 'Min', 1);

try
    set(handles.slice_slider, 'Max', size(handles.Stack, 3));
catch
    set(handles.slice_slider, 'Max', 7);
end
set(handles.slice_slider, 'Value', 1);

try
   set(handles.slice_slider, 'SliderStep', [1/(size(handles.Stack, 3) - 1) 1/(size(handles.Stack, 3) - 1)]);
 catch
   set(handles.slice_slider, 'SliderStep', [1/(20 - 1) 1/(20 - 1)]);
end
set(handles.slice_panel,'Title',sprintf('Slice No. = %d', 1));

% dynamics_slider - Dynamic range
set(handles.dynamics_slider, 'Min', 1);
try
    set(handles.dynamics_slider, 'Max', size(handles.Stack, 4));
catch
    set(handles.dynamics_slider, 'Max', 10);
end
set(handles.dynamics_slider, 'Value', 1);

try
    set(handles.dynamics_slider, 'SliderStep', [1/(size(handles.Stack, 4) - 1) 1/(size(handles.Stack, 4) - 1)]);
catch
    set(handles.dynamics_slider, 'SliderStep', [1/(20 - 1) 1/(20 - 1)]); 
end
set(handles.dynamics_panel,'Title',sprintf('Dynamic No. = %d', 1));


set(gcf, 'WindowButtonDownFcn', @getMousePositionOnImage);

% ROIT2w_radiobutton
set(handles.ROIT2w_radiobutton, 'Value', 0);

% ROIM0_radiobutton
set(handles.ROIM0_radiobutton, 'Value', 1);

% polyshape_radiobutton
set(handles.polyshape_radiobutton, 'Value', 1);

% roisno_edit
set(handles.roisno_edit, 'String', 1);

% mlfprespan_edit
set(handles.mlfprespan_edit, 'String', 2);

% mlfpostspan_edit
set(handles.mlfpostspan_edit, 'String', 2);

% prerangelb_edit
set(handles.prerangelb_edit,'String', 7);

% prerangeub_edit
set(handles.prerangeub_edit,'String', 14);

% postrangelb_edit
set(handles.postrangelb_edit,'String', 21);

% postrangeub_edit
set(handles.postrangeub_edit,'String', 87);

% average_radiobutton
set(handles.average_radiobutton, 'Value', 0);

% minrange_radiobutton
set(handles.minrange_radiobutton, 'Value', 1);

% minrange_edit
set(handles.minrange_edit,'String', 1);

% threshold_edit
set(handles.threshold_edit,'String', 2);

% signenhanc_radiobutton
set(handles.sigenhanc_radiobutton, 'value', 1);

% Mzdisp_radiobutton
set(handles.Mzdisp_radiobutton, 'Value', 0);

% MzM0disp_radiobutton
set(handles.MzM0disp_radiobutton, 'Value', 0);

% MTRdisp_radiobutton
set(handles.MTRdisp_radiobutton, 'Value', 0);

% inverseMTR_radiobutton
set(handles.inverseMTR_radiobutton, 'Value', 1);

% CESThistogram_radiobutton
set(handles.CESThistogram_radiobutton, 'Value', 0);

% MTRratiodisp_radiobutton
set(handles.MTRratiodisp_radiobutton, 'Value', 1);

% pHmapdisp_radiobutton
set(handles.pHmapdisp_radiobutton, 'Value', 1);

% pHhistogram_radiobutton
set(handles.pHhistogram_radiobutton, 'Value', 1);

% % p1coeff_edit
% set(handles.p1coeff_edit,'String', -0.2547);
% 
% % p2coeff_edit
% set(handles.p2coeff_edit,'String', 0.9821);  
% 
% % p3coeff_edit
% set(handles.p3coeff_edit,'String', -1.558);
% 
% % p4coeff_edit
% set(handles.p4coeff_edit,'String', 7.229);

% p1coeff_edit UUO
set(handles.p1coeff_edit,'String', -0.0237);

% p2coeff_edit
set(handles.p2coeff_edit,'String', 0.2509);  

% p3coeff_edit
set(handles.p3coeff_edit,'String', -1.029);

% p4coeff_edit
set(handles.p4coeff_edit,'String', 7.508);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ratioCEST_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ratioCEST_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% -------------------------------------------------------------------------
%   Load CEST Data
% -------------------------------------------------------------------------

function exp_path_Callback(hObject, eventdata, handles)
% hObject    handle to exp_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exp_path as text
%        str2double(get(hObject,'String')) returns contents of exp_path as a double


% --- Executes during object creation, after setting all properties.
function exp_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exp_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function anatomic_exp_no_Callback(hObject, eventdata, handles)
% hObject    handle to anatomic_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anatomic_exp_no as text
%        str2double(get(hObject,'String')) returns contents of anatomic_exp_no as a double


% --- Executes during object creation, after setting all properties.
function anatomic_exp_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anatomic_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pre_exp_no_Callback(hObject, eventdata, handles)
% hObject    handle to pre_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pre_exp_no as text
%        str2double(get(hObject,'String')) returns contents of pre_exp_no as a double


% --- Executes during object creation, after setting all properties.
function pre_exp_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pre_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function post_exp_no_Callback(hObject, eventdata, handles)
% hObject    handle to post_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of post_exp_no as text
%        str2double(get(hObject,'String')) returns contents of post_exp_no as a double


% --- Executes during object creation, after setting all properties.
function post_exp_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to post_exp_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function wassr_no_Callback(hObject, eventdata, handles)
% hObject    handle to wassr_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wassr_no as text
%        str2double(get(hObject,'String')) returns contents of wassr_no as a double


% --- Executes during object creation, after setting all properties.
function wassr_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wassr_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.exp_path = get(handles.exp_path,'string');
handles.anatomic_exp_no = get(handles.anatomic_exp_no,'string');
handles.pre_exp_no = get(handles.pre_exp_no,'string');
handles.post_exp_no = get(handles.post_exp_no,'string');
handles.wassr_exp_no = get(handles.wassr_no,'string');
handles.filter_checkbox = get(handles.filter_checkbox, 'value');
    
handles.exp_no = {handles.pre_exp_no, handles.post_exp_no};

% Load CEST data
if ~isempty(handles.pre_exp_no) || ~isempty(handles.post_exp_no)
    handles.CESTdata = loadCESTdata(handles.exp_no, handles.exp_path, handles.filter_checkbox);
else
    disp('CEST data not loaded');
end

% Load WASSR data
if ~isempty(handles.wassr_exp_no)
    handles.WASSRdata = loadWASSRdata(handles.wassr_exp_no, handles.exp_path, handles.filter_checkbox);
    WASSRdata = handles.WASSRdata; 
    assignin('base', 'WASSRdata', WASSRdata);
else
  disp('WASSR data not loaded');
end

% Load T2 data
if ~isempty(handles.anatomic_exp_no)
    handles.T2data = loadT2data(handles.anatomic_exp_no, handles.exp_path, handles.filter_checkbox);
    T2data = handles.T2data; 
    assignin('base', 'T2data', T2data);
else
  disp('T2w data not loaded');
end

maps_popupmenu_Callback(hObject, eventdata, handles);

% Show pre-injection stack data 
try
handles.Stack = handles.CESTdata(1).Mz_stack_full;  % initial stack is the pre-injection stac
handles.offset_Hz_full = handles.CESTdata(1).offset_Hz_full;
handles.M0start_no = handles.CESTdata(1).M0start_no;
handles.M0end_no = handles.CESTdata(1).M0end_no;
handles.stack_dim = handles.CESTdata(1).stack_dim;
catch
handles.Stack = handles.WASSRdata.Mz_stack_full;
end

set(handles.dynamics_slider, 'Max', size(handles.Stack, 4))
set(handles.dynamics_slider, 'SliderStep', [1/(size(handles.Stack, 4) - 1) 1/(size(handles.Stack, 4) - 1)]);
axes(handles.maps_axes);

if handles.slice_pos <= size(handles.Stack, 3) && handles.dyn_pos <= size(handles.Stack, 4)
    imagesc(handles.Stack(:, :, handles.slice_pos, handles.dyn_pos)) % initial stack is the pre-injection stack
    colormap gray;
    axis off;
end
colormap gray;
axis off;

% Normalize CEST data
if ~isempty(handles.pre_exp_no) || ~isempty(handles.post_exp_no)
    handles.CESTdata = normalizeCESTdata(handles.CESTdata);
    CESTdata = handles.CESTdata;
    assignin('base', 'CESTdata', CESTdata);
end

guidata(hObject, handles);

% --- Executes on button press in open_button.
function open_button_Callback(hObject, ~, handles)
% hObject    handle to open_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%handles.exp_path = get(handles.exp_path, 'String');

handles.path = uigetdir('C:\Users\Stabinska\Documents\MRData\Bruker 500MHz\UUO Animal Study\Study');
set(handles.exp_path, 'string', handles.path);

guidata(hObject, handles);

% --- Executes on button press in filter_checkbox.
function filter_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to filter_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of filter_checkbox


% --- Executes on selection change in maps_popupmenu.
function maps_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to maps_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns maps_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from maps_popupmenu

axes(handles.maps_axes);
axis off;
colorbar;
cla;

if isempty(handles.pre_exp_no) || isempty(handles.post_exp_no)
    popup_sel_index = 5;
else
    popup_sel_index = get(hObject, 'Value');
end

switch popup_sel_index
    case 1 % Stack = Pre-injection
        try
            handles.Stack = double(handles.CESTdata(1).Mz_stack_full);
        catch
            handles.Stack = imagesc(zeros(64, 64));
        end
        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = handles.CESTdata(1).offset_Hz_full;
        handles.M0start_no = handles.CESTdata(1).M0start_no;
        handles.M0end_no = handles.CESTdata(1).M0end_no;
        handles.stack_dim = handles.CESTdata(1).stack_dim;
        
    case 2 % Stack = Post-injection
        handles.Stack = double(handles.CESTdata(2).Mz_stack_full);
        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = handles.CESTdata(2).offset_Hz_full;
        handles.M0start_no = handles.CESTdata(2).M0start_no;
        handles.M0end_no = handles.CESTdata(2).M0end_no;
        handles.stack_dim = handles.CESTdata(2).stack_dim;
                
    case 3 % Stack = WASSR data
         try
            handles.Stack = double(handles.WASSRdata.Mz_stack_full);
            handles.offset_Hz_full = handles.WASSRdata.offset_Hz_full;
            handles.stack_dim = handles.WASSRdata.stack_dim;
         catch
            handles.Stack = double(handles.CESTdata(2).Mz_stack_full);
            handles.offset_Hz_full = handles.CESTdata(2).offset_Hz_full;
            handles.stack_dim = handles.CESTdata(2).stack_dim;
         end

        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = handles.WASSRdata.offset_Hz_full;
        handles.stack_dim = handles.WASSRdata.stack_dim;
        
    case 4 % Stack = T2 data
         try
            handles.Stack = double(handles.T2data.T2_stack);
         catch
            handles.Stack = double(handles.CESTdata(2).Mz_stack_full);
         end

        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = 1;
        handles.stack_dim = handles.T2data.stack_dim;
        
    case 5 % Stack = Pre-injection mocorr
       try
            handles.Stack = double(handles.CESTdata(1).Mz_stack_mocorr_sort_full);
        catch
            handles.Stack = double(handles.CESTdata(1).Mz_stack_full);
       end
        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = handles.CESTdata(1).offset_Hz_full;
        handles.M0start_no = handles.CESTdata(1).M0start_no;
        handles.M0end_no = handles.CESTdata(1).M0end_no;
        handles.stack_dim = handles.CESTdata(1).stack_dim;
        
    case 6 % Stack = Post-injection mocorr
       try
            handles.Stack = double(handles.CESTdata(2).Mz_stack_mocorr_sort_full);
         catch
            handles.Stack = double(handles.CESTdata(2).Mz_stack_full);
       end

        set(handles.slice_slider, 'value', 1);
        set(handles.dynamics_slider, 'value', 1);
        UpdateSliders_Callback(hObject, eventdata, handles);
        handles.offset_Hz_full = handles.CESTdata(2).offset_Hz_full;
        handles.M0start_no = handles.CESTdata(2).M0start_no;
        handles.M0end_no = handles.CESTdata(2).M0end_no;
        handles.stack_dim = handles.CESTdata(2).stack_dim;       
end
if size(handles.Stack, 4) > 1
    set(handles.dynamics_slider, 'Max', size(handles.Stack, 4))
    set(handles.dynamics_slider, 'SliderStep', [1/(size(handles.Stack, 4) - 1) 1/(size(handles.Stack, 4) - 1)]);
else
   set(handles.dynamics_slider,'visible','off') 
end

if size(handles.Stack, 3) > 1
    set(handles.slice_slider, 'Max', size(handles.Stack, 3))
    set(handles.slice_slider, 'SliderStep', [1/(size(handles.Stack, 3) - 1) 1/(size(handles.Stack, 3) - 1)]);
else
    set(handles.slice_slider,'visible','off')
end


if handles.slice_pos <= size(handles.Stack, 3) && handles.dyn_pos <= size(handles.Stack, 4) % if popt parameters are selected
    imagesc(handles.Stack(:, :, handles.slice_pos, handles.dyn_pos));
    axis off;
else
    imagesc(handles.Stack(:, :, 1, 1));
end
axis off;
colormap gray;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function maps_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maps_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 set(hObject, 'String', {'Pre-injection', 'Post-injection', 'WASSR', 'T2w', 'Pre-injection mocorr', 'Post-injection mocorr'});


% --- Executes on slider movement.
function dynamics_slider_Callback(hObject, eventdata, handles)
% hObject    handle to dynamics_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
axes(handles.maps_axes);
handles.dyn_pos = round(get(hObject,'Value'));

UpdateSliders_Callback(hObject, eventdata, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function dynamics_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dynamics_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slice_slider_Callback(hObject, eventdata, handles)
% hObject    handle to slice_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
axes(handles.maps_axes);
handles.slice_pos = round(get(hObject,'Value'));

UpdateSliders_Callback(hObject, eventdata, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slice_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slice_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function UpdateSliders_Callback(hObject, eventdata, handles)

axes(handles.maps_axes);

handles.slice_pos = round(get(handles.slice_slider,'Value'));
handles.dyn_pos = round(get(handles.dynamics_slider,'Value'));
set(handles.slice_panel,'Title', sprintf('Slice No. = %d', handles.slice_pos));
set(handles.dynamics_panel,'Title', sprintf('Dynamic No. = %d', handles.dyn_pos));

if handles.slice_pos <= size(handles.Stack, 3) && handles.dyn_pos <= size(handles.Stack, 4) % if popt parameters are selected
    imagesc(handles.Stack(:, :, handles.slice_pos, handles.dyn_pos));
    axis off;
else
        imagesc(handles.Stack(:, :, 1, 1));
end
guidata(hObject, handles);

% -------------------------------------------------------------------------
%   Dynamics axes
% -------------------------------------------------------------------------

% --- Executes on button press in M0onoff_checkbox.
function M0onoff_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to M0onoff_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of M0onoff_checkbox


% --- Executes on button press in pixeloverlay_checkbox.
function pixeloverlay_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to pixeloverlay_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pixeloverlay_checkbox


function getMousePositionOnImage(src, event)

handles = guidata(src);

cursorPoint = get(handles.maps_axes, 'CurrentPoint');
x_pos = uint16(cursorPoint(1,1));
y_pos = uint16(cursorPoint(1,2));

xLimits = get(handles.maps_axes, 'xlim');
yLimits = get(handles.maps_axes, 'ylim');


if (x_pos > min(xLimits) && x_pos < max(xLimits) && y_pos > min(yLimits) && y_pos < max(yLimits))
disp(['Position (' num2str(x_pos) ', ' num2str(y_pos) ').']);


popup_sel_index = get(handles.maps_popupmenu, 'value');
norm_checkbox_val = get(handles.norm_checkbox, 'value');
M0onoff_checkbox_val = get(handles.M0onoff_checkbox, 'value');
pixeloverlay_checkbox_val = get(handles.pixeloverlay_checkbox, 'value');


if norm_checkbox_val == 1 && popup_sel_index == 1
    handles.Stack = double(handles.CESTdata(1).Mz_stack_norm);
elseif norm_checkbox_val == 1 && popup_sel_index == 2
    handles.Stack = double(handles.CESTdata(2).Mz_stack_norm);
end

if popup_sel_index == 3 % Plot the WASSR spectra
    axes(handles.dynamics_axes);
    plot(handles.WASSRdata.offset_ppm, squeeze(handles.WASSRdata.Mz_stack_norm(y_pos, x_pos, handles.slice_pos, :)));
    set(handles.dynamics_axes,'YAxisLocation','right');
    axis([min(handles.WASSRdata.offset_ppm) max(handles.WASSRdata.offset_ppm)  0 1.0])
    xticks(round([min(handles.WASSRdata.offset_ppm):0.3:max(handles.WASSRdata.offset_ppm)],2))
    ylabel('M_{z}/M_{0}');
    xlabel('Frequency Offset (ppm)');
   if pixeloverlay_checkbox_val == 0
        hold(handles.dynamics_axes, 'off')
   else
        hold(handles.dynamics_axes, 'on')
   end
else % Show the dynamic scans
if ~isempty(handles.pre_exp_no) || ~isempty(handles.post_exp_no)
    
    % CEST Data
    for i = 1:numel(handles.CESTdata(1).diffoffsets) - 1

        [~, c_ind] = find(handles.offset_Hz_full == handles.CESTdata(1).diffoffsets(i), 10000);
      %  Stack_offsets = handles.Stack(:, :, :, c_ind);   
        offsets_ind = handles.CESTdata(1).Mz_stack(i).Mz_ind;
        [cmax, cind_max]  = max(diff(offsets_ind));
        
        
        if  popup_sel_index == 1 || popup_sel_index == 5
            Full_Stack_offsets = [squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, 1:handles.M0start_no)); squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, handles.CESTdata(1).Mz_stack(i).Mz_ind)); squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, handles.stack_dim(4)-handles.M0end_no+1:handles.stack_dim(4)))];
        elseif popup_sel_index == 2 || popup_sel_index == 6
            Full_Stack_offsets = [squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, 1:handles.M0start_no)); squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, handles.CESTdata(2).Mz_stack(i).Mz_ind)); squeeze(handles.Stack(y_pos, x_pos, handles.slice_pos, handles.stack_dim(4)-handles.M0end_no+1:handles.stack_dim(4)))];
        end
        
        
        CT = cbrewer('qual', 'Paired', (numel(handles.CESTdata(1).diffoffsets)));
        if M0onoff_checkbox_val == 1 % Show M0
            % Plot the CEST data
            axes(handles.dynamics_axes);
            plot(handles.dynamics_axes, Full_Stack_offsets, '.-', 'Color', CT(i, :));  
            set(handles.dynamics_axes,'YAxisLocation','right');
        else
            axes(handles.dynamics_axes);
            plot(handles.dynamics_axes, Full_Stack_offsets, '.-', 'Color', CT(i, :));  
            axis([handles.M0start_no+1 (handles.stack_dim(4)-handles.M0end_no+1)/(size(handles.CESTdata(1).diffoffsets, 2)-1)+1  min(Full_Stack_offsets(handles.M0start_no:end-handles.M0end_no))-35 max(Full_Stack_offsets(handles.M0start_no+1:end-handles.M0end_no))+5]);
            xticks([handles.M0start_no+1:10:(handles.stack_dim(4)-handles.M0end_no+1)/(size(handles.CESTdata(1).diffoffsets, 2)-1)+1]);
            set(handles.dynamics_axes,'YAxisLocation','right');
        end
        
        if norm_checkbox_val == 1 % Update the y-axis label
            ylabel('M_{z}/M_{0}');
        else
            ylabel('M_{z}');
        end
        xlabel('Dynamic no');
        hold(handles.dynamics_axes, 'on')
    end
    
    if pixeloverlay_checkbox_val == 0 % Overlay signal from different pixels
        hold( handles.dynamics_axes, 'off')
    end
end
end
else
disp('Cursor is outside bounds of image.');
return
end

% --- Executes on button press in norm_checkbox.
function norm_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to norm_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of norm_checkbox

% -------------------------------------------------------------------------
% Define ROIs
% -------------------------------------------------------------------------

% --- Executes on button press in loadROIs_pushbutton.
function loadROIs_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadROIs_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.mat');
load(fullfile(path,file), 'ROIdef_full', 'Mask_full');
fprintf('ROIs loaded from %s\n', fullfile(path,file))


handles.ROIdef_full = ROIdef_full;
handles.Mask_full = Mask_full;
guidata(hObject, handles);


function roisno_edit_Callback(hObject, eventdata, handles)
% hObject    handle to roisno_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roisno_edit as text
%        str2double(get(hObject,'String')) returns contents of roisno_edit as a double


% --- Executes during object creation, after setting all properties.
function roisno_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roisno_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in roi_pushbutton.
function roi_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to roi_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear ROIdef_full Mask_full handles.ROIdef_full handles.Mask_full;
% evalin('base', 'clear ROIdef_full Mask_full handles.ROIdef_full handles.Mask_full');
% if isfield(handles, 'ROIdef_full') == 1 && ishandle(handles.ROIdef_full) == 1
% handles = rmfield(handles, 'handles.ROIdef_full');
% end
% 
% if isfield(handles, 'Mask_full') == 1 && ishandle(handles.Mask_full) == 1
% handles = rmfield(handles, 'handles.Mask_full');
% end
% guidata(hObject, handles);

handles.noOfROIs = str2double(get(handles.roisno_edit,'string'));
ROIT2wimage_val = get(handles.ROIT2w_radiobutton,'value');
ROIM0_val = get(handles.ROIM0_radiobutton,'value');
freeshape_val = get(handles.freeshape_radiobutton,'value');
polyshape_val = get(handles.polyshape_radiobutton,'value');
ellipseshape_val = get(handles.ellipseshape_radiobutton,'value');
regiongrowing_val = get(handles.regiongrowing_radiobutton,'value');

if (polyshape_val == 1)
    SegmentationMethod = 'manual';
    shape = 'poly';
elseif (ellipseshape_val == 1)
    SegmentationMethod = 'manual';
    shape = 'ellipse';
elseif (freeshape_val == 1)
    SegmentationMethod = 'manual';
    shape = 'free';
elseif (regiongrowing_val == 1)
    SegmentationMethod = 'automatic';
    shape = [];
end


for sl = 1:handles.CESTdata(1).stack_dim(3)
    if ROIT2wimage_val == 1
        ROIimage = handles.T2data.T2_stack(:, :, sl);
    elseif ROIM0_val == 1
        ROIimage = handles.CESTdata(1).M0_stack_full(:, :, sl);
    end
    
    [Mask_org, ROIdef_org] = createROI(ROIimage, SegmentationMethod, sl, handles.noOfROIs, shape);
    
    if ROIT2wimage_val == 1 % Draw the ROIs using the T2w image and downslample
        sz = size(Mask_org);
        xg = 1:sz(1);
        yg = 1:sz(2);
        F = griddedInterpolant({xg,yg}, double(Mask_org));
        xq = (1:handles.T2data.stack_dim(1)/handles.CESTdata(1).stack_dim(1):sz(1))';
        yq = (1:handles.T2data.stack_dim(1)/handles.CESTdata(1).stack_dim(1):sz(2))';
        vq = uint8(F({xq,yq}));
        Mask = vq;
        for kr = 1:handles.noOfROIs
            szr = size(ROIdef_org);
            xgr = 1:sz(1);
            ygr = 1:sz(2);
            Fr = griddedInterpolant({xgr,ygr}, double(ROIdef_org));
            xqr = (1:handles.T2data.stack_dim(1)/handles.CESTdata(1).stack_dim(1):sz(1))';
            yqr = (1:handles.T2data.stack_dim(1)/handles.CESTdata(1).stack_dim(1):sz(2))';
            vqr = uint8(Fr({xqr, yqr}));
        end
         ROIdef = vqr;      
         Mask_full(:, :, sl) = Mask;
         ROIdef_full(:, :, sl, :) = ROIdef;
         
         handles.Mask_full = Mask_full;
         handles.ROIdef_full = ROIdef_full;
    else
         handles.Mask_full = Mask_org;
         handles.ROIdef_full = ROIdef_org;
    end


end


figure(10) % Plot the ROIs
for sl = 1:handles.CESTdata(1).stack_dim(3)
    
    if handles.CESTdata(1).stack_dim(3) > 1
        subplot(2, round(handles.CESTdata(1).stack_dim(3)/2), sl)
        imagesc(handles.CESTdata(2).M0_stack_full(:, :, sl, 1));
        hold on;
        contour(handles.Mask_full(:, :, sl) , 1, 'm-','LineWidth',2);
    else
        imagesc(handles.CESTdata(2).M0_stack_full(:, :, sl, 1));
        hold on;
        contour(handles.Mask_full(:, :, sl) , 1, 'm-','LineWidth',2);
    end


axis off;
axis equal;
title(sprintf('ROI(s) in slice %d', sl));
colormap gray;
%CT = cbrewer('seq', 'YlGnBu', 9);
%colormap(CT)

 Mask_full = handles.Mask_full;
 ROIdef_full = handles.ROIdef_full; 
 assignin('base', 'Mask_full', Mask_full);
 assignin('base', 'ROIdef_full', ROIdef_full);
 assignin('base', 'Mask_org', Mask_org);
 assignin('base', 'ROIdef_org', ROIdef_org);

guidata(hObject, handles);
end

% -------------------------------------------------------------------------
% Apply Moving Average Filter
% -------------------------------------------------------------------------

function mlfprespan_edit_Callback(hObject, eventdata, handles)
% hObject    handle to mlfprespan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mlfprespan_edit as text
%        str2double(get(hObject,'String')) returns contents of mlfprespan_edit as a double


% --- Executes during object creation, after setting all properties.
function mlfprespan_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mlfprespan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mlfpostspan_edit_Callback(hObject, eventdata, handles)
% hObject    handle to mlfpostspan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mlfpostspan_edit as text
%        str2double(get(hObject,'String')) returns contents of mlfpostspan_edit as a double


% --- Executes during object creation, after setting all properties.
function mlfpostspan_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mlfpostspan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mlf_pushbutton.
function mlf_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to mlf_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mlfprespan_val = str2double(get(handles.mlfprespan_edit,'String'));
mlfpostspan_val = str2double(get(handles.mlfpostspan_edit,'String'));

handles.CESTdata = applyMovingAverageFilter(handles.CESTdata, [mlfprespan_val; mlfpostspan_val]);

CESTdata = handles.CESTdata;
assignin('base', 'CESTdata', CESTdata);

guidata(hObject, handles);


% -------------------------------------------------------------------------
% Average, Substract, and Mask
% -------------------------------------------------------------------------

function prerangelb_edit_Callback(hObject, eventdata, handles)
% hObject    handle to prerangelb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prerangelb_edit as text
%        str2double(get(hObject,'String')) returns contents of prerangelb_edit as a double


% --- Executes during object creation, after setting all properties.
function prerangelb_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prerangelb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function prerangeub_edit_Callback(hObject, eventdata, handles)
% hObject    handle to prerangeub_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prerangeub_edit as text
%        str2double(get(hObject,'String')) returns contents of prerangeub_edit as a double


% --- Executes during object creation, after setting all properties.
function prerangeub_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prerangeub_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function postrangelb_edit_Callback(hObject, eventdata, handles)
% hObject    handle to postrangelb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of postrangelb_edit as text
%        str2double(get(hObject,'String')) returns contents of postrangelb_edit as a double


% --- Executes during object creation, after setting all properties.
function postrangelb_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to postrangelb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function postrangeub_edit_Callback(hObject, eventdata, handles)
% hObject    handle to postrangeub_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of postrangeub_edit as text
%        str2double(get(hObject,'String')) returns contents of postrangeub_edit as a double


% --- Executes during object creation, after setting all properties.
function postrangeub_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to postrangeub_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function threshold_edit_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of threshold_edit as text
%        str2double(get(hObject,'String')) returns contents of threshold_edit as a double


% --- Executes on button press in average_radiobutton.
function average_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to average_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of average_radiobutton


% --- Executes on button press in minrange_radiobutton.
function minrange_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to minrange_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minrange_radiobutton



function minrange_edit_Callback(hObject, eventdata, handles)
% hObject    handle to minrange_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minrange_edit as text
%        str2double(get(hObject,'String')) returns contents of minrange_edit as a double


% --- Executes during object creation, after setting all properties.
function minrange_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minrange_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function threshold_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Mzdisp_radiobutton.
function Mzdisp_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to Mzdisp_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Mzdisp_radiobutton


% --- Executes on button press in MzM0disp_radiobutton.
function MzM0disp_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to MzM0disp_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MzM0disp_radiobutton


% --- Executes on button press in MTRdisp_radiobutton.
function MTRdisp_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to MTRdisp_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MTRdisp_radiobutton


% --- Executes on button press in CESThistogram_radiobutton.
function CESThistogram_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to CESThistogram_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CESThistogram_radiobutton


% --- Executes on button press in sigenhanc_radiobutton.
function sigenhanc_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to sigenhanc_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigenhanc_radiobutton


function posttimepoints_edit_Callback(hObject, eventdata, handles)
% hObject    handle to posttimepoints_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posttimepoints_edit as text
%        str2double(get(hObject,'String')) returns contents of posttimepoints_edit as a double


% --- Executes during object creation, after setting all properties.
function posttimepoints_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posttimepoints_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in sam_pushbutton.
function sam_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sam_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

e=evalin('base','who');

if ismember('CESTdata', e)
handles.CESTdata = evalin('base','CESTdata');
end

if ismember('ROIdef_full', e)
 handles.ROIdef_full = evalin('base','ROIdef_full');
end

if ismember('Mask_full', e)
 handles.Mask_full = evalin('base','Mask_full');
end



pre_lb = str2double(get(handles.prerangelb_edit,'string'));
pre_ub = str2double(get(handles.prerangeub_edit,'string'));
post_lb = str2double(get(handles.postrangelb_edit,'string'));
post_ub = str2double(get(handles.postrangeub_edit,'string'));
minrange = str2double(get(handles.minrange_edit,'string'));

average_val = get(handles.average_radiobutton,'value');
minrange_val = get(handles.minrange_radiobutton,'value');

threshold = str2double(get(handles.threshold_edit,'string'));

sigenhanc_val = get(handles.sigenhanc_radiobutton, 'value');
Mzdisp_val = get(handles.Mzdisp_radiobutton,'value');
MzM0disp_val = get(handles.MzM0disp_radiobutton,'value');
MTRdisp_val = get(handles.MTRdisp_radiobutton,'value');
CESThistogramdisp_val = get(handles.CESThistogram_radiobutton,'value');

% Average multiple offfsets to obtain offset1 and offset2 for the
% ratiometric analysis 
for ke = 1:2
    try
        Mz_stack = handles.CESTdata(ke).Mz_stack_mocorr_sort_full;
    catch
        Mz_stack = handles.CESTdata(ke).Mz_stack_norm;
    end

    if size(handles.CESTdata(2).diffoffsets, 2) > 3
        handles.CESTdata = averageMOffsets(handles.CESTdata, Mz_stack, ke);
    else
        handles.CESTdata(ke).Mz_offset1 = handles.CESTdata(ke).Mz_stack_mocorr(1).OffsetStack;  
        handles.CESTdata(ke).Mz_offset2 = handles.CESTdata(ke).Mz_stack_mocorr(2).OffsetStack;  
    end
end

 Mpre_offset1 = handles.CESTdata(1).Mz_offset1;
 Mpre_offset2 = handles.CESTdata(1).Mz_offset2;
 
%  Mpost_offset1 = handles.CESTdata(2).Mz_offset1;
%  Mpost_offset2 = handles.CESTdata(2).Mz_offset2;
 

% Calculate average pre-injection image
mean_Mpre_offset1 = mean(Mpre_offset1(:, :, :, (pre_lb-handles.CESTdata(1).M0start_no):(pre_ub-handles.CESTdata(1).M0start_no)), 4);
mean_Mpre_offset2 = mean(Mpre_offset2(:, :, :, (pre_lb-handles.CESTdata(1).M0start_no):(pre_ub-handles.CESTdata(1).M0start_no)), 4);

% Get the post-injection images in the specified range
Mpost_offset1 = handles.CESTdata(2).Mz_offset1(:, :, :, (post_lb-handles.CESTdata(2).M0start_no):(post_ub-handles.CESTdata(2).M0start_no));
Mpost_offset2 = handles.CESTdata(2).Mz_offset2(:, :, :, (post_lb-handles.CESTdata(2).M0start_no):(post_ub-handles.CESTdata(2).M0start_no));



% Dynamic signal enhancement analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate relative signal (pre-post) and percentage signal enhancement
% (PSE)
 for i = 1:size(Mpost_offset1, 4)
     
    diff_offset1(:, :, :, i) = mean_Mpre_offset1 -Mpost_offset1(:, :, :, i);  % relative signal at offset 1
    diff_offset2(:, :, :, i) = mean_Mpre_offset2- Mpost_offset2(:, :, :, i);  % relative signal at offset 2
    
    SE_offset1(:, :, :, i) = 100.*diff_offset1(:, :, :, i)./(mean_Mpre_offset1); % normalized relative signal at offset 1
    SE_offset2(:, :, :, i) = 100.*diff_offset2(:, :, :, i)./(mean_Mpre_offset2); % normalized relative signal at offset 2

 end

 for sl = 1:handles.CESTdata(1).stack_dim (3)
    for kx = 1:handles.CESTdata(1).stack_dim(1)
        for ky = 1:handles.CESTdata(1).stack_dim(2)
            if (max(SE_offset1(kx, ky, sl, :)) < threshold/100) == 1
                SE_offset1(kx, ky, sl, :) =  NaN;
            end
            
            if (max(SE_offset2(kx, ky, sl, :)) < threshold/100) == 1
                SE_offset2(kx, ky, sl, :) =  NaN;
            end
            
        end
    end
 end
 

ROINaN  = double(handles.ROIdef_full); % Replace zeros with NaNs in ROIdef_full
ROINaN(ROINaN==0) = NaN;

MaskNaN = double(handles.Mask_full);
MaskNaN(MaskNaN==0) = NaN;


time_vector = round(2*handles.CESTdata(2).TR/1000.*(1:(post_ub-post_lb+1))); % calculate time vector 


 for i = 1 : size(handles.ROIdef_full, 3)    
    diff_offset1_roi(i, :) = mean(diff_offset1.*ROINaN(:, :, i), [1 2], 'omitnan' );
    diff_offset2_roi(i, :) = mean(diff_offset2.*ROINaN(:, :, i), [1 2], 'omitnan');

    SE_offset1_roi(i, :) = mean(SE_offset1.*ROINaN(:, :, i), [1 2], 'omitnan');
    SE_offset2_roi(i, :) = mean(SE_offset2.*ROINaN(:, :, i), [1 2 ], 'omitnan');
 end
 
 if sigenhanc_val == 1
 
      for i = 1 : size(handles.ROIdef_full, 3)  
        figure(102);
        CT = cbrewer('qual', 'Paired', 9);
        
        % Plot the signal enhancement curves at offset 1
        set(gcf,'Name','Signal Enhancement at Offset 1', 'NumberTitle','off')
        plot(time_vector, SE_offset1_roi(i, :), 'Color', [CT(i+2,:)], 'LineWidth', 2);
        hold on;
        grid on;
        title([sprintf('Signal Enhancement at %.1f ppm', handles.CESTdata(2).diffoffsets(1)./handles.CESTdata(2).B0_MHz)]);
        ylabel('Signal Enhancement %')
        xlabel('Time after injection [sec]')
        legend('Signal, ROI#1', 'Signal, ROI#2');

        % Plot the signal enhancement curves at offset 2   
        figure(103);
        set(gcf,'Name','Signal Enhancement at Offset 2', 'NumberTitle','off')
        plot(time_vector, SE_offset2_roi(i, :),  'Color', [CT(i+2,:)], 'LineWidth', 2);
        hold on;
        grid on;
        title([sprintf('Signal Enhancement at %.1f ppm', handles.CESTdata(2).diffoffsets(2)./handles.CESTdata(2).B0_MHz)]);
        ylabel('Signal Enhancement %')
        xlabel('Time after injection [sec]')
        legend('Signal, ROI#1', 'Signal, ROI#2');
    end
end


if exist('time_vector', 'var')
 assignin('base', 'time_vector', time_vector);
end
if exist('SE_offset1_roi', 'var')
 assignin('base', 'SE_offset1_roi', SE_offset1_roi);
end


% CEST analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 Mpost_offset1 = handles.CESTdata(2).Mz_offset1(:, :, :, (post_lb-handles.CESTdata(2).M0start_no):(post_ub-handles.CESTdata(2).M0start_no));
 Mpost_offset2 = handles.CESTdata(2).Mz_offset2(:, :, :, (post_lb-handles.CESTdata(2).M0start_no):(post_ub-handles.CESTdata(2).M0start_no));


%if (post_lb > handles.CESTdata(2).M0start_no - 1 && post_ub < size(diff_offset1, 4) + handles.CESTdata(2).M0start_no)

 if average_val == 1 % average the images in the specified post-injection range
    mean_Mpost_offset1 = mean(Mpost_offset1, 4);
    mean_Mpost_offset2 = mean(Mpost_offset2, 4);
 else % find a minimum in the specified post-injection range and average the images in the chosen min range
    for sl = 1:handles.CESTdata(1).stack_dim (3)
       for  i = 1 : size(handles.ROIdef_full, 1)
           for  j = 1 : size(handles.ROIdef_full, 1)
                [PER_offset1(i, j), min_Mpre_offset1_ind(i, j)]  = min(Mpost_offset1(i, j, sl, :), [], 4);
                [PER_offset2(i, j), min_Mpre_offset2_ind(i, j)]  = min(Mpost_offset2(i, j, sl, :), [], 4);
                mean_Mpost_offset1(i, j, sl) =  mean(handles.CESTdata(2).Mz_offset1(i, j, sl, post_lb-handles.CESTdata(2).M0start_no + min_Mpre_offset1_ind(i, j, sl) - 1 - minrange: post_lb-handles.CESTdata(2).M0start_no + min_Mpre_offset1_ind(i, j, sl) - 1 + minrange), 4);
                mean_Mpost_offset2(i, j, sl) =  mean(handles.CESTdata(2).Mz_offset2(i, j, sl, post_lb-handles.CESTdata(2).M0start_no + min_Mpre_offset2_ind(i, j, sl)-1 - minrange: post_lb-handles.CESTdata(2).M0start_no +min_Mpre_offset2_ind(i, j, sl) -1 + minrange), 4);

           end
       end
     end
 end



% Get difference in Mz
mean_diff_offset1 = (mean_Mpre_offset1 - mean_Mpost_offset1).*MaskNaN;
mean_diff_offset2 = (mean_Mpre_offset2 - mean_Mpost_offset2).*MaskNaN;

% Get Mz/M0
mean_norm_offset_post1 = (mean_Mpost_offset1./handles.CESTdata(2).M0norm_post).*MaskNaN;
mean_norm_offset_post2 = (mean_Mpost_offset2./handles.CESTdata(2).M0norm_post).*MaskNaN;

mean_norm_offset_pre1 = (mean_Mpre_offset1./handles.CESTdata(1).M0norm_pre).*MaskNaN;
mean_norm_offset_pre2 = (mean_Mpre_offset2./handles.CESTdata(1).M0norm_pre).*MaskNaN;


mean_norm_offset1 = mean_norm_offset_post1; 
mean_norm_offset2 = mean_norm_offset_post2; 
 
% MTR difference
mean_MTR_offset1 = (1 - mean_norm_offset_post1) - (1 - mean_norm_offset_pre1);
mean_MTR_offset2 = (1 - mean_norm_offset_post2) - (1 - mean_norm_offset_pre2);


mean_MTR_offset1(mean_MTR_offset1<0) = NaN;
mean_MTR_offset2(mean_MTR_offset2<0) = NaN;


% Find minimal and maximal contrast
for sl = 1:handles.CESTdata(1).stack_dim(3)
    max_offset1(sl) = max(mean_diff_offset1(:, :, sl),[],'all', 'omitnan');
    max_offset2(sl) = max(mean_diff_offset2(:, :, sl),[],'all', 'omitnan');
    
    min_offset1(sl) = min(mean_diff_offset1(:, :, sl),[],'all', 'omitnan');
    min_offset2(sl) = min(mean_diff_offset2(:, :, sl),[],'all', 'omitnan');
   
    minmax_offset12(sl) = min(max_offset1(sl), max_offset2(sl));
end


handles.Mask_full_threshold = handles.Mask_full;
handles.ROIdef_full_threshold = handles.ROIdef_full;

% Select pixels above defined threshold
for sl = 1:handles.CESTdata(1).stack_dim (3)

for kx = 1:handles.CESTdata(1).stack_dim(1)
    for ky = 1:handles.CESTdata(1).stack_dim(2)
        if (mean_diff_offset1(kx, ky, sl) > threshold/100*minmax_offset12(sl)) == 1 && (mean_diff_offset2(kx, ky, sl) > threshold/100*minmax_offset12(sl)) == 1
        handles.Mask_full_threshold(kx, ky, sl) =  1;
        end
    end
end
    
    for j = 1:size(handles.ROIdef_full, 4)
        handles.ROIdef_full_threshold(:, :, sl, j) = double(handles.ROIdef_full(:, :, sl, j)).*double(handles.Mask_full_threshold(:, :, sl));
    end
   
end


if Mzdisp_val == 1
    Disp_map_offset1 = mean_diff_offset1.*double(handles.Mask_full_threshold);
    Disp_map_offset2 = mean_diff_offset2.*double(handles.Mask_full_threshold);   
    max_lim = max(max(Disp_map_offset1,[],'all'), max(Disp_map_offset2,[],'all'));
    min_lim = min(min(Disp_map_offset1,[],'all'), min(Disp_map_offset2,[],'all'));
    clabel = 'Mz';
    figure('Name','Mz images','NumberTitle','off');
    createPlots(Disp_map_offset1, Disp_map_offset2, handles.CESTdata, min_lim, max_lim, clabel);
end

if MzM0disp_val == 1
    Disp_map_offset1 = mean_norm_offset1.*double(handles.Mask_full_threshold);
    Disp_map_offset2 = mean_norm_offset2.*double(handles.Mask_full_threshold);  
    max_lim = max(max(Disp_map_offset1,[],'all'), max(Disp_map_offset2,[],'all'));
    min_lim = min(min(Disp_map_offset1,[],'all'), min(Disp_map_offset2,[],'all'));
    clabel = 'Mz/M0';
    figure('Name','Mz/M0 images','NumberTitle','off');
    createPlots(Disp_map_offset1, Disp_map_offset2, handles.CESTdata, min_lim, max_lim, clabel);
end    
    
if MTRdisp_val == 1
    Disp_map_offset1 = mean_MTR_offset1.*double(handles.Mask_full_threshold);
    Disp_map_offset2 = mean_MTR_offset2.*double(handles.Mask_full_threshold);  
    max_lim = max(max(Disp_map_offset1,[],'all'), max(Disp_map_offset2,[],'all'));
    min_lim = min(min(Disp_map_offset1,[],'all'), min(Disp_map_offset2,[],'all'));
    clabel = 'MTR';
    figure('Name','MTR images','NumberTitle','off');
    createPlots(Disp_map_offset1, Disp_map_offset2, handles.CESTdata, min_lim, max_lim, clabel);
end

if CESThistogramdisp_val == 1
    Disp_map_offset1 = 100.*mean_norm_offset1.*double(handles.Mask_full_threshold);
    Disp_map_offset2 = 100.*mean_norm_offset2.*double(handles.Mask_full_threshold);   
    max_lim = max(max(Disp_map_offset1,[],'all'), max(Disp_map_offset2,[],'all'));
    min_lim = min(min(Disp_map_offset1,[],'all'), min(Disp_map_offset2,[],'all'));
 
    % Plot contrast histograms
    figure('Name','Contrast histogram, Offset 1','NumberTitle','off');

    for sl = 1:handles.CESTdata(1).stack_dim(3)
        for nr = 1:size(handles.ROIdef_full_threshold, 4)
            Contrast1_roi = Disp_map_offset1(:, :, sl).*handles.ROIdef_full_threshold(:, :, sl, nr);
             Contrast1_roi(Contrast1_roi == 0) = NaN;
            if handles.CESTdata(1).stack_dim(3) == 1
                subplot(1, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            else
                subplot(2, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            end
            histogram(Contrast1_roi(~isnan(Contrast1_roi)), 20, 'BinWidth', 2, 'BinLimits', [min_lim max_lim], 'Normalization', 'probability')
            ylim([0 0.45])
            ytix = get(gca, 'YTick');
            set(gca, 'YTick',ytix, 'YTickLabel', ytix*100,  'FontSize', 16, 'LineWidth', 2, 'XLimitMethod', 'tight', 'YLimitMethod','tight');
            title(sprintf('Slice %d', sl));
            xlabel('Contrast %');
            ylabel('% of Pixels');
            leg{nr} = sprintf('ROI#%i', nr);
            hold on;
        end
        legend(leg, 'Location', 'northeast');
    end

    figure('Name','Contrast histogram, Offset 2','NumberTitle','off');
    for sl = 1:handles.CESTdata(1).stack_dim(3)
        for nr = 1:size(handles.ROIdef_full_threshold, 4)
            Contrast2_roi = Disp_map_offset2(:, :, sl).*handles.ROIdef_full_threshold(:, :, sl, nr); 
            Contrast2_roi( Contrast1_roi == 0) = NaN;
            if handles.CESTdata(1).stack_dim(3) == 1
                subplot(1, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            else
                subplot(2, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            end
            histogram(Contrast2_roi(~isnan(Contrast2_roi)), 20, 'BinWidth', 2, 'BinLimits', [min_lim max_lim], 'Normalization', 'probability')
            ylim([0 0.45])
            ytix = get(gca, 'YTick');
            set(gca, 'YTick',ytix, 'YTickLabel', ytix*100,  'FontSize', 16, 'LineWidth', 2, 'XLimitMethod', 'tight', 'YLimitMethod','tight');
            title(sprintf('Slice %d', sl));
            xlabel('Contrast %');
            ylabel('% of Pixels');
            leg{nr} = sprintf('ROI#%i', nr);
            hold on;
        end
           legend(leg, 'Location', 'northeast');
    end

end
 
    handles.CESTresults.mean_diff_offset1 = mean_diff_offset1.*double(handles.Mask_full_threshold);
    handles.CESTresults.mean_diff_offset2 = mean_diff_offset2.*double(handles.Mask_full_threshold); 

     handles.CESTresults.mean_norm_offset_pre1 = mean_norm_offset_pre1.*double(handles.Mask_full_threshold);
     handles.CESTresults.mean_norm_offset_pre2 = mean_norm_offset_pre2.*double(handles.Mask_full_threshold); 
     handles.CESTresults.mean_norm_offset_post1 = mean_norm_offset_post1.*double(handles.Mask_full_threshold);
     handles.CESTresults.mean_norm_offset_post2 = mean_norm_offset_post2.*double(handles.Mask_full_threshold);      

    handles.CESTresults.mean_MTR_offset1 = mean_MTR_offset1.*double(handles.Mask_full_threshold);
    handles.CESTresults.mean_MTR_offset2 = mean_MTR_offset2.*double(handles.Mask_full_threshold);
   
    handles.CESTresults.ROIdef_full_threshold = double(handles.ROIdef_full_threshold);
    
    CESTdata = handles.CESTdata;
    CESTresults = handles.CESTresults;
    assignin('base', 'CESTdata', CESTdata);
    assignin('base', 'CESTresults', CESTresults);

guidata(hObject, handles);
 

% -------------------------------------------------------------------------
% Calculate pH Maps
% -------------------------------------------------------------------------


% --- Executes on button press in inverseMTR_radiobutton.
function inverseMTR_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to inverseMTR_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of inverseMTR_radiobutton



function p1coeff_edit_Callback(hObject, eventdata, handles)
% hObject    handle to p1coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p1coeff_edit as text
%        str2double(get(hObject,'String')) returns contents of p1coeff_edit as a double


% --- Executes during object creation, after setting all properties.
function p1coeff_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p2coeff_edit_Callback(hObject, eventdata, handles)
% hObject    handle to p2coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p2coeff_edit as text
%        str2double(get(hObject,'String')) returns contents of p2coeff_edit as a double


% --- Executes during object creation, after setting all properties.
function p2coeff_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p3coeff_edit_Callback(hObject, eventdata, handles)
% hObject    handle to p3coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p3coeff_edit as text
%        str2double(get(hObject,'String')) returns contents of p3coeff_edit as a double


% --- Executes during object creation, after setting all properties.
function p3coeff_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p3coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p4coeff_edit_Callback(hObject, eventdata, handles)
% hObject    handle to p4coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p4coeff_edit as text
%        str2double(get(hObject,'String')) returns contents of p4coeff_edit as a double


% --- Executes during object creation, after setting all properties.
function p4coeff_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p4coeff_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MTRratiodisp_radiobutton.
function MTRratiodisp_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to MTRratiodisp_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MTRratiodisp_radiobutton


% --- Executes on button press in pHmapdisp_radiobutton.
function pHmapdisp_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to pHmapdisp_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pHmapdisp_radiobutton


% --- Executes on button press in pHhistogram_radiobutton.
function pHhistogram_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to pHhistogram_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pHhistogram_radiobutton


% --- Executes on button press in pHmap_pushbutton.
function pHmap_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pHmap_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inverseMTR_radiobutton_val = get(handles.inverseMTR_radiobutton, 'value');
MTRratiodisp_radiobutton_val = get(handles.MTRratiodisp_radiobutton, 'value');
pHmapdisp_radiobutton_val = get(handles.pHmapdisp_radiobutton, 'value');
pHhistogram_radiobutton_val = get(handles.pHhistogram_radiobutton, 'value');

mean_MTR_offset1 = handles.CESTresults.mean_MTR_offset1; 
mean_MTR_offset2 = handles.CESTresults.mean_MTR_offset2; 
 

% Calculate the MTR ratio
if inverseMTR_radiobutton_val == 1
  MTRratio_all = ((1 - mean_MTR_offset1).*mean_MTR_offset2)./((1 - mean_MTR_offset2).*mean_MTR_offset1);
   %MTRratio_all = ((1 - mean_MTR_offset2).*mean_MTR_offset1)./((1 - mean_MTR_offset1).*mean_MTR_offset2);
else
  MTRratio_all = mean_MTR_offset2./mean_MTR_offset1;    
   % MTRratio_all = mean_MTR_offset1./mean_MTR_offset2;  
end

MTRratio = MTRratio_all;
 MTRratio(MTRratio_all < 0) = NaN;
 MTRratio(MTRratio_all > 3) = NaN;


% Get the coefficients of the calibration curve
p1 = str2double(get(handles.p1coeff_edit,'string'));
p2 = str2double(get(handles.p2coeff_edit,'string'));
p3 = str2double(get(handles.p3coeff_edit,'string'));
p4 = str2double(get(handles.p4coeff_edit,'string'));

% Calculate the pH maps
if p4 == 0
       pHmap_all =  p1.*MTRratio.^2 + p2.*MTRratio + p3;
elseif (p3 == 0) && (p4 == 0)
    
      pHmap_all  = p1.*log10(MTRratio) + p2;
else
       pHmap_all =  p1.*MTRratio.^3 + p2.*MTRratio.^2 + p3.*MTRratio + p4;
end

pHmap = pHmap_all;
pHmap(pHmap < 5.2) = NaN;
pHmap(pHmap > 7.8) = NaN;



if MTRratiodisp_radiobutton_val == 1
    max_lim = max(MTRratio,[],'all');
    min_lim = min(MTRratio,[],'all');
    clabel = 'MTRratio';
    figure('Name','MTRratio maps','NumberTitle','off');
    createpHmaps(MTRratio, handles.CESTdata, min_lim, max_lim, clabel);
end


% Plot the pH maps   
if pHmapdisp_radiobutton_val == 1
    max_lim = max(pHmap,[],'all');
    min_lim = min(pHmap,[],'all');
    clabel = 'pH';
    figure('Name','pH maps','NumberTitle','off');
    %createpHmaps(pHmap, handles.CESTdata, min_lim, max_lim, clabel);
        createpHmaps(pHmap, handles.CESTdata, 6.5, 7.2, clabel);
end

if pHhistogram_radiobutton_val == 1
    figure('Name','pH histogram','NumberTitle','off');
    % Plot pH histogram
    for sl = 1:handles.CESTdata(1).stack_dim(3)
        for nr = 1:size(handles.ROIdef_full_threshold, 4)
            pHmap_roi = pHmap(:, :, sl).*double(handles.ROIdef_full_threshold(:, :, sl, nr));
             pHmap_roi(pHmap_roi == 0) = NaN;
            if handles.CESTdata(1).stack_dim(3) == 1
                subplot(1, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            else
                subplot(2, round(handles.CESTdata(1).stack_dim(3)/2), sl);
            end
            histogram(pHmap_roi(~isnan(pHmap_roi)), 20, 'BinWidth', 0.05, 'BinLimits', [6.0 7.4], 'Normalization', 'probability')
            ylim([0 0.85])
            ytix = get(gca, 'YTick');
            set(gca, 'YTick',ytix, 'YTickLabel', ytix*100,  'FontSize', 16, 'LineWidth', 2, 'DataAspectRatio', [1 0.33 1], 'XLimitMethod', 'tight', 'YLimitMethod','tight');
            title(sprintf('Slice %d', sl));
            xlabel('pH');
            ylabel('% of Pixels');
            leg{nr} = sprintf('ROI#%i', nr);
            hold on;
            
            pHmean(nr) = nanmean2(nonzeros(pHmap_roi));
            pHmedian(nr) = nanmedian2(nonzeros(pHmap_roi));
            pHstd(nr) = nanstd2(pHmap_roi);
        end
            legend(leg, 'Location', 'northeast');
    end
end

handles.CESTresults.pHmap = pHmap;
handles.CESTresults.pHmean = pHmean;
handles.CESTresults.pHmedian = pHmedian;
handles.CESTresults.pHstd = pHstd;
handles.CESTresults.MTRratio = MTRratio;

CESTresults = handles.CESTresults;
assignin('base', 'CESTresults', CESTresults);

guidata(hObject, handles);




% --- Executes on button press in loaddata_pushbutton.
function loaddata_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loaddata_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in savedata_pushbutton.
function savedata_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to savedata_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Save results
[filepath, name, ~] = fileparts(handles.exp_path);
filenm = sprintf('%s_%s.mat', name, datestr(now, 'mm_dd_yy'));
%save(filenm);
evalin('base', ['save(''', filenm ''')']);
movefile(filenm, handles.exp_path);
disp('Data saved succesfully')


% --- Executes on button press in clearall_pushbutton.
function clearall_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearall_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base', 'clear all');
evalin('base', 'clc');
close ratioCEST_gui;
ratioCEST_gui;

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
