function [ChkOk, C] = Check_Channel(headers, data, X)
%-------------------------------------------------------------------------
% Check_Channel = Checks if channel exists in given cell array and 
% if exists, returns its corresponding data from the given data array.
%-------------------------------------------------------------------------
% Inputs:
% - headers      : cell array with channels names and units.
% - data         : matrix of data.
% - X            : channel name to be searched [char]
%
% Output:
% - C       : requested metric [data array]
% - ChkOk   : Boolean, returns 1 if B and b created successfully and vice versa.
%
%--------------------------------------------------------------------------
% Calling Syntax:
%    [ChkOk, C] = Check_Channel(headers, data, X)        
%--------------------------------------------------------------------------
    % default value (in case of errors).
    C       = []; 
    ChkOk   = 0; 
    
    % Check input parameters:
    if nargin<1 || ~iscell(headers),  headers = [];           end
    if nargin<2 || ~isnumeric(data),  data    = [];           end
    if nargin<3,                      X       = [];           end
    if ~ischar(X) && isstring(X),     X       = char(X);      end %force char.   
    if ~ischar(X),                    X       = [];           end 
    
    % Search Channel
    if ~isempty(headers) && ~isempty(X)
        
        for i=1:length(headers)

            index = find([headers{:}] == X);
            
            if index > 0
                C = data(index,:);
                ChkOk = 1;
            end
        end
    end 
end
