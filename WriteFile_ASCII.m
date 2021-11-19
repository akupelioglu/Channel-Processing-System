function [ChkOk] = WriteFile_ASCII(boolUserInput,DataArray,FileName,FileExt,colsdelim,decsdelim,ndecs)
%-------------------------------------------------------------------------
% WriteFile_ASCII: to write an ASCII file with a channels structure data.
%
% Inputs:
% - DataArray    : Channel or Parametric array with data to be exported: names, units and values.
% - FileName     : absolute or relative file path.
% - FileExt      : file format extension.
% - colsdelim    : columns delimiter in ascii file (defaults to tab).
% - decsdelim    : decimals separator in ascii file (defaults to point).
% - ndecs        : number of digits after floating point (defaults is 15).
%
% Outputs:
% - ChkOk        : logical indicator of success/failure of operation.
%-------------------------------------------------------------------------
% Syntax: [ChkOk,nFiles] = WriteFile_ASCII(<true/false>,DataArray,FileName);
%         [ChkOk,nFiles] = WriteFile_ASCII(<true/false>,DataArray,FileName,FileExt);
%         [ChkOk,nFiles] = WriteFile_ASCII(<true/false>,DataArray,FileName,FileExt,colsdelim);
%         [ChkOk,nFiles] = WriteFile_ASCII(<true/false>,DataArray,FileName,colsdelim,decsdelim);
%         [ChkOk,nFiles] = WriteFile_ASCII(<true/false>,DataArray,FileName,colsdelim,decsdelim,ndecs);
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
ChkOk  = false; % default values (in case of errors).

% Check input parameters: % default values (in case of errors)
if nargin<1, boolUserInput = false        ;end
if nargin<2, DataArray     = {}           ;end
if nargin<3, FileName      = ''           ;end
if nargin<4, FileExt       = ''           ;end
if nargin<5, colsdelim     = ','          ;end
if nargin<6, decsdelim     = '.'          ;end
if nargin<7, ndecs         = 0            ;end

if ~islogical(boolUserInput), boolUserInput = false;end % force boolean value.
if isstring(FileName),                        FileName = char(FileName);end
if isempty (FileName) || ~ischar(FileName),   colsdelim = ','          ;end
if isempty(FileExt)   || ~ischar(FileExt),    FileExt   = ''           ;end
if isempty(colsdelim) || ~ischar(colsdelim),  colsdelim = ','          ;end
if isempty(decsdelim) || ~ischar(decsdelim),  decsdelim = '.'          ;end
if isempty(ndecs)     || ~isnumeric(ndecs) ,  ndecs     = 15           ;end
if isempty(ndecs),                            ndecs = round(ndecs)     ;end
if strcmp(colsdelim,'\tab'),                  colsdelim = '\t'         ;end
if isstring(FileExt),                         FileExt   =char(FileExt) ;end
if colsdelim == decsdelim,                    decsdelim = '.'          ;end
if colsdelim == decsdelim,  colsdelim = ',';  decsdelim = '.'          ;end
if ndecs     <  0,                            ndecs     = 15           ;end
%% -------------------------------------------------------------------
% Check data to export format and get file name/s to generate:
%---------------------------------------------------------------------
% Detect Channel/Parametric structure in DataChannels:
if iscell(DataArray) && ~isempty(DataArray) %Make sure it has at least one valid element.
    if ~isempty(FileName)
        
        if isempty(FileExt)
            [FilePath,FileName,FileExt] = fileparts(FileName);
            if isempty(FilePath), FilePath = pwd;    end %Get the path to the current folder.
            if isempty(FileExt),  FileExt  = '.txt'; end
            if boolUserInput, warning('No File Extension specified: default .txt format assigned'); end
            FileName = {[FilePath '\' FileName FileExt]};
            
        elseif ~isempty(FileExt)
            [FilePath,FileName,~] = fileparts(FileName);
            if isempty(FilePath), FilePath = pwd; end %Get the path to the current folder.
            FileName = {[FilePath '\' FileName FileExt]};
        end
    else
        FilePath = pwd; %Get the path to the current folder.
        if isempty(FileExt) || ~strcmp(FileExt, '.*'), FileExt = '.txt'; end
        FileName = {[FilePath '\' char(datetime('now','format','s-MS'))  FileExt]};  %Use specific data and time as FileName
        FileName = strrep(FileName,'-','_');
    end
    ChkOk = true;
end
if ~ChkOk, FileName = '';end
status = -1; %default output in case of errors.

if ChkOk
    ChkOk = false; %#ok<NASGU>
    % -------------------------------------------------------------------
    % Generate ASCII file/s:
    %---------------------------------------------------------------------
    %% ---------------------------------------------------------------
    % Check output file/s:
    %-----------------------------------------------------------------
    [ChkOk, FilePath, FileName] = Chk_OutputFile(0,char(FileName),'');
    FileName = [FilePath FileName];
    
    if ChkOk
        ChkOk = false;
        %% -----------------------------------------------------------
        % Create file:
        %-------------------------------------------------------------
        fileID = fopen(FileName,'w');
        
        if fileID>=3  %MATLAB returns valid file identifier [integer] equal or greater than 3
            %% -----------------------------------------------------------
            % Write channels names and data:
            %-------------------------------------------------------------
            % Get channels names:
            ChnsNames = '';
            nChns = numel(DataArray);              % Number of channels
            for i=1:nChns
                ChnsNames{i} = DataArray{i}.Name;
            end
            
            % Get largest channel length:
            maxLen = 0;
            for i=1:nChns
                maxLen = max(maxLen, LenData(DataArray{i}));
            end
            
            % Get channels data:
            ChnsData = cell(maxLen,nChns);
            ChnsData(:) = {''}; % initialisation
            for c=1:nChns
                Data = DataArray{c}.Data;
                % Fill ChnsData adapting to different channel lengths:
                [~,n] = size(Data);
                for d=1:n
                    ChnsData(d,c) = {Data(d)};
                end
            end
            
            % Write channels data:
            
            for c=1:nChns
                fprintf(fileID,'%s',ChnsNames{c});
                for d=1:maxLen % Write by rows
                    data  = cell2mat(ChnsData(d,c));
                    tdata = '';
                    if isnumeric(data)
                        if ~isnan(data)
                            decs = ndecs;
                            if decs==inf % write all decimals
                                sdata = num2str(data);
                                decs  = numel(sdata)-strfind(sdata,'.');
                                if isempty(decs), decs = 0; end % integer
                            end
                            tdata = sprintf(['%.' sprintf('%d', decs) 'f'],data);
                            if decsdelim~='.', tdata = strrep(tdata,'.',decsdelim);end
                        end
                    else
                        if ~isnan(data)
                            tdata = char(data);
                        end
                    end
                    if ~strcmp(tdata, '')
                        fprintf(fileID,[colsdelim ' %s'],tdata);
                    end
                end
                fprintf(fileID,'\r\n'); % add new line character by row
            end
            %% -----------------------------------------------------------
            % Close file:
            %-------------------------------------------------------------
            status = fclose(fileID);
        end
    end
end

%% -------------------------------------------------------------------
% Check results:
%---------------------------------------------------------------------
if status==0, ChkOk = true; end
if ~ChkOk && boolUserInput
    msgbox(['The export is unsuccessful,' ...
    'please check your inputs:' ...
    ' Channels, Parameters, Metrics'...
    'column delimeter, decimal delimeter and number of digits.']);
elseif ChkOk && boolUserInput
    msgbox(['The ', FileName ' are successfully exported.']);
end
end
