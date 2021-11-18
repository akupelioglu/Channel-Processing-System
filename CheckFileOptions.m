function [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% CheckFileOptions = Checks file options inserted by the user.
%
% Inputs:
% - FileName : absolute or relative file path.
% - colsdelim_    : columns  delimiter in ascii file (defaults to ',').
% - decsdelim_    : decimals delimiter in ascii file (defaults to '.', must be positive).
% - nLinesData_   : number of lines to read in (defaults to inf, must be positive).
% - nLinesOffset_ : number of lines to skip(defaults to 0, must be 0 or positive).
%
% Outputs:
% - ChkOk      : logical indicator of success/failure of operation.
% - options    : validated options [struct]
%-------------------------------------------------------------------------
% Syntax: CheckFileOptions(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
    ChkOk     = false; % default values (in case of errors).
    
    % Check input parameters:
    if nargin<1, colsdelim_     = ','      ;end
    if nargin<2, decsdelim_     = '.'      ;end
    if nargin<3, nLinesData_    = 1.e1000  ;end %set infinity
    if nargin<4, nLinesOffset_  = 0        ;end
    
    ColsDelim = ',';
    DecsDelim = '.';
    nlData    = Inf;
    nlOffset  = 0;
    
    %Validate the selected options, assigns default values if fails
    %colsdelim_
    if ~isempty(colsdelim_)
        if ~ischar(colsdelim_),                                      ColsDelim  = ',';                            end
        if ischar(colsdelim_),                                       ColsDelim  = colsdelim_;                     end
    end
    
    %decsdelim_
    if ~isempty(decsdelim_) 
        if ~ischar(decsdelim_),                                      DecsDelim  = '.';                            end
        if ischar(decsdelim_),                                       DecsDelim  = decsdelim_;                     end
    end
    
    %nLinesData_
    if ~isempty(nLinesData_)
        if ~isnumeric(nLinesData_),                                  nlData = Inf;                                end
        if ischar(nLinesData_) && (str2double(nLinesData_)>0),       nlData = round(str2double(nLinesData_));     end
        if isstring(nLinesData_) && (str2double(nLinesData_)>0),     nlData = round(str2double(nLinesData_));     end
        if isnan(nLinesData_),                                       nlData = inf;                                end
        if isa(nLinesData_, 'double'),                               nlData = round(nLinesData_);                 end
    end
    
    %nLinesOffset_
    if ~isempty(nLinesOffset_)
        if ~isnumeric(nLinesOffset_),                                nlOffset = 0;                                end
        if isnan(nLinesOffset_),                                     nlOffset = 0;                                end
        if isnumeric(nLinesOffset_) && nLinesOffset_>0,              nlOffset = round(nLinesOffset_);             end
        if ischar(nLinesOffset_) && (str2double(nLinesOffset_)>0),   nlOffset = round(str2double(nLinesOffset_)); end
        if isstring(nLinesOffset_) && (str2double(nLinesOffset_)>0), nlOffset = round(str2double(nLinesOffset_)); end
        if isa(nLinesOffset_, 'double'),                             nlOffset = round(nLinesOffset_);             end
    end
    if ischar(ColsDelim) && ischar(DecsDelim) && isnumeric(nlData) && isnumeric(nlOffset), ChkOk = true;          end
    
end