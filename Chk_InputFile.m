function ChkOk = Chk_InputFile(FileName,FileExt)
%-------------------------------------------------------------------------
% Chk_InputFile = Checks an input file.
%
% Inputs:
% - FileName     : absolute or relative file path.
% - FileExt      : character vector of file format [example: 'ASCII']
% 
% Outputs:
% - ChkOk        : logical indicator of success/failure of operation.
% - headers      : cell array with channels names and units.
% - data         : matrix of data in file.
%-------------------------------------------------------------------------
% Syntax:
%    Chk_InputFile(<true/false>,FileName)          : Checks FileName exists.
%    Chk_InputFile(<true/false>,FileName, FileExt) : Also checks FileName has FileExt extension.
%-------------------------------------------------------------------------

    ChkOk = false;
    
    % Check input parameters:
    if nargin<1, FileName      = ''   ;end
    if nargin<2, FileExt       = '.*' ;end
    
    if ~ischar(FileName)  , FileName      = ''   ;end
    if ~ischar(FileExt) || isempty(FileExt), FileExt = '.*';end                 % FileExt invalid will be considered '.*' (any file).
    if ~isempty(FileExt) && ~contains(FileExt,'.'), FileExt = ['.' FileExt];end % FileExt     '*' will be considered '.*'
    if ~isempty(FileExt), FileExt  = ['.' extractAfter(FileExt,'.')];end        % FileExt   '*.*' will be considered '.*'
    
    % Check input file:
    if exist(FileName, 'file')==2
        [File_Path,File_Name,ext] = fileparts(FileName);
        ASCII_exts = {'.ascii','.asc','.txt','.csv'}; % valid ASCII extensions.
        if strcmp(FileExt,'.*') && ismember(ext,ASCII_exts), FileExt = ext; end % No extension specified. FileName's is used.
        if strcmpi(ext,FileExt)
            ChkOk = true;
        end
    end
end