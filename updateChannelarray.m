function [ChkOk,updated_array] = updateChannelarray(Channelarray, headers, data)
%-------------------------------------------------------------------------
% updateChannelarray = Appends the new channels into an existing array.
% Inputs:
% - Channelarray  : existing channel arrays
% - headers       : channel names to be added.
% - data          : channel data to be added
%
% Outputs:
% - ChkOk         : logical indicator of success/failure of operation.
% - updated_array     : updated Channel array
%-------------------------------------------------------------------------
% Syntax: updateChannelarray('', headers, data)
%         updateChannelarray(Channelarray, headers, data)
%-------------------------------------------------------------------------
ChkOk         = false;  % default values (in case of errors).
updated_array = {};     % default values (in case of errors).

% Check input parameters:
if nargin<1 ||  isempty(Channelarray),                                    Channelarray    = [];         end
if nargin<2 ||  isempty(headers) || ~isa(headers, "cell"),                headers         = {};         end
if nargin<3 ||  isempty(data)    || ~isnumeric(data),                     data            = [];         end
if ~isa(Channelarray, "cell")    && ~isa(Channelarray, "Channel"),        Channelarray    = [];         end

if ~isempty(headers)&& ~isempty(data)
    nLen      = length(headers);
    updated_array = cell(nLen,1);   %preallocate memory
    
    %Convert to class Channel format
    if nLen>0
        for i=1:nLen
            nan_idx = find( isnan(data(i,:)),1 ); %find 'nan' values at the end of an array
            
            if nan_idx > 0
                %trim 'nan' values at the end of an array
                updated_array{i,1} = Channel(headers{i},'',headers{i},'',data(i,1:nan_idx-1),{});
            elseif isempty(nan_idx)
                updated_array{i,1} = Channel(headers{i},'',headers{i},'',data(i,:),{});
            end
        end
    end
end
if ~isempty(Channelarray)
    n_idx = length(updated_array);
    for i=1:length(Channelarray)
        updated_array{n_idx+i,1} = Channelarray{i,1};
    end
end
for i=1:length(updated_array)
    ChkOk = (headers{end}==updated_array{i,1}.Name);
end
end