function [ChkOk, Path] = Chk_Path(boolUserInput,Path,boolTryCreate)
%-------------------------------------------------------------------------
% Chk_Path = Checks a path.
%-------------------------------------------------------------------------
% Inputs:
% - Path            : Channel or Parametric array with data to be exported: names, units and values.
% - boolTryCreate   : absolute or relative file path.
%
% Outputs:
% - ChkOk           : logical indicator of success/failure of operation.
% - Path            : logical indicator of success/failure of operation.
%-------------------------------------------------------------------------
% Syntax:
%    Chk_Path(<true/false>,Path)      : Checks Path exists.
%    Chk_Path(<true/false>,Path,true) : Checks Path exists. If not, tries to create it.
%-------------------------------------------------------------------------
% SPECIAL PARAMETER: boolUserInput (boolean)
% This parameter is specified in order to distinguish a normal call (with
% user interactions) from an automatic call (software automated tests).
%-------------------------------------------------------------------------
    % Default values:
    ChkOk = false; %#ok<NASGU>
    
    % Check input parameters:
    if nargin<1, boolUserInput = false;end
    if nargin<2, Path          = ''   ;end
    if nargin<3, boolTryCreate = false;end
    
    if ~islogical(boolUserInput), boolUserInput = false;end % force boolean value.
    if ~ischar(Path)      , Path          = ''   ;end
    if ~islogical(boolTryCreate), boolTryCreate = false;end
    
    % Check path:
    if exist(Path,'dir')==0 && boolTryCreate
        if ~isempty(Path)
            try
                mkdir(Path) % try to create it.
            catch 
                warning('Warning while saving. Path is missing. Saving to current directory.');
            end
        end
    end
    
    if exist(Path,'dir')==0
        if boolUserInput, msgbox('Error: FOLDER_MISSING');end
        Path = '';
        ChkOk = false;
        
    else
        % Force absolute path:
        w = what(Path);
        if ~isempty(w)           , Path = w.path    ;end
        
        % Force end with '\':
        if ~strcmp(Path(end),'\'), Path = [Path '\'];end
        ChkOk = true;
    end
end