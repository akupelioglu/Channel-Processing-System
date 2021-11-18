function [ChkOk, B, b] = function2(A, Y)
%-------------------------------------------------------------------------
% function2 = Calculates the channel "B" using B = A + Y and metric "b"
% using b = mean(B)
%-------------------------------------------------------------------------
% Syntax:
%    function2(A, Y)         
%-------------------------------------------------------------------------
% Inputs:
% - A       : channel [data array]
% - Y       : channel [data array]
% 
% Output:
% - B       : channel [data array]
% - b       : metric  [scalar]
% - ChkOk   : returns 1 if B and b created successfully and vice versa.
%
%-------------------------------------------------------------------------

    % default value (in case of errors).
    B       = []; 
    b       = []; 
    ChkOk   = 0; 
    
    % Check input parameters:
    if nargin<1 || ~isnumeric(A), A = []; end
    if nargin<2 || ~isnumeric(Y), Y = []; end
    
    % Calculate channel B and metric b
    if ~isempty(A) && ~isempty(Y) && length(A)==length(Y)
        
        B = A + Y;
        b = mean(B);
        ChkOk = 1;
        
    end 

end