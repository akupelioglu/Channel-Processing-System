function [ChkOk, C] = function4(X,b)
%-------------------------------------------------------------------------
% function4 = Calculates the channel "C" using C = X + b.
%-------------------------------------------------------------------------
% Syntax:
%    function4(X,b)         
%-------------------------------------------------------------------------
% Inputs:
% - X       : channel [data array]
% - b       : metric  [scalar]
%
% Output:
% - C       : channel [data array]
% - ChkOk   : returns 1 if B and b created successfully and vice versa.
%
%-------------------------------------------------------------------------

    % default value (in case of errors).
    C       = []; 
    ChkOk   = 0; 
    
    % Check input parameters:
    if nargin<1 || ~isnumeric(X), X = []; end
    if nargin<2 || ~isnumeric(b), b = []; end
    % Calculate channel A
    if ~isempty(X) && ~isempty(b)
        
        C = X + b;
        ChkOk = 1;
        
    end 

end