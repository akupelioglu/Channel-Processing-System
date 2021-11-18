function [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% Function to read text or csv ASCII files.
%
% Syntax: [ChkOk,headers,data] = ReadFile_ASCII(<true/false>,FileName);
%         [ChkOk,headers,data] = ReadFile_ASCII(<true/false>,FileName,colsdelim);
%         [ChkOk,headers,data] = ReadFile_ASCII(<true/false>,FileName,colsdelim,decsdelim);
%         [ChkOk,headers,data] = ReadFile_ASCII(<true/false>,FileName,colsdelim,decsdelim,nLinesData,nLinesOffset);
%         [ChkOk,headers,data] = ReadFile_ASCII(<true/false>,FileName,colsdelim,decsdelim,nLinesHeader,nLinesData,nLinesOffset);
%
% Inputs:
% - FileName     : absolute or relative file path. [char]
% - colsdelim    : columns  delimiter in ascii file (defaults to comma) [char]
% - decsdelim    : decimals delimiter in ascii file (defaults to .) [char]
% - nLinesData   : number of lines to read in (defaults to inf)
% - nLinesOffset : number of lines to skip(defaults to 0, must be 0 or positive)
%
% Outputs:
% - ChkOk        : logical indicator of success/failure of operation.
% - headers      : cell array with channels names and units.
% - data         : matrix of data in file.
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
% ReadFile_ASCII is a method based on:
% https://es.mathworks.com/matlabcentral/fileexchange/40189-load_ascii
%-------------------------------------------------------------------------
ChkOk   = false;  % default values (in case of errors).
headers = {};
data    = [];

% Check input parameters:
if nargin<1 || ~islogical(boolUserInput),        boolUserInput = false;end
if nargin<2 || ~ischar(FileName),                FileName      = ''   ;end
if nargin<3 || ~ischar(colsdelim_),              colsdelim_     = ',' ;end
if nargin<4 || ~ischar(decsdelim_),              decsdelim_     = '.' ;end
if nargin<5 || ~isnumeric(nLinesData_),     nLinesData_    = 1.e1000  ;end %set infinity
if nargin<6 || ~isnumeric(nLinesOffset_),       nLinesOffset_  = 0    ;end

ASCII_exts = {'.ascii','.asc','.txt','.csv'}; % valid ASCII extensions.
for i=1:length(ASCII_exts)
    ext    = ASCII_exts{i};
    ChkOk  = ChkOk || Chk_InputFile(FileName,ext);
end

[ChkOk,colsdelim,decsdelim,nLinesData,nLinesOffset] = CheckFileOptions(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);

% Read file:
if ChkOk
    ChkOk   = false;
    
    %-----------------------------------------------------------------
    % Extract file characteristics:
    %-----------------------------------------------------------------
    fid     = fopen(FileName);
    if (fid ~= -1) %if manages to open the file
        fline   = strtrim(fgetl(fid)); % first line of file. strtrim() deletes EOL chars.
        
        ncols = count(fline,colsdelim)+1; %Determine the columns number
        nlines  = 1;                   % Determine number of lines (for preallocating memory).
        while ~feof(fid)
            
            fline  = fgetl(fid); %#ok<NASGU>
            nlines = nlines+1;
        end
        fclose(fid);
        
        
        if ~isinf(nLinesData)
            nLinesData = min(nlines-nLinesOffset,nLinesData);
        else
            nLinesData = nlines - nLinesOffset;
        end
        %-----------------------------------------------------------------
        % Read file contents:
        %-----------------------------------------------------------------
        fid = fopen(FileName);
        
        
        % Read data:
        if nLinesData>0
            data = nan([nLinesData ncols-1]);  % preallocate memory.
            headers = cell(nLinesData,1); % preallocate memory.
            headers(:) = {''};
            
            %Skip the Offset lines instructed by the user
            if nLinesOffset>0
                for passline = 1:nLinesOffset
                    fline  = fgetl(fid); %#ok<NASGU> % pass line
                end
            end
            
            i = 1;
            while ~feof(fid) && i<=nLinesData
                fline = strtrim(fgetl(fid)); % strtrim() deletes EOL chars.
                
                % if empty line, pass
                if isempty(fline)
                    i = i +1;
                    headers = headers(1:end-1);
                    data    = data(1:end-1);
                    continue;
                end
                
                % get data as cell array:
                dline = strsplit(char(fline),colsdelim);
                idtxt = cellfun('isclass', dline, 'char');
                dline(idtxt) = strrep(dline(idtxt), ' ', ''); % delete spaces.
                if ~strcmp(decsdelim,'.')
                    dline(idtxt) = strrep(dline(idtxt),decsdelim,'.'); % adapt to matlab decimals delimiter.
                end
                
                
                % convert get data as doubles:
                Tmp_Name = dline{1}; %first element is the channel name
                if isa(Tmp_Name,'char')
                    
                    headers(i)    = dline(1); %#ok<AGROW>
                    dline = dline(2:end); %pass the first value (channel name)
                    nvals = min(ncols,length(dline)); % length may vary due to strtrim() if final columns have no values.
                    
                    for j=1:nvals
                        data(i,j) = str2double(cell2mat(dline(j)));
                    end
                    
                end
                i = i+1;
                ChkOk = true;
            end
            
            fclose(fid);
        end
    end
end

if ~ChkOk && boolUserInput, msgbox('Error in reading ASCII file')      ;end
    
end
