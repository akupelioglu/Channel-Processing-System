function [ChkOk, Y] = function1(m, X,c)
%-------------------------------------------------------------------------
% function1 = Calculates the channel Y using the equation Y = mx + c
%-------------------------------------------------------------------------

% Inputs:
% - m       : parameter [scalar]
% - X       : channel [data array]
% - c       : parameter [scalar]
% 
% Outputs:
% - Y       : channel [data array]
% - ChkOk   : returns 1 if channel Y created successfully and vice versa.
%
%-------------------------------------------------------------------------
% Calling Syntax:
%    function1(m, X,c)          
%-------------------------------------------------------------------------

    Y       = []; % default value (in case of errors).
    ChkOk   = 0;  % default value (in case of errors).
    
    % Check input parameters:
    if nargin<1,  m = [];  end
    if nargin<2,  X = [];  end
    if nargin<3,  c = [];  end
    if ~isnumeric(m), m = []; end
    if ~isnumeric(X), X = []; end
    if ~isnumeric(c), c = []; end
    
    % Calculate channel Y:
    if ~isempty(m) && ~isempty(X) && ~isempty(c) 
        
        Y = m.*X + c;
        ChkOk = 1;
        
    end
end
