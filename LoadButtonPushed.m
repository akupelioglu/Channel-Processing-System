function [ChkOk,headers, data] = LoadButtonPushed(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
%-------------------------------------------------------------------------
% LoadChanButtonPushed = function for the ButtonPushedFcn callback.
% Selects the file with user interaction and reads the data into the app.
%-------------------------------------------------------------------------
% Calling Syntax:
%    [ChkOk,headers,data] = LoadButtonPushed(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)      
%-------------------------------------------------------------------------
% Inputs:
% - colsdelim_    : columns  delimiter in ascii file (defaults to ',').
% - decsdelim_    : decimals delimiter in ascii file (defaults to '.', must be positive).
% - nLinesData_   : number of lines to read in (defaults to inf, must be positive).
% - nLinesOffset_ : number of lines to skip(defaults to 0, must be 0 or positive).
%
% Output:
% - headers : channel/parameter/metric from the selected file [data array]
% - data    : data from the selected file [data array]
% - ChkOk   : Boolean, returns 1 if headers and data created successfully 
%             and vice versa.
%-------------------------------------------------------------------------
    % default value (in case of errors).
    ChkOk     = 0;
    
    [file,FileExt] = uigetfile({'*';'.ascii';'.asc';'.txt';'.csv'},...
        'Select One or More Files', ...
        'MultiSelect', 'on');
    
    % Check input parameters:
    if ~isempty(file)
        file = {file};
        ChkOk = 1;
    end
    
    if ChkOk 
        ChkOk = 0;
        
        %Read 
        if ~isempty(file) && iscell(file)
            for i=1:length(file)
                [ChkOk,headers,data] = ReadFile(0,file{i},colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
                
            end
        end
    end
end