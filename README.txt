Hi 👋, I'm Arda Kupelioglu.
A passionate Advanced Mechanical Engineer from the University of Southampton Formula Student Team.
BEng Aerospace Engineering Graduate, MSc Computational Engineering and Design Student. 
Experienced Software Engineer in Automotive Engineering [Applus IDIADA, SPAIN]
🔭 I’m currently working on Channel Processing System.


CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Requirements and Installation
 * Running the App
 * Recommended modules
 * Zipped files
 * Tasks
 * Solutions
 * Testing
 * Configuration
 * Troubleshooting
 * FAQ


INTRODUCTION
------------

Current Maintainer: Arda Kupelioglu <ardakupelioglu@gmail.com>

To understand the performance of the car, a channel processing system to augment the measured data and to calculate metrics is required.  
The system will have a mechanism for reading and writing channels and metrics, and a mechanism for reading parameters.  
The functions that will process the channel data have the form outputs = function (parameters, inputs).  

 * For a full description of the module, visit the project page:
   👉	https://github.com/akupelioglu/Channel-Processing-System.git 

 * To submit bug reports and feature suggestions, or track changes:
   🐛	https://github.com/akupelioglu/Channel-Processing-System/issues

REQUIREMENTS and INSTALLATION
------------------------

This app require either of the following two:

 * MATLAB Runtime compiler(https://uk.mathworks.com/products/compiler/matlab-runtime.html) Run compiled MATLAB applications or components without installing MATLAB.
 * MATLAB R2020b program or later versions. (Older versions possibly work too but not guaranteed.)
   Download free trial here 👉	https://uk.mathworks.com/campaigns/products/trials.html

MATLAB
------------
The programming tool is MATLAB (The MathWorks Ltd, Matrix House, Cambridge, Business Park, Cambridge, CB4 0HH, United Kingdom). 
It offers easy to apply a large database of built‐in and external algorithms to perform extensive post‐processing and visualization where necessary. 
For such projects where error tolerances must be either not exist or small, it was preferred to build the application in a reliable environment using tested codes.
Matlab has a massive community where any unexpected errors could be addressed. It allows cross operating systems integrability.


RUNNING THE APP
----------------
Windows OS is suggested.
1- Unzip the folder. Folder called 'Mercedes' holds all the necessary files (30 items in total). Make sure to keep the files all in the same folder.
2- All you need to do is to Double click on the 'app1.mlapp' to start the app. (It will also open the MATLAB software with the application folder selected as path.)
   (As the MATLAB initializes itself, it might take 3-4 seconds to open the application after MATLAB starts that please wait for it.)

   
RUNNING THE APP - ALTERNATIVE 1

1- Start the MATLAB as you would normally do in your operating system.
   (For example, type 'cmd' in your Windows start search box, click on Command Prompt. Then just type matlab and click enter.)
2- Type in 'app1' in the Command Window of Matlab.


RECOMMENDED MODULES
---------------------

 * MATLAB APPS can help to easily install and save the app for future reference (It is not needed to use the app).

1- Start the MATLAB as you would normally do in your operating system.
   (For example, type 'cmd' in your Windows start search box, click on Command Prompt. Then just type matlab and click enter. More at https://uk.mathworks.com/help/matlab/matlab_env/start-matlab-on-windows-platforms.html)
   (To start Matlab in Linux type matlab at the operating system prompt. More at https://uk.mathworks.com/help/matlab/matlab_env/start-matlab-on-linux-platforms.html )
   (To start from the Terminal window, you need to know the value of matlabroot, the full path to the folder where MATLAB is installed. 
    If you do not know the path, then open MATLAB from the Applications folder, type matlabroot, and note the value. Exit MATLAB.	
    More at https://uk.mathworks.com/help/matlab/matlab_env/start-matlab-on-linux-platforms.html ) 

2- In Matlab, click on 'APPS' tab from the top and then click on 'Install App' in File section. Then choose 'app1.mlappinstall' in 'app1_resources' folder. Click on Install. 
   Once the application is installed, Change your path to folder'Mercedes'.
   Find 'app1' from the drop down list in APPS section. Single click on it should open it.

3- Provided codes can be prompted using the command window / new script.

 * Alternatively, you can run the below script in the Matlab Command Window.
	appinfo = matlab.apputil.install(appfile) where appfile is the full path including the app1 file.
	(For example, matlab.apputil.install('C:\Mercedes\app1'))

 * You may want to disable external Toolboxes to prevent clashes.


ZIPPED FILES
---------------
      The following codes were code to read/calculate/write the channels/parameters/metrics.
      Channel.m
      Check_Channel.m
      Check_parametric.m
      CheckFileOptions.m
      Chk_InputFile.m
      Chk_OutputFile.m
      Chk_Path.m
      function1.m
      function2.m
      function3.m
      function4.m
      GetChannels.m
      Getparametric.m
      LoadButtonPushed.m
      parametric.m
      ReadFile.m
      ReadFile_ASCII.m
      test.m
      updateChannelarray.m
      updateparametricarray.m
      WriteFile_ASCII.m

     The followings are complementary files in this system.
    'App1_Code' folder has the app1.m code.
    'app1_resources' folder has the app1.m icons and 'app1.mlappinstall' which is the application installer file that is selected while installing the app to the MATLAB (More in RECOMMENDED MODULES).
    'test.m' file was used to test the other 21 scripts that were provided in the zipped folder.
    'app1.mlapp' file is the application itself. (app1_code.m is just the copy of the App designer script).
    'app.prj' contains information about app1, such as included files and a description
    'logo_mercedes.png' is the logo picture used in the application canvas.
    'Channel Processing System' word document holds information for the given task.
    'channels.txt' file is used in the given task.
    'parameters.txt' file is used in the given task.
    'README.txt' file is this file itself.
   

TASKS
--------
1-	Develop a flexible and generic application for processing channel data using the functions above. Your application should demonstrate the software engineering traits we care about: 
-	Readability - clear and concise code. 
-	Extensibility - easily extended for additional inputs and functions. 
-	Testability - low complexity, high cohesion, easily tested.

2-	Using your application, from the channels.txt and parameters.txt files provided, can you calculate the value of metric b?

SOLUTIONS
------------
1- The provided scripts were developed by keeping the points mentioned in TASK 1 in the center of everything coded.
   The codes were provided with plenty of comments to explain what was intended.
   The following template is provided for each '.m' file to inform the reader.
    
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

     app1.m lets the user to calculate any channel/parameter/metric using the functions provided.

2- a. The '.txt' file column delimeter, decimal point delimeter, number of lines to read, and number of lines to skip (offset) can be selected.
      They are set to default for the given 'channels.txt' and 'parameters.txt' settings. Therefore, you may like to leave them as they are.
   b. Select the 'Load Channel' button to load the 'channels.txt' or any other channel with the same file format.
   d. Select the 'Load Parameter/Metric' button to load the 'parameters.txt' or any other parameters/metrics with the same file format.
   d. Tick the function1 box and calculate 'Y' channel. Note that you can give any name to your channel and similarly you can use any channel/parameter/metric you wish to use.
   e. Tick the function3 box and calculate 'A' channel. Note that you can give any name to your channel and similarly you can use any channel/parameter/metric you wish to use.
   f. Tick the function2 box and calculate 'b' metric.  Note that you can give any name to your metric and similarly you can use any channel/parameter/metric you wish to use.
   e. You may like to export(write) the calculated as well the loaded channels/parameters/metrics. Data precision decides the field width of each single data value to write into the desired format.

	Alternative:
	Copy and Run the following series of scripts in Matlab command window in WINDOWS OS:

	[ChkOk,headers,data] 	= ReadFile(true,[pwd '\channels.txt'],',','.',Inf, 0);
	[ChkOk,headers1,data1] 	= ReadFile(true,[pwd '\parameters.txt'],',','.',Inf, 0);
	[ChkOk, X] 		= Check_Channel(headers, data, 'X');
	[ChkOk, m] 		= Check_parametric(headers1, data1, 'm');
	[ChkOk, c] 		= Check_parametric(headers1, data1, 'c');
	[ChkOk, Y] 		= function1(m, X, c);
	[ChkOk, A] 		= function3(X);
	[ChkOk, B, b] 		= function2(A, Y);

	Copy and Run the following series of scripts in Matlab command window in Macintosh OS:

	[ChkOk,headers,data] 	= ReadFile(true,[pwd '/channels.txt'],',','.',Inf, 0);
	[ChkOk,headers1,data1] 	= ReadFile(true,[pwd '/parameters.txt'],',','.',Inf, 0);
	[ChkOk, X] 		= Check_Channel(headers, data, 'X');
	[ChkOk, m] 		= Check_parametric(headers1, data1, 'm');
	[ChkOk, c] 		= Check_parametric(headers1, data1, 'c');
	[ChkOk, Y] 		= function1(m, X, c);
	[ChkOk, A] 		= function3(X);
	[ChkOk, B, b] 		= function2(A, Y);

TESTING
-------------
It is possible to view and run the test functions for the designed app by opening and running 'test.m' file.
   (Make sure the path to the folder 'Mercedes' is selected and the folder 'Mercedes' has all the zipped files.)
   Just type followings in the command window:
	results = runtests 
	table(results)


CONFIGURATION
-------------

The module has no menu or modifiable settings. There is no configuration.

TROUBLESHOOTING
---------------

Why will MATLAB not start up properly on my Windows based system?
If MATLAB is not launching properly, and you are not receiving any License Manager Errors, then you may be experiencing one of the following problems:
 * Corrupt preferences
 * Security software or other third party software interfering with MATLAB
 * Issue with Java environment
 * Installation directory
 * Username has a non-ASCII character
 * Single Sign-On (SSO) software interfering with MATLAB
 * Clearing the TEMP directory

You may like to refer more here https://uk.mathworks.com/matlabcentral/answers/97167-why-will-matlab-not-start-up-properly-on-my-windows-based-system

FAQ
---

Q: I cannot maximize the application window. Is this normal?

A: Yes, this is the intended behavior. the application interface only loads
   itself as  square panel as needed (i.e., on page everything can be found)
   users).