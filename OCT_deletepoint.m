function OCT_deletepoint(idx)

global Data
if get(Data.handles.radiobutton_removePoint,'Value')
    answer = questdlg(['Do you want to delete ' num2str(idx) ' point?']);
    if strcmp(answer,'Yes')
        Data.OCTpoints(idx,:) = [];
        if isfield(Data,'TPMpoints')
            if size(Data.TPMpoints,1) >=idx
                Data.TPMpoints(idx,:) = [];
            end
        end
        handles = Data.handles;
        hObject = Data.hObject;
        eventdata = Data.eventdata;
        angioReg('draw',hObject,eventdata,handles);
    end
end