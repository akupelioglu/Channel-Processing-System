function [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(boolUserInput,FileName,FileExt)
%-------------------------------------------------------------------------
% Chk_OutputFile = Checks an output file.
%-------------------------------------------------------------------------
% Inputs:
% - FileName     : absolute or relative file path.
% - FileExt      : file format extension.
%
% Outputs:
% - ChkOk        : logical indicator of success/failure of operation.
% - FileDefPath  : logical indicator of success/failure of operation.
% - FileDefName  : logical indicator of success/failure of operation.
%
% Syntax:
%    Chk_OutputFile(<true/false>,FileName)          : Checks FileName exists and asks for overwriting.
%    Chk_OutputFile(<true/false>,FileName, FileExt) : Also forces FileName to have FileExt extension.
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
    ChkOk = false; %#ok<NASGU> % Default result.
    
    % Check input parameters:
    if nargin<1, boolUserInput = false;end
    if nargin<2, FileName      = ''   ;end
    if nargin<3, FileExt       = '.*' ;end
    
    if ~islogical(boolUserInput), boolUserInput = false;end                     % force boolean value.
    if ~ischar(FileName)        , FileName      = ''   ;end
    if ~ischar(FileExt) || isempty(FileExt)       , FileExt = '.*';end          % FileExt invalid will be considered '.*' (any file).
    if ~isempty(FileExt) && ~contains(FileExt,'.'), FileExt = ['.' FileExt];end % FileExt     '*' will be considered '.*'
    if ~isempty(FileExt), FileExt  = ['.' extractAfter(FileExt,'.')];end        % FileExt   '*.*' will be considered '.*'
    
    % Force file to a specific extension (if specified):
    [FileDefPath,name,ext] = fileparts(FileName);
    if strcmp(FileExt,'.*'), FileExt = ext; end % No extension specified. FileName's is used.
    FileDefName = [name FileExt];
    
    % Check output path:
    % - if file exists, get its absolute path:
    if exist([FileDefPath FileDefName], 'file')==2
        fid = fopen([FileDefPath '/' FileDefName]); % open file for reading
        if fid>0
            FileFullName = fopen(fid);          % gets fid info -> [filename,permission,machinefmt,encodingOut] = fopen(fileID)
            FileDefPath  = dir(FileFullName);   % dir() only works with absolute paths.
            FileDefPath  = FileDefPath.folder;
            fclose(fid);
        end
    end
    % - if file path does not exist, try to create it. Also, end path with '\':
    [ChkOk, FileDefPath] = Chk_Path(boolUserInput,FileDefPath,true);
    
    % Check output file:
    if ChkOk
        ChkOk = false;
        
        if exist([FileDefPath FileDefName], 'file')==2 && boolUserInput
            dlgTitle    = 'Overwrite?';
            dlgQuestion = 'File with same name exist. Do you want to overwrite?';
            choice = questdlg(dlgQuestion,dlgTitle,'Yes','No', 'Yes');
%             MsgAns = msgbox('YESNO','OVERWRITE',[FileDefPath FileDefName]);
            if strcmpi(choice,'yes')
                delete([FileDefPath FileDefName]);
                ChkOk = true;
            end
        else
            ChkOk = true;
        end
    end
end