function [ChkOk, m] = Check_parametric(headers, data, b)
%-------------------------------------------------------------------------
% Check_parametric = Checks if metric exists in given headers cell array and 
% if exists, returns its corresponding data from the given data array.
%-------------------------------------------------------------------------
% Inputs:
% - headers      : cell array with channels names and units.
% - data         : matrix of data.
% - b            : parametric  name to be searched [char]
%
% Output:
% - m       : requested parametric [data array]
% - ChkOk   : Boolean, returns 1 if B and b created successfully and vice versa.
%
%-------------------------------------------------------------------------
% Calling Syntax:
%    [ChkOk, C] = Check_parametric(headers, data, b)        
%-------------------------------------------------------------------------

    % default value (in case of errors).
    C       = []; 
    m       = [];
    ChkOk   = 0; 
    
    % Check input parameters:
    if nargin<1 || ~iscell(headers),  headers = [];     end
    if nargin<2 || ~isnumeric(data),  data = [];        end
    if nargin<3,                      b = [];           end
    if ~ischar(b) && isstring(b),     b = char(b);      end %force char.   
    if ~ischar(b),                    b = [];           end 
    
    % Search metric
    if ~isempty(headers) && ~isempty(b)
        
        for i=1:length(headers)
            
            index = find([headers{:}] == b);
            
            if index > 0
                m = data(index,:);
                ChkOk = 1;
            end
        end
    end 
end