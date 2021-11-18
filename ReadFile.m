function [ChkOk,headers,data] = ReadFile(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% ReadFile = Reads a file from different formats into MatLab.
%
% Inputs:
% - FileName : absolute or relative file path.
% - colsdelim_    : columns  delimiter in ascii file (defaults to ',').
% - decsdelim_    : decimals delimiter in ascii file (defaults to '.', must be positive).
% - nLinesData_   : number of lines to read in (defaults to inf, must be positive).
% - nLinesOffset_ : number of lines to skip(defaults to 0, must be 0 or positive).
%
% Outputs:
% - ChkOk    : logical indicator of success/failure of operation.
% - headers  : cell array with channels names and units.
% - data     : matrix/structure of data in file.
%-------------------------------------------------------------------------
% Syntax: ReadFile(<true/false>,FileName);
%         ReadFile(<true/false>,FileName,colsdelim_);
%         ReadFile(<true/false>,FileName,colsdelim_,decsdelim_);
%         ReadFile(<true/false>,FileName,colsdelim_,decsdelim_,nLinesData_);
%         ReadFile(<true/false>,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
    ChkOk   = false; %#ok<NASGU> % default values (in case of errors).
    headers = {};
    data    = [];
    
    % Check input parameters:
    if nargin<1, boolUserInput = false     ;end
    if nargin<2, FileName       = ''       ;end
    if nargin<3, colsdelim_     = ','      ;end
    if nargin<4, decsdelim_     = '.'      ;end
    if nargin<5, nLinesData_    = 1.e1000  ;end %set infinity
    if nargin<6, nLinesOffset_  = 0        ;end
    
    if ~islogical(boolUserInput), boolUserInput = false;end % force boolean value.
    [ChkOk] = Chk_InputFile(FileName,'');

    % Read file:
    if ChkOk
        ChkOk = false; %#ok<NASGU> % Default result.

        [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
        %------------------------------------------------------------------      
        %This code can easily be extended to different file formats
%       [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,ColsDelim,DecsDelim,nlHeader,nlData,nlOffset);
%       [ChkOk,headers,data] = ReadFile_DIAdem_DAT(FileName);
%       [ChkOk,headers,data] = ReadFile_RSP(boolUserInput,FileName);
%       [ChkOk,headers,data] = ReadFile_MTS(boolUserInput,FileName);
%       [ChkOk,headers,data] = ReadFile_ABD(boolUserInput,FileName,ColsDelim,nlHeader,nlOffset);
%       [ChkOk,headers,data] = ReadFile_RES(boolUserInput,FileName);
%       [ChkOk,headers,data] = ReadFile_REQ(boolUserInput,FileName);
%       [ChkOk,headers,data] = ReadFile_KNC(boolUserInput,FileName,ColsDelim,nlHeader,nlOffset);
%       [ChkOk,headers,data] = ReadFile_CM_DAT(boolUserInput,FileName,ColsDelim,nlHeader,nlOffset);
        %------------------------------------------------------------------ 
    end
    
end
