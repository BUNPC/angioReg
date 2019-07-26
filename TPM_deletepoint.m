function TPM_deletepoint(idx)

global Data
if get(Data.handles.radiobutton_removePoint,'Value')
    answer = questdlg(['Do you want to delete ' num2str(idx) ' point?']);
    if strcmp(answer,'Yes')
        Data.TPMpoints(idx,:) = [];
        if isfield(Data,'OCTpoints')
            if size(Data.OCTpoints,1) >=idx
                Data.OCTpoints(idx,:) = [];
            end
        end
        handles = Data.handles;
        hObject = Data.hObject;
        eventdata = Data.eventdata;
        RegisterTPMandOCT('draw',hObject,eventdata,handles);
    end
end