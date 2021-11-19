classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        ChannelProcessingSystemLabel    matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        LoadParameterMetricButton       matlab.ui.control.Button
        LoadChannelButton               matlab.ui.control.Button
        UploadedChannelsDropDown        matlab.ui.control.DropDown
        UploadedChannelsDropDownLabel   matlab.ui.control.Label
        UploadedParametersMetricsDropDown  matlab.ui.control.DropDown
        UploadedParametersMetricsDropDownLabel  matlab.ui.control.Label
        ColumnDelimeterDropDown         matlab.ui.control.DropDown
        ColumnDelimeterDropDownLabel    matlab.ui.control.Label
        DecimalDelimeterDropDown        matlab.ui.control.DropDown
        DecimalDelimeterDropDownLabel   matlab.ui.control.Label
        FileTypeDropDown_2              matlab.ui.control.DropDown
        FileTypeDropDown_2Label         matlab.ui.control.Label
        FileTypeDropDown                matlab.ui.control.DropDown
        FileTypeDropDownLabel           matlab.ui.control.Label
        YmXcCheckBox                    matlab.ui.control.CheckBox
        bmeanAYCheckBox                 matlab.ui.control.CheckBox
        A1XCheckBox                     matlab.ui.control.CheckBox
        CXbCheckBox                     matlab.ui.control.CheckBox
        WritetoFileButton               matlab.ui.control.Button
        CalculateButton                 matlab.ui.control.Button
        FileTypeDropDown_3              matlab.ui.control.DropDown
        FileTypeDropDown_3Label         matlab.ui.control.Label
        CalculatedChannelsDropDown      matlab.ui.control.DropDown
        CalculatedChannelsDropDownLabel  matlab.ui.control.Label
        CalculatedParametersMetricsDropDown  matlab.ui.control.DropDown
        CalculatedParametersMetricsDropDownLabel  matlab.ui.control.Label
        NoofLinestoreadEditFieldLabel   matlab.ui.control.Label
        NoofLinestoreadEditField        matlab.ui.control.NumericEditField
        NoofHeaderLinestoSkipEditFieldLabel  matlab.ui.control.Label
        NoofHeaderLinestoSkipEditField  matlab.ui.control.NumericEditField
        RawFileCharacteristicsLabel     matlab.ui.control.Label
        OutputFileLabel                 matlab.ui.control.Label
        FunctionsLabel                  matlab.ui.control.Label
        mDropDown                       matlab.ui.control.DropDown
        mDropDownLabel                  matlab.ui.control.Label
        XDropDown                       matlab.ui.control.DropDown
        XDropDownLabel                  matlab.ui.control.Label
        cDropDown                       matlab.ui.control.DropDown
        cDropDownLabel                  matlab.ui.control.Label
        ADropDown                       matlab.ui.control.DropDown
        ADropDownLabel                  matlab.ui.control.Label
        YDropDown                       matlab.ui.control.DropDown
        YDropDownLabel                  matlab.ui.control.Label
        XDropDown_5                     matlab.ui.control.DropDown
        XDropDown_5Label                matlab.ui.control.Label
        XDropDown_6                     matlab.ui.control.DropDown
        XDropDown_6Label                matlab.ui.control.Label
        bDropDown                       matlab.ui.control.DropDown
        bDropDownLabel                  matlab.ui.control.Label
        ClearMemoryButton               matlab.ui.control.Button
        YEditFieldLabel                 matlab.ui.control.Label
        YEditField                      matlab.ui.control.EditField
        bEditFieldLabel                 matlab.ui.control.Label
        bEditField                      matlab.ui.control.EditField
        AEditFieldLabel                 matlab.ui.control.Label
        AEditField                      matlab.ui.control.EditField
        CEditFieldLabel                 matlab.ui.control.Label
        CEditField                      matlab.ui.control.EditField
        ChannelDataPrecisionEditFieldLabel  matlab.ui.control.Label
        ChannelDataPrecisionEditField   matlab.ui.control.NumericEditField
        ParaMetricDataPrecisionEditFieldLabel  matlab.ui.control.Label
        ParaMetricDataPrecisionEditField  matlab.ui.control.NumericEditField
    end

    
    properties (Access = private)
        
        Channelarray    % Stored Channels [Channel array]
        Parametricarray  % Stored Parameters and Metrics [parametric array]
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: LoadChannelButton
        function LoadChannelButtonPushed(app, event)
            app.UIFigure.Visible   = 'on'; %keep the UIfigure on the screen
            colsdelim_             = app.ColumnDelimeterDropDown.Value;
            decsdelim_             = app.DecimalDelimeterDropDown.Value;
            nLinesData_            = app.NoofLinestoreadEditField.Value;
            nLinesOffset_          = app.NoofHeaderLinestoSkipEditField.Value;
            [ChkOk,headers, data]  = LoadButtonPushed(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
            
            if ChkOk
                for i=1:length(headers)
                    tmp_char = headers{i};
                    app.UploadedChannelsDropDown.Items{1,end+1}     = tmp_char;
                    app.XDropDown.Items{1,end+1}                    = tmp_char;
                    app.ADropDown.Items{1,end+1}                    = tmp_char;
                    app.YDropDown.Items{1,end+1}                    = tmp_char;
                    app.XDropDown_5.Items{1,end+1}                  = tmp_char;
                    app.XDropDown_6.Items{1,end+1}                  = tmp_char;
                    
                end
                [~,app.Channelarray] = updateChannelarray(app.Channelarray, headers, data);
            end
        end

        % Value changed function: UploadedChannelsDropDown
        function UploadedChannelsDropDownValueChanged(app, event)
            
        end

        % Button pushed function: LoadParameterMetricButton
        function LoadParameterMetricButtonPushed(app, event)
            app.UIFigure.Visible   = 'on'; %keep the UIfigure on the screen
            colsdelim_             = app.ColumnDelimeterDropDown.Value;
            decsdelim_             = app.DecimalDelimeterDropDown.Value;
            nLinesData_            = app.NoofLinestoreadEditField.Value;
            nLinesOffset_          = app.NoofHeaderLinestoSkipEditField.Value;
            [ChkOk,headers, data]  = LoadButtonPushed(colsdelim_,decsdelim_,nLinesData_,nLinesOffset_);
            
            if ChkOk
                for i=1:length(headers)
                    tmp_char = headers{i};
                    app.UploadedParametersMetricsDropDown.Items{1,end+1} = tmp_char;
                    app.mDropDown.Items{1,end+1}                         = tmp_char;
                    app.cDropDown.Items{1,end+1}                         = tmp_char;
                    app.bDropDown.Items{1,end+1}                         = tmp_char;
                end
                [~,app.Parametricarray] = updateparametricarray(app.Parametricarray, headers, data);
            end
            
        end

        % Drop down opening function: ColumnDelimeterDropDown
        function ColumnDelimeterDropDownOpening(app, event)
            app.ColumnDelimeterDropDown.Items = ["space",",",".","tab"];
        end

        % Drop down opening function: DecimalDelimeterDropDown
        function DecimalDelimeterDropDownOpening(app, event)
            app.DecimalDelimeterDropDown.Items   = [".",","];
        end

        % Drop down opening function: FileTypeDropDown_2
        function FileTypeDropDown_2Opening(app, event)
            app.FileTypeDropDown_2.Items = [".csv",".txt", ".ascii", ".asc"];
        end

        % Drop down opening function: FileTypeDropDown
        function FileTypeDropDownOpening(app, event)
            app.FileTypeDropDown.Items = [".csv",".txt", ".ascii", ".asc"];
        end

        % Drop down opening function: FileTypeDropDown_3
        function FileTypeDropDown_3Opening(app, event)
            app.FileTypeDropDown_3.Items = [".csv",".txt", ".ascii", ".asc"];
        end

        % Value changed function: NoofLinestoreadEditField
        function NoofLinestoreadEditFieldValueChanged(app, event)
        %pass
        end

        % Value changed function: NoofHeaderLinestoSkipEditField
        function NoofHeaderLinestoSkipEditFieldValueChanged(app, event)
        %pass
        end

        % Value changed function: YmXcCheckBox
        function YmXcCheckBoxValueChanged(app, event)
        %pass   
        end

        % Value changed function: bmeanAYCheckBox
        function bmeanAYCheckBoxValueChanged(app, event)
        %pass  
        end

        % Value changed function: A1XCheckBox
        function A1XCheckBoxValueChanged(app, event)
        %pass
        end

        % Value changed function: CXbCheckBox
        function CXbCheckBoxValueChanged(app, event)
        %pass
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            app.UIFigure.Visible   = 'on'; %keep the UIfigure on the screen
            %--------------------------------------------------------------
            %This is a simple function to update the DropDownLists
            %Append calculated Channel names
            function updateDropDowns_Channel(ChanName)
                app.XDropDown.Items{1,end+1}                = ChanName;
                app.ADropDown.Items{1,end+1}                = ChanName;
                app.YDropDown.Items{1,end+1}                = ChanName;
                app.XDropDown_5.Items{1,end+1}              = ChanName;
                app.XDropDown_6.Items{1,end+1}              = ChanName;
            end
            
            %This is a simple function to update the DropDownLists
            %Append calculated Parametric names
            function updateDropDowns_Parametric(ParamName)
                app.mDropDown.Items{1,end+1}                = ParamName;
                app.cDropDown.Items{1,end+1}                = ParamName;
                app.bDropDown.Items{1,end+1}                = ParamName;
            end
            %--------------------------------------------------------------
            
            %First function box is ticked----------------------------------
            if app.YmXcCheckBox.Value && ~isempty(app.YEditField.Value)
                %----------------------------------------------------------
                %Inputs
                Y = upper(app.YEditField.Value); %[char] %force upper case for Channel names
                m = app.mDropDown.Value;  %[char]
                X = app.XDropDown.Value;  %[char]
                c = app.cDropDown.Value;  %[char]
                
                
                %Preallocate memory; if any error, default value
                ChkOk     =  false;
                m_idx     = [];
                X_idx     = [];
                c_idx     = [];
                
                %Get the row index for the required:
                %Channels/parameters/metrics
                for i = 1:length(app.Channelarray)
                    if strcmp(GetChannelName(app.Channelarray{i,1}), X),   X_idx  = i; continue; end
                end
                
                for i = 1:length(app.Parametricarray)
                    if strcmp(GetparametricName(app.Parametricarray{i,1}), m), m_idx  = i; end
                    if strcmp(GetparametricName(app.Parametricarray{i,1}), c), c_idx  = i; end
                end
                
                %Calculate the Channel Y
                if ~isempty(m_idx) && ~isempty(X_idx) && ~isempty(c_idx)
                    [ChkOk, Y_data] = function1( ...
                        GetParamDataByName(app.Parametricarray{m_idx},m), ...
                        GetChanDataByName(app.Channelarray{X_idx},X), ...
                        GetParamDataByName(app.Parametricarray{c_idx},c));
                else
                    msgbox('Error in fetching Channel Data, Check your Inputs.')
                end
                
                %Append Channel Y to the Stored Channels
                if ChkOk
                    app.CalculatedChannelsDropDown.Items{end+1} = Y;
                    [~,app.Channelarray] = updateChannelarray(app.Channelarray, {Y}, Y_data);
                    updateDropDowns_Channel(Y);
                end
                
            end
            
            %Second function box is ticked---------------------------------
            if app.bmeanAYCheckBox.Value && ~isempty(app.bEditField.Value)
            %--------------------------------------------------------------
                %Inputs
                b = lower(app.bEditField.Value); %[char] %force lowercase for metric names
                A = app.ADropDown.Value;  %[char]
                Y = app.YDropDown.Value;  %[char]
                
                
                %Preallocate memory; if any error, default value
                ChkOk     =  false;
                A_idx     = [];
                Y_idx     = [];
                
                %Get the row index for the required:
                %Channels/parameters/metrics
                for i = 1:length(app.Channelarray)
                    if strcmp(GetChannelName(app.Channelarray{i,1}), A),   A_idx  = i; end
                    if strcmp(GetChannelName(app.Channelarray{i,1}), Y),   Y_idx  = i; end
                end
                
                %Calculate the Metric b
                if ~isempty(A_idx) && ~isempty(Y_idx)
                    [ChkOk, B_data, b_data] = function2( ...
                        GetChanDataByName(app.Channelarray{A_idx},A), ...
                        GetChanDataByName(app.Channelarray{Y_idx},Y));
                else
                    msgbox('Error in fetching Channel Data, Check your Channel Names.')
                end
                
                %Append Metric b to the Stored Channels
                if ChkOk
                    app.CalculatedParametersMetricsDropDown.Items{end+1} = b;
                    [~,app.Parametricarray] = updateparametricarray(app.Parametricarray, {b}, b_data);
                    updateDropDowns_Parametric('b');
                    
                    app.CalculatedChannelsDropDown.Items{end+1} = 'B';
                    [~,app.Channelarray] = updateChannelarray(app.Channelarray, {'B'}, B_data);
                    updateDropDowns_Channel('B');
                end
            end
            
            %Third function box is ticked----------------------------------
            if app.A1XCheckBox.Value && ~isempty(app.AEditField.Value)
            %--------------------------------------------------------------
                %Inputs
                A = upper(app.AEditField.Value); %[char] %force uppercase for metric names
                X = app.XDropDown_5.Value;  %[char]
                
                
                %Preallocate memory; if any error, default value
                ChkOk     =  false;
                X_idx     = [];
                
                %Get the row index for the required:
                %Channels/parameters/metrics
                for i = 1:length(app.Channelarray)
                    if strcmp(GetChannelName(app.Channelarray{i,1}), X),   X_idx  = i; end
                end
                
                %Calculate the Channel Y
                if ~isempty(X_idx)
                    [ChkOk, A_data] = function3(GetChanDataByName(app.Channelarray{X_idx},X));
                else
                    msgbox('Error in fetching Data, Check your Channel Names.')
                end
                
                %Append Channel A to the Stored Channels
                if ChkOk
                    app.CalculatedChannelsDropDown.Items{end+1} = A;
                    [~,app.Channelarray] = updateChannelarray(app.Channelarray, {A}, A_data);
                    updateDropDowns_Channel(A);
                end
            end
            %Fourth function box is ticked---------------------------------
            if app.CXbCheckBox.Value && ~isempty(app.CEditField.Value)
            %--------------------------------------------------------------
                %Inputs
                C = upper(app.CEditField.Value); %[char] %force uppercase for metric names
                X = app.XDropDown_6.Value;  %[char]
                b = app.bDropDown.Value;    %[char]
                
                %Preallocate memory; if any error, default value
                ChkOk     =  false;
                X_idx     = [];
                b_idx     = [];
                
                %Get the row index for the required:
                %Channels/parameters/metrics
                for i = 1:length(app.Channelarray)
                    if strcmp(GetChannelName(app.Channelarray{i,1}), X),   X_idx  = i; end
                end
                
                for i = 1:length(app.Parametricarray)
                    if strcmp(GetparametricName(app.Parametricarray{i,1}), b), b_idx  = i; end
                end
                
                %Calculate the Channel C
                if ~isempty(X_idx)
                    [ChkOk, C_data] = function4(GetChanDataByName(app.Channelarray{X_idx},X), ...
                        GetParamDataByName(app.Parametricarray{b_idx},b));
                else
                    msgbox('Error in fetching Data, Check your Channel Names.')
                end
                
                %Append Channel C to the Stored Channels
                if ChkOk
                    app.CalculatedChannelsDropDown.Items{end+1} = C;
                    [~,app.Channelarray] = updateChannelarray(app.Channelarray, {C}, C_data);
                    updateDropDowns_Channel(C);
                end
            end
        end

        % Value changed function: 
        % CalculatedParametersMetricsDropDown
        function CalculatedParametersMetricsDropDownValueChanged(app, event)
        %pass  
        end

        % Drop down opening function: mDropDown
        function mDropDownOpening(app, event)
        %pass
        end

        % Drop down opening function: cDropDown
        function cDropDownOpening(app, event)
        %pass
        end

        % Drop down opening function: bDropDown
        function bDropDownOpening(app, event)
        %pass 
        end

        % Drop down opening function: XDropDown
        function XDropDownOpening(app, event)
        %pass
        end

        % Drop down opening function: ADropDown
        function ADropDownOpening(app, event)
        %pass 
        end

        % Drop down opening function: YDropDown
        function YDropDownOpening(app, event)
        %pass
        end

        % Drop down opening function: XDropDown_5
        function XDropDown_5Opening(app, event)
        %pass
        end

        % Drop down opening function: XDropDown_6
        function XDropDown_6Opening(app, event)
        %pass
        end

        % Button pushed function: ClearMemoryButton
        function ClearMemoryButtonPushed(app, event)
            app.UIFigure.Visible = 'on'; %keep the UIfigure on the screen
            app.Channelarray                                     = [];
            app.Parametricarray                                  = [];
            app.UploadedChannelsDropDown.Items                   = {};
            app.XDropDown.Items                                  = {};
            app.ADropDown.Items                                  = {};
            app.YDropDown.Items                                  = {};
            app.XDropDown_5.Items                                = {};
            app.XDropDown_6.Items                                = {};
            app.UploadedParametersMetricsDropDown.Items          = {};
            app.mDropDown.Items                                  = {};
            app.cDropDown.Items                                  = {};
            app.bDropDown.Items                                  = {};
            app.CalculatedChannelsDropDown.Items                 = {};
            app.CalculatedParametersMetricsDropDown.Items        = {};
            clear; close all; clc; 
        end

        % Button pushed function: WritetoFileButton
        function WritetoFileButtonPushed(app, event)
            app.UIFigure.Visible = 'on'; %keep the UIfigure on the screen
            
            [file,path] = uiputfile('*.*');
            
            if ischar(path) && ischar(file)
                File_Name = [path file];
                
                WriteFile_ASCII(true,app.Channelarray, ...
                    [File_Name '_Channel'], ...
                    app.FileTypeDropDown_3.Value, ...
                    app.ColumnDelimeterDropDown.Value, ...
                    app.DecimalDelimeterDropDown.Value, ...
                    app.ChannelDataPrecisionEditField.Value);
                
                WriteFile_ASCII(true,app.Parametricarray, ...
                    [File_Name '_Parameter_Metric'], ...
                    app.FileTypeDropDown_3.Value, ...
                    app.ColumnDelimeterDropDown.Value, ...
                    app.DecimalDelimeterDropDown.Value, ...
                    app.ParaMetricDataPrecisionEditField.Value);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0 0 0];
            app.UIFigure.Position = [100 100 597 446];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';
            app.UIFigure.WindowStyle = 'modal';

            % Create ChannelProcessingSystemLabel
            app.ChannelProcessingSystemLabel = uilabel(app.UIFigure);
            app.ChannelProcessingSystemLabel.BackgroundColor = [0 0.6353 0.6118];
            app.ChannelProcessingSystemLabel.FontName = 'Sitka Text';
            app.ChannelProcessingSystemLabel.FontSize = 16;
            app.ChannelProcessingSystemLabel.Position = [1 423 282 24];
            app.ChannelProcessingSystemLabel.Text = 'Channel Processing System';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Tooltip = {'World Champions!'};
            app.Image.HorizontalAlignment = 'right';
            app.Image.VerticalAlignment = 'top';
            app.Image.Position = [421 347 177 100];
            app.Image.ImageSource = 'logo_mercedes.PNG';

            % Create LoadParameterMetricButton
            app.LoadParameterMetricButton = uibutton(app.UIFigure, 'push');
            app.LoadParameterMetricButton.ButtonPushedFcn = createCallbackFcn(app, @LoadParameterMetricButtonPushed, true);
            app.LoadParameterMetricButton.BackgroundColor = [1 1 1];
            app.LoadParameterMetricButton.FontSize = 10;
            app.LoadParameterMetricButton.FontWeight = 'bold';
            app.LoadParameterMetricButton.Position = [473 259 117 31];
            app.LoadParameterMetricButton.Text = 'Load Parameter/Metric';

            % Create LoadChannelButton
            app.LoadChannelButton = uibutton(app.UIFigure, 'push');
            app.LoadChannelButton.ButtonPushedFcn = createCallbackFcn(app, @LoadChannelButtonPushed, true);
            app.LoadChannelButton.BackgroundColor = [1 1 1];
            app.LoadChannelButton.FontName = 'Open Sans';
            app.LoadChannelButton.FontSize = 10;
            app.LoadChannelButton.FontWeight = 'bold';
            app.LoadChannelButton.Position = [473 296 117 31];
            app.LoadChannelButton.Text = 'Load Channel';

            % Create UploadedChannelsDropDown
            app.UploadedChannelsDropDown = uidropdown(app.UIFigure);
            app.UploadedChannelsDropDown.Items = {};
            app.UploadedChannelsDropDown.ValueChangedFcn = createCallbackFcn(app, @UploadedChannelsDropDownValueChanged, true);
            app.UploadedChannelsDropDown.Tooltip = {'The channels succesfully loaded (read) from your raw data are listed here.'};
            app.UploadedChannelsDropDown.FontColor = [1 1 1];
            app.UploadedChannelsDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.UploadedChannelsDropDown.Position = [193 298 61 22];
            app.UploadedChannelsDropDown.Value = {};

            % Create UploadedChannelsDropDownLabel
            app.UploadedChannelsDropDownLabel = uilabel(app.UIFigure);
            app.UploadedChannelsDropDownLabel.HorizontalAlignment = 'right';
            app.UploadedChannelsDropDownLabel.FontColor = [1 1 1];
            app.UploadedChannelsDropDownLabel.Position = [11 298 111 22];
            app.UploadedChannelsDropDownLabel.Text = 'Uploaded Channels';

            % Create UploadedParametersMetricsDropDown
            app.UploadedParametersMetricsDropDown = uidropdown(app.UIFigure);
            app.UploadedParametersMetricsDropDown.Items = {};
            app.UploadedParametersMetricsDropDown.Tooltip = {'The parameters and metrics succesfully loaded (read) from your raw data are listed here.'};
            app.UploadedParametersMetricsDropDown.FontColor = [1 1 1];
            app.UploadedParametersMetricsDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.UploadedParametersMetricsDropDown.Position = [193 268 61 22];
            app.UploadedParametersMetricsDropDown.Value = {};

            % Create UploadedParametersMetricsDropDownLabel
            app.UploadedParametersMetricsDropDownLabel = uilabel(app.UIFigure);
            app.UploadedParametersMetricsDropDownLabel.HorizontalAlignment = 'right';
            app.UploadedParametersMetricsDropDownLabel.FontColor = [1 1 1];
            app.UploadedParametersMetricsDropDownLabel.Position = [11 268 164 22];
            app.UploadedParametersMetricsDropDownLabel.Text = 'Uploaded Parameters/Metrics';

            % Create ColumnDelimeterDropDown
            app.ColumnDelimeterDropDown = uidropdown(app.UIFigure);
            app.ColumnDelimeterDropDown.Items = {',', ''};
            app.ColumnDelimeterDropDown.DropDownOpeningFcn = createCallbackFcn(app, @ColumnDelimeterDropDownOpening, true);
            app.ColumnDelimeterDropDown.Tooltip = {'This is the character used to seperate raw data values from each other. Default is the '','' caracter.'};
            app.ColumnDelimeterDropDown.FontColor = [1 1 1];
            app.ColumnDelimeterDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.ColumnDelimeterDropDown.Position = [128 363 50 22];
            app.ColumnDelimeterDropDown.Value = ',';

            % Create ColumnDelimeterDropDownLabel
            app.ColumnDelimeterDropDownLabel = uilabel(app.UIFigure);
            app.ColumnDelimeterDropDownLabel.HorizontalAlignment = 'right';
            app.ColumnDelimeterDropDownLabel.FontColor = [1 1 1];
            app.ColumnDelimeterDropDownLabel.Position = [11 363 102 22];
            app.ColumnDelimeterDropDownLabel.Text = 'Column Delimeter';

            % Create DecimalDelimeterDropDown
            app.DecimalDelimeterDropDown = uidropdown(app.UIFigure);
            app.DecimalDelimeterDropDown.Items = {'.', ''};
            app.DecimalDelimeterDropDown.DropDownOpeningFcn = createCallbackFcn(app, @DecimalDelimeterDropDownOpening, true);
            app.DecimalDelimeterDropDown.Tooltip = {'This is the character used to detect raw data values using it''s delimeter. Default is ''.'' character.'};
            app.DecimalDelimeterDropDown.FontColor = [1 1 1];
            app.DecimalDelimeterDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.DecimalDelimeterDropDown.Position = [128 333 50 22];
            app.DecimalDelimeterDropDown.Value = '.';

            % Create DecimalDelimeterDropDownLabel
            app.DecimalDelimeterDropDownLabel = uilabel(app.UIFigure);
            app.DecimalDelimeterDropDownLabel.HorizontalAlignment = 'right';
            app.DecimalDelimeterDropDownLabel.FontColor = [1 1 1];
            app.DecimalDelimeterDropDownLabel.Position = [11 333 104 22];
            app.DecimalDelimeterDropDownLabel.Text = 'Decimal Delimeter';

            % Create FileTypeDropDown_2
            app.FileTypeDropDown_2 = uidropdown(app.UIFigure);
            app.FileTypeDropDown_2.Items = {'''.txt'''};
            app.FileTypeDropDown_2.DropDownOpeningFcn = createCallbackFcn(app, @FileTypeDropDown_2Opening, true);
            app.FileTypeDropDown_2.Tooltip = {'Choose the file format you wish to read channel from.'};
            app.FileTypeDropDown_2.FontColor = [1 1 1];
            app.FileTypeDropDown_2.BackgroundColor = [0.5098 0.0471 0.0471];
            app.FileTypeDropDown_2.Position = [390 300 64 22];
            app.FileTypeDropDown_2.Value = '''.txt''';

            % Create FileTypeDropDown_2Label
            app.FileTypeDropDown_2Label = uilabel(app.UIFigure);
            app.FileTypeDropDown_2Label.HorizontalAlignment = 'right';
            app.FileTypeDropDown_2Label.FontColor = [1 1 1];
            app.FileTypeDropDown_2Label.Position = [331 300 54 22];
            app.FileTypeDropDown_2Label.Text = 'File Type';

            % Create FileTypeDropDown
            app.FileTypeDropDown = uidropdown(app.UIFigure);
            app.FileTypeDropDown.Items = {'''.txt''', ''};
            app.FileTypeDropDown.DropDownOpeningFcn = createCallbackFcn(app, @FileTypeDropDownOpening, true);
            app.FileTypeDropDown.Tooltip = {'Choose the file format you wish to read parameter or metric from.'};
            app.FileTypeDropDown.FontColor = [1 1 1];
            app.FileTypeDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.FileTypeDropDown.Position = [390 268 64 22];
            app.FileTypeDropDown.Value = '''.txt''';

            % Create FileTypeDropDownLabel
            app.FileTypeDropDownLabel = uilabel(app.UIFigure);
            app.FileTypeDropDownLabel.HorizontalAlignment = 'right';
            app.FileTypeDropDownLabel.FontColor = [1 1 1];
            app.FileTypeDropDownLabel.Position = [331 268 54 22];
            app.FileTypeDropDownLabel.Text = 'File Type';

            % Create YmXcCheckBox
            app.YmXcCheckBox = uicheckbox(app.UIFigure);
            app.YmXcCheckBox.ValueChangedFcn = createCallbackFcn(app, @YmXcCheckBoxValueChanged, true);
            app.YmXcCheckBox.Tooltip = {'function 1'};
            app.YmXcCheckBox.Text = 'Y = mX + c ';
            app.YmXcCheckBox.FontColor = [1 1 1];
            app.YmXcCheckBox.Position = [9 212 85 22];

            % Create bmeanAYCheckBox
            app.bmeanAYCheckBox = uicheckbox(app.UIFigure);
            app.bmeanAYCheckBox.ValueChangedFcn = createCallbackFcn(app, @bmeanAYCheckBoxValueChanged, true);
            app.bmeanAYCheckBox.Tooltip = {'function 2'};
            app.bmeanAYCheckBox.Text = 'b = mean(A+Y)';
            app.bmeanAYCheckBox.FontColor = [1 1 1];
            app.bmeanAYCheckBox.Position = [9 183 104 22];

            % Create A1XCheckBox
            app.A1XCheckBox = uicheckbox(app.UIFigure);
            app.A1XCheckBox.ValueChangedFcn = createCallbackFcn(app, @A1XCheckBoxValueChanged, true);
            app.A1XCheckBox.Tooltip = {'function 3'};
            app.A1XCheckBox.Text = 'A = 1/X';
            app.A1XCheckBox.FontColor = [1 1 1];
            app.A1XCheckBox.Position = [8 154 62 22];

            % Create CXbCheckBox
            app.CXbCheckBox = uicheckbox(app.UIFigure);
            app.CXbCheckBox.ValueChangedFcn = createCallbackFcn(app, @CXbCheckBoxValueChanged, true);
            app.CXbCheckBox.Tooltip = {'function 4'; ''};
            app.CXbCheckBox.Text = 'C = X + b';
            app.CXbCheckBox.FontColor = [1 1 1];
            app.CXbCheckBox.Position = [9 125 73 22];

            % Create WritetoFileButton
            app.WritetoFileButton = uibutton(app.UIFigure, 'push');
            app.WritetoFileButton.ButtonPushedFcn = createCallbackFcn(app, @WritetoFileButtonPushed, true);
            app.WritetoFileButton.BackgroundColor = [1 1 1];
            app.WritetoFileButton.FontSize = 10;
            app.WritetoFileButton.FontWeight = 'bold';
            app.WritetoFileButton.Tooltip = {'Exports the stored Channels into a single file, Metrics/Parameters into another file.'};
            app.WritetoFileButton.Position = [481 9 109 91];
            app.WritetoFileButton.Text = 'Write to File';

            % Create CalculateButton
            app.CalculateButton = uibutton(app.UIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.BackgroundColor = [1 1 1];
            app.CalculateButton.FontSize = 10;
            app.CalculateButton.FontWeight = 'bold';
            app.CalculateButton.Tooltip = {'Calculates the selected functions.'};
            app.CalculateButton.Position = [479 125 109 62];
            app.CalculateButton.Text = 'Calculate';

            % Create FileTypeDropDown_3
            app.FileTypeDropDown_3 = uidropdown(app.UIFigure);
            app.FileTypeDropDown_3.Items = {'.txt'};
            app.FileTypeDropDown_3.DropDownOpeningFcn = createCallbackFcn(app, @FileTypeDropDown_3Opening, true);
            app.FileTypeDropDown_3.Tooltip = {'Choose the file format you wish to export.'};
            app.FileTypeDropDown_3.FontColor = [1 1 1];
            app.FileTypeDropDown_3.BackgroundColor = [0.5098 0.0471 0.0471];
            app.FileTypeDropDown_3.Position = [390 78 64 22];
            app.FileTypeDropDown_3.Value = '.txt';

            % Create FileTypeDropDown_3Label
            app.FileTypeDropDown_3Label = uilabel(app.UIFigure);
            app.FileTypeDropDown_3Label.HorizontalAlignment = 'right';
            app.FileTypeDropDown_3Label.FontColor = [1 1 1];
            app.FileTypeDropDown_3Label.Position = [331 78 54 22];
            app.FileTypeDropDown_3Label.Text = 'File Type';

            % Create CalculatedChannelsDropDown
            app.CalculatedChannelsDropDown = uidropdown(app.UIFigure);
            app.CalculatedChannelsDropDown.Items = {};
            app.CalculatedChannelsDropDown.Tooltip = {'The channels succesfully calculated are listed here.'};
            app.CalculatedChannelsDropDown.FontColor = [1 1 1];
            app.CalculatedChannelsDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.CalculatedChannelsDropDown.Position = [193 46 61 22];
            app.CalculatedChannelsDropDown.Value = {};

            % Create CalculatedChannelsDropDownLabel
            app.CalculatedChannelsDropDownLabel = uilabel(app.UIFigure);
            app.CalculatedChannelsDropDownLabel.HorizontalAlignment = 'right';
            app.CalculatedChannelsDropDownLabel.FontColor = [1 1 1];
            app.CalculatedChannelsDropDownLabel.Position = [11 44 116 22];
            app.CalculatedChannelsDropDownLabel.Text = 'Calculated Channels';

            % Create CalculatedParametersMetricsDropDown
            app.CalculatedParametersMetricsDropDown = uidropdown(app.UIFigure);
            app.CalculatedParametersMetricsDropDown.Items = {};
            app.CalculatedParametersMetricsDropDown.ValueChangedFcn = createCallbackFcn(app, @CalculatedParametersMetricsDropDownValueChanged, true);
            app.CalculatedParametersMetricsDropDown.Tooltip = {'The parameters and metrics succesfully calculated are listed here.'};
            app.CalculatedParametersMetricsDropDown.FontColor = [1 1 1];
            app.CalculatedParametersMetricsDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.CalculatedParametersMetricsDropDown.Position = [193 14 61 22];
            app.CalculatedParametersMetricsDropDown.Value = {};

            % Create CalculatedParametersMetricsDropDownLabel
            app.CalculatedParametersMetricsDropDownLabel = uilabel(app.UIFigure);
            app.CalculatedParametersMetricsDropDownLabel.HorizontalAlignment = 'right';
            app.CalculatedParametersMetricsDropDownLabel.FontColor = [1 1 1];
            app.CalculatedParametersMetricsDropDownLabel.Position = [11 14 170 22];
            app.CalculatedParametersMetricsDropDownLabel.Text = 'Calculated Parameters/Metrics';

            % Create NoofLinestoreadEditFieldLabel
            app.NoofLinestoreadEditFieldLabel = uilabel(app.UIFigure);
            app.NoofLinestoreadEditFieldLabel.HorizontalAlignment = 'right';
            app.NoofLinestoreadEditFieldLabel.FontColor = [1 1 1];
            app.NoofLinestoreadEditFieldLabel.Position = [225 363 107 22];
            app.NoofLinestoreadEditFieldLabel.Text = 'No of Lines to read';

            % Create NoofLinestoreadEditField
            app.NoofLinestoreadEditField = uieditfield(app.UIFigure, 'numeric');
            app.NoofLinestoreadEditField.ValueChangedFcn = createCallbackFcn(app, @NoofLinestoreadEditFieldValueChanged, true);
            app.NoofLinestoreadEditField.Tooltip = {'This is an integer number used to specify how many lines to read starting from the beginning. Default is ''Inf'' lines which means whole document.'};
            app.NoofLinestoreadEditField.Position = [341 363 64 22];
            app.NoofLinestoreadEditField.Value = Inf;

            % Create NoofHeaderLinestoSkipEditFieldLabel
            app.NoofHeaderLinestoSkipEditFieldLabel = uilabel(app.UIFigure);
            app.NoofHeaderLinestoSkipEditFieldLabel.HorizontalAlignment = 'right';
            app.NoofHeaderLinestoSkipEditFieldLabel.FontColor = [1 1 1];
            app.NoofHeaderLinestoSkipEditFieldLabel.Position = [180 333 149 22];
            app.NoofHeaderLinestoSkipEditFieldLabel.Text = 'No of Header Lines to Skip';

            % Create NoofHeaderLinestoSkipEditField
            app.NoofHeaderLinestoSkipEditField = uieditfield(app.UIFigure, 'numeric');
            app.NoofHeaderLinestoSkipEditField.RoundFractionalValues = 'on';
            app.NoofHeaderLinestoSkipEditField.ValueChangedFcn = createCallbackFcn(app, @NoofHeaderLinestoSkipEditFieldValueChanged, true);
            app.NoofHeaderLinestoSkipEditField.Tooltip = {'This is an integer number used to specify how many lines to skip starting from the beginning. Default is ''0'' lines which means whole document is read.'};
            app.NoofHeaderLinestoSkipEditField.Position = [341 333 64 22];

            % Create RawFileCharacteristicsLabel
            app.RawFileCharacteristicsLabel = uilabel(app.UIFigure);
            app.RawFileCharacteristicsLabel.VerticalAlignment = 'top';
            app.RawFileCharacteristicsLabel.FontName = 'Adobe Ming Std L';
            app.RawFileCharacteristicsLabel.FontSize = 14;
            app.RawFileCharacteristicsLabel.FontWeight = 'bold';
            app.RawFileCharacteristicsLabel.FontColor = [1 1 0];
            app.RawFileCharacteristicsLabel.Position = [8 394 404 18];
            app.RawFileCharacteristicsLabel.Text = 'Raw File Characteristics';

            % Create OutputFileLabel
            app.OutputFileLabel = uilabel(app.UIFigure);
            app.OutputFileLabel.VerticalAlignment = 'top';
            app.OutputFileLabel.FontName = 'Adobe Ming Std L';
            app.OutputFileLabel.FontSize = 14;
            app.OutputFileLabel.FontWeight = 'bold';
            app.OutputFileLabel.FontColor = [1 1 0];
            app.OutputFileLabel.Position = [8 90 108 19];
            app.OutputFileLabel.Text = 'Output File ';

            % Create FunctionsLabel
            app.FunctionsLabel = uilabel(app.UIFigure);
            app.FunctionsLabel.VerticalAlignment = 'bottom';
            app.FunctionsLabel.FontName = 'Adobe Ming Std L';
            app.FunctionsLabel.FontSize = 14;
            app.FunctionsLabel.FontWeight = 'bold';
            app.FunctionsLabel.FontColor = [1 1 0];
            app.FunctionsLabel.Position = [8 237 86 23];
            app.FunctionsLabel.Text = 'Functions';

            % Create mDropDown
            app.mDropDown = uidropdown(app.UIFigure);
            app.mDropDown.Items = {};
            app.mDropDown.DropDownOpeningFcn = createCallbackFcn(app, @mDropDownOpening, true);
            app.mDropDown.Tooltip = {'Choose your preferred parameter/metric here. It will replace m in the function1.'};
            app.mDropDown.FontColor = [1 1 1];
            app.mDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.mDropDown.Position = [234 213 50 22];
            app.mDropDown.Value = {};

            % Create mDropDownLabel
            app.mDropDownLabel = uilabel(app.UIFigure);
            app.mDropDownLabel.HorizontalAlignment = 'right';
            app.mDropDownLabel.FontColor = [1 1 1];
            app.mDropDownLabel.Position = [213 214 15 22];
            app.mDropDownLabel.Text = 'm';

            % Create XDropDown
            app.XDropDown = uidropdown(app.UIFigure);
            app.XDropDown.Items = {};
            app.XDropDown.DropDownOpeningFcn = createCallbackFcn(app, @XDropDownOpening, true);
            app.XDropDown.Tooltip = {'Choose your preferred channel here. It will replace X in the function1.'};
            app.XDropDown.FontColor = [1 1 1];
            app.XDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.XDropDown.Position = [316 213 50 22];
            app.XDropDown.Value = {};

            % Create XDropDownLabel
            app.XDropDownLabel = uilabel(app.UIFigure);
            app.XDropDownLabel.HorizontalAlignment = 'right';
            app.XDropDownLabel.FontColor = [1 1 1];
            app.XDropDownLabel.Position = [296 213 15 22];
            app.XDropDownLabel.Text = 'X';

            % Create cDropDown
            app.cDropDown = uidropdown(app.UIFigure);
            app.cDropDown.Items = {};
            app.cDropDown.DropDownOpeningFcn = createCallbackFcn(app, @cDropDownOpening, true);
            app.cDropDown.Tooltip = {'Choose your preferred parameter/metric here. It will replace c in the function1.'};
            app.cDropDown.FontColor = [1 1 1];
            app.cDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.cDropDown.Position = [402 213 50 22];
            app.cDropDown.Value = {};

            % Create cDropDownLabel
            app.cDropDownLabel = uilabel(app.UIFigure);
            app.cDropDownLabel.HorizontalAlignment = 'right';
            app.cDropDownLabel.FontColor = [1 1 1];
            app.cDropDownLabel.Position = [378 213 15 22];
            app.cDropDownLabel.Text = 'c';

            % Create ADropDown
            app.ADropDown = uidropdown(app.UIFigure);
            app.ADropDown.Items = {};
            app.ADropDown.DropDownOpeningFcn = createCallbackFcn(app, @ADropDownOpening, true);
            app.ADropDown.Tooltip = {'Choose your preferred channel here. It will replace A in the function2.'};
            app.ADropDown.FontColor = [1 1 1];
            app.ADropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.ADropDown.Position = [316 184 50 22];
            app.ADropDown.Value = {};

            % Create ADropDownLabel
            app.ADropDownLabel = uilabel(app.UIFigure);
            app.ADropDownLabel.HorizontalAlignment = 'right';
            app.ADropDownLabel.FontColor = [1 1 1];
            app.ADropDownLabel.Position = [296 184 15 22];
            app.ADropDownLabel.Text = 'A';

            % Create YDropDown
            app.YDropDown = uidropdown(app.UIFigure);
            app.YDropDown.Items = {};
            app.YDropDown.DropDownOpeningFcn = createCallbackFcn(app, @YDropDownOpening, true);
            app.YDropDown.Tooltip = {'Choose your preferred channel here. It will replace Y in the function2.'};
            app.YDropDown.FontColor = [1 1 1];
            app.YDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.YDropDown.Position = [402 184 50 22];
            app.YDropDown.Value = {};

            % Create YDropDownLabel
            app.YDropDownLabel = uilabel(app.UIFigure);
            app.YDropDownLabel.HorizontalAlignment = 'right';
            app.YDropDownLabel.FontColor = [1 1 1];
            app.YDropDownLabel.Position = [378 182 15 22];
            app.YDropDownLabel.Text = 'Y';

            % Create XDropDown_5
            app.XDropDown_5 = uidropdown(app.UIFigure);
            app.XDropDown_5.Items = {};
            app.XDropDown_5.DropDownOpeningFcn = createCallbackFcn(app, @XDropDown_5Opening, true);
            app.XDropDown_5.Tooltip = {'Choose your preferred channel here. It will replace X in the function3.'};
            app.XDropDown_5.FontColor = [1 1 1];
            app.XDropDown_5.BackgroundColor = [0.5098 0.0471 0.0471];
            app.XDropDown_5.Position = [402 155 50 22];
            app.XDropDown_5.Value = {};

            % Create XDropDown_5Label
            app.XDropDown_5Label = uilabel(app.UIFigure);
            app.XDropDown_5Label.HorizontalAlignment = 'right';
            app.XDropDown_5Label.FontColor = [1 1 1];
            app.XDropDown_5Label.Position = [378 153 15 22];
            app.XDropDown_5Label.Text = 'X';

            % Create XDropDown_6
            app.XDropDown_6 = uidropdown(app.UIFigure);
            app.XDropDown_6.Items = {};
            app.XDropDown_6.DropDownOpeningFcn = createCallbackFcn(app, @XDropDown_6Opening, true);
            app.XDropDown_6.Tooltip = {'Choose your preferred channel here. It will replace X in the function4.'};
            app.XDropDown_6.FontColor = [1 1 1];
            app.XDropDown_6.BackgroundColor = [0.5098 0.0471 0.0471];
            app.XDropDown_6.Position = [316 126 50 22];
            app.XDropDown_6.Value = {};

            % Create XDropDown_6Label
            app.XDropDown_6Label = uilabel(app.UIFigure);
            app.XDropDown_6Label.HorizontalAlignment = 'right';
            app.XDropDown_6Label.FontColor = [1 1 1];
            app.XDropDown_6Label.Position = [296 126 15 22];
            app.XDropDown_6Label.Text = 'X';

            % Create bDropDown
            app.bDropDown = uidropdown(app.UIFigure);
            app.bDropDown.Items = {};
            app.bDropDown.DropDownOpeningFcn = createCallbackFcn(app, @bDropDownOpening, true);
            app.bDropDown.Tooltip = {'Choose your preferred parameter/metric here. It will replace b in the function4.'};
            app.bDropDown.FontColor = [1 1 1];
            app.bDropDown.BackgroundColor = [0.5098 0.0471 0.0471];
            app.bDropDown.Position = [402 126 50 22];
            app.bDropDown.Value = {};

            % Create bDropDownLabel
            app.bDropDownLabel = uilabel(app.UIFigure);
            app.bDropDownLabel.HorizontalAlignment = 'right';
            app.bDropDownLabel.FontColor = [1 1 1];
            app.bDropDownLabel.Position = [378 125 15 22];
            app.bDropDownLabel.Text = 'b';

            % Create ClearMemoryButton
            app.ClearMemoryButton = uibutton(app.UIFigure, 'push');
            app.ClearMemoryButton.ButtonPushedFcn = createCallbackFcn(app, @ClearMemoryButtonPushed, true);
            app.ClearMemoryButton.BackgroundColor = [1 1 1];
            app.ClearMemoryButton.FontSize = 10;
            app.ClearMemoryButton.FontWeight = 'bold';
            app.ClearMemoryButton.Tooltip = {'Deletes all the Channels, Parameters, Metrics'};
            app.ClearMemoryButton.Position = [479 197 109 40];
            app.ClearMemoryButton.Text = 'Clear Memory';

            % Create YEditFieldLabel
            app.YEditFieldLabel = uilabel(app.UIFigure);
            app.YEditFieldLabel.HorizontalAlignment = 'right';
            app.YEditFieldLabel.FontColor = [1 1 1];
            app.YEditFieldLabel.Position = [139 216 15 22];
            app.YEditFieldLabel.Text = 'Y';

            % Create YEditField
            app.YEditField = uieditfield(app.UIFigure, 'text');
            app.YEditField.HorizontalAlignment = 'center';
            app.YEditField.Tooltip = {'Type in desired output Channel name'};
            app.YEditField.Position = [158 215 43 22];
            app.YEditField.Value = 'Y';

            % Create bEditFieldLabel
            app.bEditFieldLabel = uilabel(app.UIFigure);
            app.bEditFieldLabel.HorizontalAlignment = 'right';
            app.bEditFieldLabel.FontColor = [1 1 1];
            app.bEditFieldLabel.Position = [139 185 15 22];
            app.bEditFieldLabel.Text = 'b';

            % Create bEditField
            app.bEditField = uieditfield(app.UIFigure, 'text');
            app.bEditField.HorizontalAlignment = 'center';
            app.bEditField.Tooltip = {'Type in desired output metric name'};
            app.bEditField.Position = [159 183 43 22];
            app.bEditField.Value = 'b';

            % Create AEditFieldLabel
            app.AEditFieldLabel = uilabel(app.UIFigure);
            app.AEditFieldLabel.HorizontalAlignment = 'right';
            app.AEditFieldLabel.FontColor = [1 1 1];
            app.AEditFieldLabel.Position = [139 155 15 22];
            app.AEditFieldLabel.Text = 'A';

            % Create AEditField
            app.AEditField = uieditfield(app.UIFigure, 'text');
            app.AEditField.HorizontalAlignment = 'center';
            app.AEditField.Tooltip = {'Type in desired output Channel name'};
            app.AEditField.Position = [159 153 43 22];
            app.AEditField.Value = 'A';

            % Create CEditFieldLabel
            app.CEditFieldLabel = uilabel(app.UIFigure);
            app.CEditFieldLabel.HorizontalAlignment = 'right';
            app.CEditFieldLabel.FontColor = [1 1 1];
            app.CEditFieldLabel.Position = [139 125 15 22];
            app.CEditFieldLabel.Text = 'C';

            % Create CEditField
            app.CEditField = uieditfield(app.UIFigure, 'text');
            app.CEditField.HorizontalAlignment = 'center';
            app.CEditField.Tooltip = {'Type in desired output Channel name'};
            app.CEditField.Position = [159 125 43 20];
            app.CEditField.Value = 'C';

            % Create ChannelDataPrecisionEditFieldLabel
            app.ChannelDataPrecisionEditFieldLabel = uilabel(app.UIFigure);
            app.ChannelDataPrecisionEditFieldLabel.HorizontalAlignment = 'center';
            app.ChannelDataPrecisionEditFieldLabel.FontColor = [1 1 1];
            app.ChannelDataPrecisionEditFieldLabel.Position = [264 44 132 22];
            app.ChannelDataPrecisionEditFieldLabel.Text = 'Channel Data Precision';

            % Create ChannelDataPrecisionEditField
            app.ChannelDataPrecisionEditField = uieditfield(app.UIFigure, 'numeric');
            app.ChannelDataPrecisionEditField.RoundFractionalValues = 'on';
            app.ChannelDataPrecisionEditField.Tooltip = {'This is the number of digits after floating point (defaults is 15). [Example 0.814723686393179]'};
            app.ChannelDataPrecisionEditField.Position = [414 45 40 22];
            app.ChannelDataPrecisionEditField.Value = 15;

            % Create ParaMetricDataPrecisionEditFieldLabel
            app.ParaMetricDataPrecisionEditFieldLabel = uilabel(app.UIFigure);
            app.ParaMetricDataPrecisionEditFieldLabel.HorizontalAlignment = 'center';
            app.ParaMetricDataPrecisionEditFieldLabel.FontColor = [1 1 1];
            app.ParaMetricDataPrecisionEditFieldLabel.Position = [264 13 148 22];
            app.ParaMetricDataPrecisionEditFieldLabel.Text = 'Para/Metric Data Precision';

            % Create ParaMetricDataPrecisionEditField
            app.ParaMetricDataPrecisionEditField = uieditfield(app.UIFigure, 'numeric');
            app.ParaMetricDataPrecisionEditField.RoundFractionalValues = 'on';
            app.ParaMetricDataPrecisionEditField.Tooltip = {'This is the number of digits after floating point (defaults is 1). [Example 0.8'};
            app.ParaMetricDataPrecisionEditField.Position = [414 14 40 22];
            app.ParaMetricDataPrecisionEditField.Value = 1;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end