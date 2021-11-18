classdef parametric
%-------------------------------------------------------------------------
% Parameter/Metric class definition.
% Global application Parameter/Metric definition and operations.
%-------------------------------------------------------------------------
    properties
        Ori_Name         % Parameter/Metric original name. [char]
        Ori_Units        % Parameter/Metric original unit. [char]
        Name             % Parameter/Metric new name. [char]
        Units            % Parameter/Metric new unit. [char]
        Data             % Parameter/Metric data. [numeric array]
        Comments         % Other information. [char]
    end
    
    methods
        %-----------------------------------------------------------------
        % CLASS CONSTRUCTOR:
        function obj = parametric(varargin)
        % Constructor syntax:
        %  parametric()
        %  parametric(Name)
        %  parametric(Name,Units)
        %  parametric(Name,Units,Data)
        %  parametric(Ori_Name,Ori_Units,Name,Units,Data,Comments)

            
            obj.Ori_Name         = '';
            obj.Ori_Units        = '';
            obj.Name             = '';
            obj.Units            = '';
            obj.Data             = [];
            obj.Comments         = {};
    
            % metric(Name):
            if nargin==1
                if ischar(varargin{1}), obj.Name  = varargin{1}; end
            
            % metric(Name,Units):
            elseif nargin==2
                if ischar(varargin{1}), obj.Name  = varargin{1}; end
                if ischar(varargin{2}), obj.Units = varargin{2}; end
            
            % metric(Name,Units,Data):
            elseif (nargin==3 || nargin==3) && ischar(varargin{1}) && ischar(varargin{2}) && isnumeric(varargin{3})
                if ischar(varargin{1})   , obj.Name  = varargin{1}; end
                if ischar(varargin{2})   , obj.Units = varargin{2}; end
                if isnumeric(varargin{3}), obj.Data  = varargin{3}; end
            
            % metric(<All args>):
            else
                if nargin>= 1 && ischar(varargin{1})    , obj.Ori_Name         = varargin{ 1}; end
                if nargin>= 2 && ischar(varargin{2})    , obj.Ori_Units        = varargin{ 2}; end
                if nargin>= 3 && ischar(varargin{3})    , obj.Name             = varargin{ 3}; end
                if nargin>= 4 && ischar(varargin{4})    , obj.Units            = varargin{ 4}; end
                if nargin>= 5 && isnumeric(varargin{ 5}), obj.Data             = varargin{ 5}; end
                if nargin>= 6 && ischar(varargin{ 6})   , obj  = obj.AddComment(varargin{ 6}); end
            end
            
        end
        
        %-----------------------------------------------------------------
        function d = GetParamDataByName(obj,parametricName)
        % GET DATA BY NAME: returns a metric data, searching by name.
        %-----------------------------------------------------------------
            d = []; % Default result.
            
            % Check input parameters:
            if nargin<2, parametricName = 0; end
            if ~ischar(parametricName), parametricName = ''; end
            
            % Get data by name:
            if ~isempty(obj)
                idx = find(strcmpi(parametricName,{obj.Name}),1);
                if ~isempty(idx), d = obj(idx(1)).Data; end
            end
        end
        
        %-----------------------------------------------------------------
        function names = GetparametricNames(obj)
        % GET PARAMETRIC NAMES: returns a list with object metric names.
        %-----------------------------------------------------------------
            names = {}; % Default result.
            if ~isempty(obj), names = {obj.Name}; end % Get names:
        end
        
        %-----------------------------------------------------------------
        function name = GetparametricName(obj)
        % GET PARAMETRIC NAME: returns parametric name.
        %-----------------------------------------------------------------
            name = ''; % Default result.
            if ~isempty(obj), name = obj.Name; end % Get name:
        end
        %-----------------------------------------------------------------
        function n = LenData(obj)
        % LENGTH: returns the length of the largest parameter/metric data.
        %-----------------------------------------------------------------
            n = 0;
            if ~isempty(obj)
                for i=1:numel(obj)
                    n = max(n,numel(obj(i).Data));
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
        

    end
end