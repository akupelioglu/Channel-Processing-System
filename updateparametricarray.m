function [ChkOk,updated_array] = updateparametricarray(Parametarray, headers, data)
%-------------------------------------------------------------------------
% updateparametricarray = Appends the new parametrics into an existing array.
% Inputs:
% - Parametarray  : existing parameter/metric arrays
% - headers         : parameter/metric names to be added.
% - data            : parameter/metric data to be added
%
% Outputs:
% - ChkOk         : logical indicator of success/failure of operation.
% - updated_array : updated parameter/metric [parametrics array]
%-------------------------------------------------------------------------
% Syntax: updateparametricarray('', headers, data)
%         updateparametricarray(Parametarray, headers, data)
%-------------------------------------------------------------------------
ChkOk         = false;  % default values (in case of errors).
updated_array = {};     % default values (in case of errors).

% Check input parameters:
if nargin<1 ||  isempty(Parametarray),                                  Parametarray    = [];         end
if nargin<2 ||  isempty(headers) || ~isa(headers, "cell"),              headers         = {};         end
if nargin<3 ||  isempty(data)    || ~isnumeric(data),                   data            = [];         end
if ~isa(Parametarray, "cell")    && ~isa(Parametarray, "parametric"),   Parametarray    = [];         end

if ~isempty(headers)&& ~isempty(data)
    nLen      = length(headers);
    updated_array = cell(nLen,1);   %preallocate memory
    
    %Convert to class Parametric format
    if nLen>0
        for i=1:nLen
            nan_idx = find( isnan(data(i,:)),1 ); %find 'nan' values at the end of an array
            
            if nan_idx > 0
                %trim 'nan' values at the end of an array
                updated_array{i,1} = parametric(headers{i},'',headers{i},'',data(i,1:nan_idx-1),{});
            elseif isempty(nan_idx)
                updated_array{i,1} = parametric(headers{i},'',headers{i},'',data(i,:),{});
            end
        end
    end
end
if ~isempty(Parametarray)
    n_idx = length(updated_array);
    for i=1:length(Parametarray)
        updated_array{n_idx+i,1} = Parametarray{i,1};
    end
end
if ~isempty(headers) && ~isempty(data)
    for i=1:length(updated_array)
        
        %Check if all parameters were appended 
        if headers{end}==updated_array{i,1}.Name
            ChkOk = true;
            continue;
        end
    end
end
end