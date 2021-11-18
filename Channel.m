classdef Channel
%-------------------------------------------------------------------------
% Channel class definition.
% Global application Channel definition and operations.
%-------------------------------------------------------------------------
    properties
        Ori_Name         % Channel original name. [char]
        Ori_Units        % Channel original unit. [char]
        Name             % Channel new name. [char]
        Units            % Channel new unit. [char]
        Data             % Channel data. [numeric array]
        Comments         % Other information. [char]
%-------------------------------------------------------------------------            
...This Code can be extended with additional properties...
%         Multiplier       % Multiplier.
%         Offset           % Offset.
%         Delay            % Delay.
%         Filter
%         Filter.Type      % Filter type.
%         Filter.Style     % Filter style.
%         Filter.Order     % Filter order.
%         Filter.Low_pass  % Filter low pass freq.
%         Filter.High_pass % Filter high pass freq.
%-------------------------------------------------------------------------    
    end
    
    methods
        %-----------------------------------------------------------------
        % CLASS CONSTRUCTOR:
        function obj = Channel(varargin)
        % Constructor syntax:
        %  Channel()
        %  Channel(Name)
        %  Channel(Name,Units)
        %  Channel(Name,Units,Data)
        %  Channel(Ori_Name,Ori_Units,Name,Units,Data,Comments)

            
            obj.Ori_Name         = '';
            obj.Ori_Units        = '';
            obj.Name             = '';
            obj.Units            = '';
            obj.Data             = [];
            obj.Comments         = {};
%             obj.Multiplier       = 1;
%             obj.Offset           = 0;
%             obj.Delay            = 0;
%             obj.Filter.Type      = '';
%             obj.Filter.Style     = '';
%             obj.Filter.Order     = 0;
%             obj.Filter.Low_pass  = -inf;
%             obj.Filter.High_pass = inf;
%             boolCalcs            = false; % Do calculations specified by Multiplier, Offset, Delay and Filter.
%             TimeData             = [];    % time data for a Filter calculation to be performed if a filter is specified and boolCalcs==true
 
            % Channel(Name):
            if nargin==1
                if ischar(varargin{1}), obj.Name  = varargin{1}; end
            
            % Channel(Name,Units):
            elseif nargin==2
                if ischar(varargin{1}), obj.Name  = varargin{1}; end
                if ischar(varargin{2}), obj.Units = varargin{2}; end
            
            % Channel(Name,Units,Data):
            elseif (nargin==3 || nargin==3) && ischar(varargin{1}) && ischar(varargin{2}) && isnumeric(varargin{3})
                if ischar(varargin{1})   , obj.Name  = varargin{1}; end
                if ischar(varargin{2})   , obj.Units = varargin{2}; end
                if isnumeric(varargin{3}), obj.Data  = varargin{3}; end
            
            % Channel(<All args>):
            else
                if nargin>= 1 && ischar(varargin{1})    , obj.Ori_Name         = varargin{ 1}; end
                if nargin>= 2 && ischar(varargin{2})    , obj.Ori_Units        = varargin{ 2}; end
                if nargin>= 3 && ischar(varargin{3})    , obj.Name             = varargin{ 3}; end
                if nargin>= 4 && ischar(varargin{4})    , obj.Units            = varargin{ 4}; end
                if nargin>= 5 && isnumeric(varargin{ 5}), obj.Data             = varargin{ 5}; end
                if nargin>= 6 && ischar(varargin{ 6})   , obj  = obj.AddComment(varargin{ 6}); end
%                 if nargin>= 7 && isnumeric(varargin{7}) , obj.Multiplier       = varargin{ 7}; end
%                 if nargin>= 8 && isnumeric(varargin{8}) , obj.Offset           = varargin{ 9}; end
%                 if nargin>= 9 && isnumeric(varargin{9}) , obj.Delay            = varargin{ 7}; end
%                 if nargin>=10 && ischar(varargin{10})   , obj.Filter.Type      = varargin{10}; end
%                 if nargin>=11 && ischar(varargin{11})   , obj.Filter.Style     = varargin{11}; end
%                 if nargin>=12 && isnumeric(varargin{12}), obj.Filter.Order     = varargin{12}; end
%                 if nargin>=13 && isnumeric(varargin{13}), obj.Filter.Low_pass  = varargin{13}; end
%                 if nargin>=14 && isnumeric(varargin{14}), obj.Filter.High_pass = varargin{14}; end
%                 if nargin>=15 && islogical(varargin{15}), boolCalcs            = varargin{15}; end
%                 if nargin>=16 && isnumeric(varargin{16}), TimeData             = varargin{16}; end
            end
            
        end
        
        %-----------------------------------------------------------------
        function d = GetChanDataByName(obj,ChnName)
        % GET DATA BY NAME: returns a channel data, searching by name.
        %-----------------------------------------------------------------
            d = []; % Default result.
            
            % Check input parameters:
            if nargin<2, ChnName = 0; end
            if ~ischar(ChnName), ChnName = ''; end
            
            % Get data by name:
            if ~isempty(obj)
                idx = find(strcmpi(ChnName,{obj.Name}),1);
                if ~isempty(idx), d = obj(idx(1)).Data; end
            end
        end
        
        %-----------------------------------------------------------------
        function names = GetChannelNames(obj)
        % GET CHANNEL NAMES: returns a list with object channel names.
        %-----------------------------------------------------------------
            names = {}; % Default result.
            if ~isempty(obj), names = {obj.Name}; end % Get names:
        end
        
        %-----------------------------------------------------------------
        function name = GetChannelName(obj)
        % GET CHANNEL NAME: returns channel name.
        %-----------------------------------------------------------------
            name = ''; % Default result.
            if ~isempty(obj), name = obj.Name; end % Get name:
        end
        
        %-----------------------------------------------------------------
        function n = LenData(obj)
        % LENGTH: returns the length of the largest channel/s data.
        %-----------------------------------------------------------------
            n = 0;
            if ~isempty(obj)
                for i=1:numel(obj)
                    n = max(n,numel(obj(i).Data));
                end
            end
        end
        
        %-----------------------------------------------------------------
        function n = MinLenData(obj)
        % MIN LENGTH: returns the length of the smallest channel/s data.
        %-----------------------------------------------------------------
            n = inf;
            if ~isempty(obj)
                for i=1:numel(obj)
                    n = min(n,numel(obj(i).Data));
                end
            else
                n = 0;
            end
        end
        
        %-----------------------------------------------------------------
        function n = Min(obj)
        % MIN: returns the lowest value of channel/s data.
        %-----------------------------------------------------------------
            n = [];
            if ~isempty(obj)
                n = min(obj(1).Data);
                for i=2:length(obj)
                    n = min(n,min(obj(i).Data));
                end
            end
        end
        
        %-----------------------------------------------------------------
        function n = Max(obj)
        % MAX: returns the highest value of channel/s data.
        %-----------------------------------------------------------------
            n = [];
            if ~isempty(obj)
                n = max(obj(1).Data);
                for i=2:length(obj)
                    n = max(n,max(obj(i).Data));
                end
            end
        end
        
        %-----------------------------------------------------------------
        function obj = AddComment(obj,NewComment)
        % ADD COMMENT: adds a new comment.
        %-----------------------------------------------------------------
            % Check input parameters:
            if nargin<2, NewComment = ''; end
            
            % Add comment:
            if ischar(NewComment) && ~isempty(NewComment)
                for n=1:numel(obj)
                    obj(n).Comments = [obj(n).Comments ; NewComment];
                end
            end
        end
        
        %-----------------------------------------------------------------
        function row = GetRowAt(obj,RefValue)
        % GET ROW AT: gets row index at a first reference value occurrence.
        %-----------------------------------------------------------------
            row = [];
            
            % Check input parameters:
            if nargin<2, RefValue = []; end
            if isnumeric(RefValue), RefValue = []; end
            
            % Get row/s:
            if ~isempty(obj) && ~isempty(RefValue)
                row    = zeros(size(obj));
                row(:) = -1; % row not found
                for n=1:numel(obj)
                    Chn = obj(n);
                    
                    if ~isempty(Chn.Data)
                        if RefValue>=min(Chn.Data) && RefValue<=max(Chn.Data)
                            if RefValue>Chn.Data(1)
                                row_idx = Chn.Data<=RefValue;
                            else
                                row_idx = Chn.Data>=RefValue;
                            end
                            row_idx = find(row_idx,1);
                            if ~isempty(row_idx), row(n) = row_idx(1); end
                        end
                    end
                end
            end
        end
    end
end