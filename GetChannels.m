function [ChkOk,Chanarray] = GetChannels(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% GetChannels = Reads a file data and converts into channel cell array.
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
% - Chanarray  : cell array with channels names and units.
%-------------------------------------------------------------------------
% Syntax: GetChannels(<true/false>,FileName);
%         GetChannels(<true/false>,FileName,colsdelim_);
%         GetChannels(<true/false>,FileName,colsdelim_,decsdelim_);
%         GetChannels(<true/false>,FileName,colsdelim_,decsdelim_,nLinesData_);
%         GetChannels(<true/false>,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
    ChkOk     = false; %#ok<NASGU> % default values (in case of errors).
    Chanarray = [];
    
    % Check input parameters:
    if nargin<1, boolUserInput = false     ;end
    if nargin<2, FileName       = ''       ;end
    if nargin<3, colsdelim_     = ','      ;end
    if nargin<4, decsdelim_     = '.'      ;end
    if nargin<5, nLinesData_    = 1.e1000  ;end %set infinity
    if nargin<6, nLinesOffset_  = 0        ;end
    if ~islogical(boolUserInput), boolUserInput = false;end % force boolean value.
    
    [ChkOk,headers,data] = ReadFile(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
    if ChkOk
        
        ChkOk = 0;
        nLen = length(headers);
        Chanarray = cell(nLen,1);
        
        %Convert to class Channel format
        for i=1:nLen
            Chanarray{i} =Channel(headers{i},'',headers{i},'',data(i,:),{});
            ChkOk = 1;
        end
    end
    
    
    
end