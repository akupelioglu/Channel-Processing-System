function [ChkOk, A] = function3(X)
%-------------------------------------------------------------------------
% function3 = Calculates the channel "A" using A = 1 ./ X.
%-------------------------------------------------------------------------
% Syntax:
%    function3(X)         
%-------------------------------------------------------------------------
% Inputs:
% - X       : channel [data array]
% 
% Output:
% - A       : channel [data array]
% - ChkOk   : returns 1 if B and b created successfully and vice versa.
%
%-------------------------------------------------------------------------

    % default value (in case of errors).
    A       = []; 
    ChkOk   = 0; 
    
    % Check input parameters:
    if nargin<1 || ~isnumeric(X), X = []; end
    
    % Calculate channel A
    if ~isempty(X) 
        
        A = 1 ./ X;
        ChkOk = 1;
        
    end 

end