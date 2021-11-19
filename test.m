
%% Main function to generate tests
function tests = test
tests = functiontests(localfunctions);
end
%-------------------------------------------------------------------------
% This file consists of all the test functions of Channel Processing System.
% To run, just type result = runtests in the command window.
% table(results) should print the result details.
%% Test Functions1: ReadFile_ASCII
function testFunctionOne(testCase)
% Test variables.

%different class array
x = randi([0 50], 1,1);

s='A':'J';
str=s(randi(numel(s)));

%random different class values
mycell= {nan, 0, [], true, false, x, str};

% Test specific code
%This test is expected to success
% [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
[ChkOk,headers,data] = ReadFile_ASCII(0,[pwd '\channels.txt'],',','.',Inf,0);
verifyEqual(testCase, ChkOk,        true,      "Test1.1: Value must match.");
verifyEqual(testCase, class(headers),'cell', "Test1.2: Classes must match.");
verifyEqual(testCase, class(data), 'double', "Test1.3: Classes must match.");

%This test is expected to return empty
% [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
[ChkOk,headers,data] = ReadFile_ASCII(0,'',',','.',Inf,0);
verifyEqual(testCase, ChkOk,        false,     "Test1.4: Value must match.");
verifyEqual(testCase, headers,         {},   "Test1.5: Classes must match.");
verifyEqual(testCase, data,            [],   "Test1.6: Classes must match.");
%
%This test is expected to return empty
% [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
for i=1:length(mycell)
    [ChkOk,headers,data] = ReadFile_ASCII(false,mycell{i},',','.',Inf,0);
    verifyEqual(testCase, ChkOk,    false,   "Test1.7: Classes must match.");
    verifyEqual(testCase, headers,     {},   "Test1.8: Classes must match.");
    verifyEqual(testCase, data,        [],   "Test1.9: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',mycell{i},'.',Inf,0);
    verifyEqual(testCase, ChkOk,    false,   "Test1.10: Classes must match.");
    verifyEqual(testCase, headers,     {},   "Test1.11: Classes must match.");
    verifyEqual(testCase, data,        [],   "Test1.12: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',',mycell{i},Inf,0);
    verifyEqual(testCase, ChkOk,    false,   "Test1.13: Classes must match.");
    verifyEqual(testCase, headers,     {},   "Test1.14: Classes must match.");
    verifyEqual(testCase, data,        [],   "Test1.15: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',','.',mycell{i},0);
    verifyEqual(testCase, ChkOk,    false,   "Test1.16: Classes must match.");
    verifyEqual(testCase, headers,     {},   "Test1.17: Classes must match.");
    verifyEqual(testCase, data,        [],   "Test1: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',','.',Inf,mycell{i});
    verifyEqual(testCase, ChkOk,    false,   "Test1.18: Classes must match.");
    verifyEqual(testCase, headers,     {},   "Test1.19: Classes must match.");
    verifyEqual(testCase, data,        [],   "Test1.20: Classes must match.");
end
end
%% Test Functions2: function1
function testFunctionTwo(testCase)

X = [1 2 3];
% Test specific code
%This test is expected to success
[ChkOk, Y] = function1(1, X, 2);
verifyEqual(testCase, ChkOk,            1,     'Test2.1: Value must match')
verifyEqual(testCase, class(Y),  'double',     'Test2.2: Class must match')
verifyEqual(testCase, Y, [3 4 5],              'Test2.3: Value must match')

%This test is expected to success
X = randi([0 100], 1,100);
[ChkOk, Y] = function1(1, X, 0);
verifyEqual(testCase, ChkOk,            1,     'Test2.4: Value must match')
verifyEqual(testCase, class(Y),  'double',     'Test2.5: Class must match')
verifyEqual(testCase, Y,                X,     'Test2.6: Value must match')

%This test is expected to return empty
X = randi([0 100], 1,100);
[ChkOk, Y] = function1(0, X, 0);
verifyEqual(testCase, ChkOk,            1,     'Test2.7: Value must match')
verifyEqual(testCase, class(Y),  'double',     'Test2.8: Class must match')
verifyEqual(testCase, Y,             X.*0,     'Test2.9: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, Y] = function1(mycell{i}, X, 0);
    verifyEqual(testCase,ChkOk,          0,   'Test2.10: Value must match')
    verifyEqual(testCase,class(Y),'double',   'Test2.11: Class must match')
    verifyEqual(testCase, Y,            [],   'Test2.12: Value must match')
    [ChkOk, Y] = function1(0, mycell{i}, 0);
    verifyEqual(testCase, ChkOk,         0,  'Test2.13: Value must match')
    verifyEqual(testCase,class(Y),'double',  'Test2.14: Class must match')
    verifyEqual(testCase, Y,            [],  'Test2.15: Value must match')
    [ChkOk, Y] = function1(0, X, mycell{i});
    verifyEqual(testCase,ChkOk,          0,  'Test2.16: Value must match')
    verifyEqual(testCase,class(Y),'double',  'Test2.17: Class must match')
    verifyEqual(testCase, Y,            [],  'Test2.18: Value must match')
end
end
%% Test Functions3: function2
function testFunctionThree(testCase)

A = [1 2 3];
Y = [1 2 3];
% Test specific code
[ChkOk, B, b] = function2(A, Y);
verifyEqual(testCase,   ChkOk,           1,    'Test3.1: Value must match')
verifyEqual(testCase,   class(B), 'double',    'Test3.2: Class must match')
verifyEqual(testCase,   class(b), 'double',    'Test3.3: Class must match')
verifyEqual(testCase,   B,             A+Y,    'Test3.4: Value must match')
verifyEqual(testCase,   b,       mean(A+Y),    'Test3.5: Value must match')

% Test specific code
%This test is expected to return empty
A = [];
Y = [];
[ChkOk, B, b] = function2(A, Y);
verifyEqual(testCase,   ChkOk,           0,    'Test3.6: Value must match')
verifyEqual(testCase,   class(B), 'double',    'Test3.7: Class must match')
verifyEqual(testCase,   class(b), 'double',    'Test3.8: Class must match')
verifyEqual(testCase,   B,              [],    'Test3.9: Value must match')
verifyEqual(testCase,   b,              [],   'Test3.10: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,         0,   'Test3.11: Value must match')
    verifyEqual(testCase,   B,          [],   'Test3.12: Value must match')
    verifyEqual(testCase,   b,          [],   'Test3.13: Value must match')
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,         0,   'Test3.14: Value must match')
    verifyEqual(testCase,   B,          [],   'Test3.15: Value must match')
    verifyEqual(testCase,   b,          [],   'Test3.16: Value must match')
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,         0,   'Test3.17: Value must match')
    verifyEqual(testCase,   B,          [],   'Test3.18: Value must match')
    verifyEqual(testCase,   b,          [],   'Test3.19: Value must match')
end
end
%% Test Functions4: function3
function testFunctionFour(testCase)
X = [1 2 4];
% Test specific code
[ChkOk, A] = function3(X);
%This test is expected to success
verifyEqual(testCase,   ChkOk,            1,   'Test4.1: Value must match')
verifyEqual(testCase,   class(A),  'double',   'Test4.2: Class must match')
verifyEqual(testCase,   A,     [1 0.5 0.25],   'Test4.3: Value must match')
%
% Test specific code
%This test is expected to success
[ChkOk, A] = function3(X);
verifyEqual(testCase,   ChkOk,            1,   'Test4.4: Value must match')
verifyEqual(testCase,   A,             1./X,   'Test4.5: Value must match')


%This test is expected to return empty
X = [];
[ChkOk, A] = function3(X);
verifyEqual(testCase,   ChkOk,            0,   'Test4.6: Class must match')
verifyEqual(testCase,   class(A),  'double',   'Test4.7: Class must match')
verifyEqual(testCase,   A,               [],   'Test4.8: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, A] = function3(mycell{i});
    verifyEqual(testCase, ChkOk,          0,   'Test4.9: Value must match')
    verifyEqual(testCase, A,             [],  'Test4.10: Value must match')
end
end
%% Test Functions5: function4
function testFunctionFive(testCase)
% Test specific code
%This test is expected to success
X = [1 2];
b = [1 2];
[ChkOk, C] = function4(X,b);
verifyEqual(testCase, ChkOk,              1,   'Test5.1: Value must match')
verifyEqual(testCase, class(C),    'double',   'Test5.2: Class must match')
verifyEqual(testCase, C,              [2 4],   'Test5.3: Value must match')

%This test is expected to return empty
X = [];
b = [];
[ChkOk, C] = function4(X,b);
verifyEqual(testCase,   ChkOk,            0,   'Test5.4: Value must match')
verifyEqual(testCase,   class(C),  'double',   'Test5.5: Class must match')
verifyEqual(testCase,   C,               [],   'Test5.6: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, C] = function4(mycell{i},b);
    verifyEqual(testCase, ChkOk,          0,   'Test5.7: Value must match')
    verifyEqual(testCase, C,             [],   'Test5.8: Value must match')
    
    [ChkOk, C] = function4(X, mycell{i});
    verifyEqual(testCase, ChkOk,         0,    'Test5.9: Value must match')
    verifyEqual(testCase, C,            [],   'Test5.10: Value must match')
end
end
%% Test Functions6: Chk_Path
function testFunctionSix(testCase)
%This test is expected to success
[ChkOk, Path] = Chk_Path(false,pwd,false);
verifyEqual(testCase,ChkOk,           true,    'Test6.1: Value must match')
verifyEqual(testCase,class(Path),   'char',    'Test6.2: Class must match')
verifyEqual(testCase,~isempty(Path),  true,    'Test6.3: Value must match')

%This test is expected to return empty
currentfolder = pwd;
[ChkOk, Path] = Chk_Path(false,currentfolder,true);
verifyEqual(testCase,ChkOk,          true,     'Test6.4: Value must match')
verifyEqual(testCase,isempty(Path), false,     'Test6.5: Value must match')

%This test is expected to success
[ChkOk, Path] = Chk_Path(false,'',true);
verifyEqual(testCase,ChkOk,         false,     'Test6.6: Value must match')
verifyEqual(testCase,isempty(Path),  true,     'Test6.7: Value must match')


%This test is expected to return empty
mycell= {[], false}; %random different class values
for i=1:length(mycell)
    [ChkOk, Path] = Chk_Path(mycell{i},'',false);
    verifyEqual(testCase,ChkOk,     false,     'Test6.8: Value must match')
    verifyEqual(testCase,isempty(Path),true,   'Test6.9: Value must match')
    [ChkOk, Path] = Chk_Path(false,mycell{i},false);
    verifyEqual(testCase,ChkOk,     false,    'Test6.10: Value must match')
    verifyEqual(testCase,isempty(Path),true,  'Test6.11: Value must match')
    [ChkOk, Path] = Chk_Path(false,'',mycell{i});
    verifyEqual(testCase,ChkOk,       false,  'Test6.11: Value must match')
    verifyEqual(testCase,isempty(Path),true,  'Test6.12: Value must match')
end

end

%% Test Functions7: Chk_InputFile
function testFunctionSeven(testCase)
%This test is expected to success
ChkOk = Chk_InputFile([pwd '\channels.txt'],                       '.txt');
verifyEqual(testCase,ChkOk,           true,    'Test7.1: Value must match')

%This test is expected to return empty
ChkOk = Chk_InputFile('','.txt');
verifyEqual(testCase,ChkOk,          false,    'Test7.2: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], str, false}; %random different class values
for i=1:length(mycell)
    
    ChkOk = Chk_InputFile(mycell{i},                               '.txt');
    verifyEqual(testCase,ChkOk,      false,    'Test7.3: Value must match')
    
    ChkOk = Chk_InputFile(mycell{i});
    verifyEqual(testCase,ChkOk,      false,    'Test7.4: Value must match')
    
end

end

%% Test Functions8: Chk_OutputFile
function testFunctionEight(testCase)
%This test is expected to success
[ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,[pwd '\channels.txt'],'.txt');
verifyEqual(testCase,                           ChkOk,                true,    'Test8.1: Value must match')
verifyEqual(testCase,           ~isempty(FileDefPath),                true,    'Test8.2: Value must match')
verifyEqual(testCase,           ~isempty(FileDefName),                true,    'Test8.3: Value must match')

%This test is expected to success
[ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,[pwd '\channels.txt'],'.csv');
verifyEqual(testCase,                           ChkOk,                true,    'Test8.4: Value must match')
verifyEqual(testCase,           ~isempty(FileDefPath),                true,    'Test8.5: Value must match')
verifyEqual(testCase,           ~isempty(FileDefName),                true,    'Test8.6: Value must match')

%This test is expected to return empty
mycell= {[], false}; %random different class values
for i= 1:length(mycell)
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(mycell{i},[pwd '\channels.txt'],'.csv');
    verifyEqual(testCase,                       ChkOk,                true,    'Test8.7: Value must match')
    verifyEqual(testCase,       ~isempty(FileDefPath),                true,    'Test8.8: Value must match')
    verifyEqual(testCase,       ~isempty(FileDefName),                true,    'Test8.9: Value must match')
    verifyEqual(testCase,          class(FileDefPath),              'char',    'Test8.10:Class must match')
    verifyEqual(testCase,          class(FileDefName),              'char',    'Test8.11:Class must match')
    
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,mycell{i},'.csv');
    verifyEqual(testCase,                           ChkOk,           false,    'Test8.12: Value must match')
    verifyEqual(testCase,            isempty(FileDefPath),            true,    'Test8.13: Value must match')
    verifyEqual(testCase,            isempty(FileDefName),           false,    'Test8.14: Value must match')
    verifyEqual(testCase,          class(FileDefPath),              'char',    'Test8.15: Class must match')
    verifyEqual(testCase,          class(FileDefName),              'char',    'Test8.16: Class must match')
    
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,'',    mycell{i});
    verifyEqual(testCase,                           ChkOk,           false,    'Test8.17:Value must match')
    verifyEqual(testCase,            isempty(FileDefPath),            true,    'Test8.18:Value must match')
    verifyEqual(testCase,            isempty(FileDefName),            true,    'Test8.19:Value must match')
    verifyEqual(testCase,          class(FileDefPath),              'char',    'Test8.20:Class must match')
    verifyEqual(testCase,          class(FileDefName),              'char',    'Test8.21:Class must match')
end


end
%% Test Functions9: CheckFileOptions
function testFunctionNine(testCase)
%This test is expected to success
[ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(',','.',Inf,0);
verifyEqual(testCase,                           ChkOk,                true,    'Test9.1: Value must match')
verifyEqual(testCase,              isempty(ColsDelim),               false,    'Test9.2: Value must match')
verifyEqual(testCase,              isempty(DecsDelim),               false,    'Test9.3: Value must match')
verifyEqual(testCase,                 isempty(nlData),               false,    'Test9.4: Value must match')
verifyEqual(testCase,               isempty(nlOffset),               false,    'Test9.5: Value must match')
verifyEqual(testCase,                  logical(ChkOk),                true,    'Test9.6: Value must match')
verifyEqual(testCase,                class(ColsDelim),              'char',    'Test9.7: Class must match')
verifyEqual(testCase,                class(DecsDelim),              'char',    'Test9.8: Class must match')
verifyEqual(testCase,                   class(nlData),            'double',    'Test9.9: Class must match')
verifyEqual(testCase,                 class(nlOffset),            'double',    'Test9.10:Class must match')

%This test is expected to return empty
mycell= {nan, [], false}; %random different class values
for i= 1:length(mycell)
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(mycell{i},nan,nan,nan);
    verifyEqual(testCase,                           ChkOk,            true,   'Test10.1: Value must match')
    verifyEqual(testCase,              isempty(ColsDelim),           false,   'Test10.2: Value must match')
    verifyEqual(testCase,              isempty(DecsDelim),           false,   'Test10.3: Value must match')
    verifyEqual(testCase,                 isempty(nlData),           false,   'Test10.4: Value must match')
    verifyEqual(testCase,               isempty(nlOffset),           false,   'Test10.5: Value must match')
    verifyEqual(testCase,                  logical(ChkOk),            true,   'Test10.6: Value must match')
    verifyEqual(testCase,                class(ColsDelim),          'char',   'Test10.7: Class must match')
    verifyEqual(testCase,                class(DecsDelim),          'char',   'Test10.8: Class must match')
    verifyEqual(testCase,                   class(nlData),        'double',   'Test10.9: Class must match')
    verifyEqual(testCase,                 class(nlOffset),        'double',  'Test10.10: Class must match')
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(nan,mycell{i},nan,nan);
    verifyEqual(testCase,                           ChkOk,            true,  'Test10.11: Class must match')
    verifyEqual(testCase,              isempty(ColsDelim),           false,  'Test10.12: Value must match')
    verifyEqual(testCase,              isempty(DecsDelim),           false,  'Test10.13: Value must match')
    verifyEqual(testCase,                 isempty(nlData),           false,  'Test10.14: Value must match')
    verifyEqual(testCase,               isempty(nlOffset),           false,  'Test10.15: Value must match')
    verifyEqual(testCase,                  logical(ChkOk),            true,  'Test10.16: Value must match')
    verifyEqual(testCase,                class(ColsDelim),          'char',  'Test10.17: Class must match')
    verifyEqual(testCase,                class(DecsDelim),          'char',  'Test10.18: Class must match')
    verifyEqual(testCase,                   class(nlData),        'double',  'Test10.19: Value must match')
    verifyEqual(testCase,                 class(nlOffset),        'double',  'Test10.20: Value must match')
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(mycell{i},nan,mycell{i},nan);
    verifyEqual(testCase,                           ChkOk,            true,  'Test10.21: Value must match')
    verifyEqual(testCase,                  logical(ChkOk),            true,  'Test10.22: Value must match')
    verifyEqual(testCase,                class(ColsDelim),          'char',  'Test10.23: Class must match')
    verifyEqual(testCase,                class(DecsDelim),          'char',  'Test10.24: Class must match')
    verifyEqual(testCase,                   class(nlData),        'double',  'Test10.25: Value must match')
    verifyEqual(testCase,                 class(nlOffset),        'double',  'Test10.26: Value must match')
    verifyEqual(testCase,              isempty(ColsDelim),           false,  'Test10.27: Value must match')
    verifyEqual(testCase,              isempty(DecsDelim),           false,  'Test10.28: Value must match')
    verifyEqual(testCase,                 isempty(nlData),           false,  'Test10.29: Value must match')
    verifyEqual(testCase,               isempty(nlOffset),           false,  'Test10.30: Value must match')
    
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(nan,nan,nan,mycell{i});
    verifyEqual(testCase,                           ChkOk,            true,  'Test10.31: Value must match')
    verifyEqual(testCase,              isempty(ColsDelim),           false,  'Test10.32: Value must match')
    verifyEqual(testCase,              isempty(DecsDelim),           false,  'Test10.33: Value must match')
    verifyEqual(testCase,                 isempty(nlData),           false,  'Test10.34: Value must match')
    verifyEqual(testCase,               isempty(nlOffset),           false,  'Test10.35: Value must match')
    verifyEqual(testCase,                  logical(ChkOk),            true,  'Test10.36: Value must match')
    verifyEqual(testCase,                class(ColsDelim),          'char',  'Test10.37: Class must match')
    verifyEqual(testCase,                class(DecsDelim),          'char',  'Test10.38: Class must match')
    verifyEqual(testCase,                   class(nlData),        'double',  'Test10.39: Value must match')
    verifyEqual(testCase,                 class(nlOffset),        'double',  'Test10.40: Value must match')
    
end
end

%% Test Functions10: Getparametric
function testFunctionTen(testCase)
%This test is expected to success
[ChkOk,parametricarray] = Getparametric(true,[pwd '\channels.txt'],',','.',Inf,0);
verifyEqual(testCase,                               ChkOk,               1)
verifyEqual(testCase,           class(parametricarray{1}),    'parametric')
verifyEqual(testCase,                      logical(ChkOk),            true)
verifyEqual(testCase,           ~isempty(parametricarray),            true)

% This test is expected to return empty
[ChkOk,parametricarray] = Getparametric(true,'','','',0,1);
verifyEqual(testCase,                                ChkOk,          false)
verifyEqual(testCase,            isempty(parametricarray),            true)
%
% %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,parametricarray] = Getparametric(mycell{i},'','','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('',mycell{i},'','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','',mycell{i},'',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','',mycell{i},0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','','',mycell{i},1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','',nan,nan,mycell{i});
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
end
end

%% Test Functions11: GetChannels
function testFunctionEleven(testCase)
%This test is expected to success
[ChkOk,Chanarray] = GetChannels(true,[pwd '\channels.txt'],',','.',Inf, 0);
verifyEqual(testCase,                             ChkOk,                 1)
verifyEqual(testCase,               class(Chanarray{1}),         'Channel')
verifyEqual(testCase,               ~isempty(Chanarray),              true)

% % This test is expected to return empty
[ChkOk,Chanarray] = GetChannels(true,'','','',0,1);
verifyEqual(testCase,                             ChkOk,             false)
verifyEqual(testCase,                isempty(Chanarray),              true)
% %
% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,Chanarray] = GetChannels(mycell{i},'','','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
    
    [ChkOk,Chanarray] = GetChannels('',mycell{i},'','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
    
    [ChkOk,Chanarray] = GetChannels('','',mycell{i},'',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
    
    [ChkOk,Chanarray] = GetChannels('','','',mycell{i},0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
    
    [ChkOk,Chanarray] = GetChannels('','','','',mycell{i},1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
    
    [ChkOk,Chanarray] = GetChannels('','','',nan,nan,mycell{i});
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(Chanarray),        true)
end

end
%% Test Functions12: ReadFile
function testFunctionTwelve(testCase)
%This test is expected to success
[ChkOk,headers,data] = ReadFile(true,[pwd '\channels.txt'],',','.',Inf, 0);
verifyEqual(testCase,                           ChkOk,                true)
verifyEqual(testCase,                  class(headers),              'cell')
verifyEqual(testCase,                     class(data),            'double')
verifyEqual(testCase,               ~isempty(headers),                true)
verifyEqual(testCase,                  ~isempty(data),                true)

% This test is expected to return empty
[ChkOk,headers,data] = ReadFile(true,'','','',0,1);
verifyEqual(testCase,                          ChkOk,                false)
verifyEqual(testCase,                 class(headers),               'cell')
verifyEqual(testCase,                    class(data),             'double')
verifyEqual(testCase,               isempty(headers),                 true)
verifyEqual(testCase,                  isempty(data),                 true)
% %
% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,headers,data] = ReadFile(mycell{i},'','','',0,1);
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
    
    [ChkOk,headers,data] = ReadFile('',mycell{i},'','',0,1);
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
    
    [ChkOk,headers,data] = ReadFile('','',mycell{i},'',0,1);
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
    
    [ChkOk,headers,data] = ReadFile('','','',mycell{i},0,1);
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
    
    [ChkOk,headers,data] = ReadFile('','','','',mycell{i},1);
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
    
    [ChkOk,headers,data] = ReadFile('','','',nan,nan,mycell{i});
    verifyEqual(testCase,                      ChkOk,                false)
    verifyEqual(testCase,             class(headers),               'cell')
    verifyEqual(testCase,                class(data),             'double')
    verifyEqual(testCase,           isempty(headers),                 true)
    verifyEqual(testCase,              isempty(data),                 true)
end
end
%% Test Functions13: Check_Channel
function testFunctionThirteen(testCase)
%This test is expected to success
[ChkOk,headers,data] = ReadFile(true,[pwd '\channels.txt'],',','.',Inf, 0);
if ChkOk
    [ChkOk, C]       = Check_Channel(headers, data, 'X');
    verifyEqual(testCase,                      ChkOk,                    1)
    verifyEqual(testCase,                   class(C),             'double')
    verifyEqual(testCase,                ~isempty(C),                 true)
end

%This test is expected to ´return empty
[ChkOk, C]       = Check_Channel({}, {}, 'X');
verifyEqual(testCase,                      ChkOk,                    0)
verifyEqual(testCase,                   class(C),             'double')
verifyEqual(testCase,                 isempty(C),                 true)

% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, C]       = Check_Channel({}, {}, 'X');
    verifyEqual(testCase,                      ChkOk,                    0)
    verifyEqual(testCase,                   class(C),             'double')
    verifyEqual(testCase,                 isempty(C),                 true) 
end
end
%% Test Functions14: updateChannelarray
function testFunctionFourteen(testCase)
%This test is expected to success
[~,Chanarray] = GetChannels(    true,[pwd '\channels.txt'],',','.',Inf, 0);
[ChkOk,headers,data] = ReadFile(true,[pwd '\channels.txt'],',','.',Inf, 0);
if ChkOk
    %This test is expected to success
    [ChkOk,updatedarray] = updateChannelarray(Chanarray, headers,    data);
    verifyEqual(testCase,                      ChkOk,                 true)
    verifyEqual(testCase,        class(updatedarray),               'cell')
    verifyEqual(testCase,     ~isempty(updatedarray),                 true)
end
updatedarray = {}; %#ok<NASGU> %Clear memory
%This test is expected to success
[ChkOk,updatedarray]     = updateChannelarray({}, headers,           data);
verifyEqual(testCase,                          ChkOk,                 true)
verifyEqual(testCase,            class(updatedarray),               'cell')
verifyEqual(testCase,          isempty(updatedarray),                false)

updatedarray = {}; %#ok<NASGU> %Clear memory
%This test is expected to return zero.
[ChkOk,updatedarray]     = updateChannelarray({}, '',                  '');
verifyEqual(testCase,                          ChkOk,                false)
verifyEqual(testCase,            class(updatedarray),               'cell')
verifyEqual(testCase,          isempty(updatedarray),                 true)

% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,updatedarray]     = updateChannelarray(mycell{i}, '',       '');
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
    
    [ChkOk,updatedarray]     = updateChannelarray(mycell{i}, '',       '');
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
    
    [ChkOk,updatedarray]     = updateChannelarray(mycell{i}, '',       '');
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
end

end


%% Test Functions15: updateparametricarray
function testFunctionFifteen(testCase)
%This test is expected to success
[~,Parametarray] = GetChannels( true,[pwd '\parameters.txt'],',','.',Inf, 0);
[ChkOk,headers,data] = ReadFile(true,[pwd '\parameters.txt'],',','.',Inf, 0);
if ChkOk
    %This test is expected to success
    [ChkOk,updatedarray] = updateparametricarray(Parametarray, headers, data);
    verifyEqual(testCase,                      ChkOk,                 true)
    verifyEqual(testCase,        class(updatedarray),               'cell')
    verifyEqual(testCase,     ~isempty(updatedarray),                 true)
end

updatedarray = {}; %#ok<NASGU> %Clear memory
%This test is expected to success
[ChkOk,updatedarray]     = updateparametricarray({}, headers,        data);
verifyEqual(testCase,                          ChkOk,                true)
verifyEqual(testCase,            class(updatedarray),               'cell')
verifyEqual(testCase,          isempty(updatedarray),                false)

updatedarray = {}; %#ok<NASGU> %Clear memory
%This test is expected to return zero.
[ChkOk,updatedarray]     = updateparametricarray({},     '',           '');
verifyEqual(testCase,                          ChkOk,                false)
verifyEqual(testCase,            class(updatedarray),               'cell')
verifyEqual(testCase,          isempty(updatedarray),                 true)

% %This test is expected to return empty
mycell = {nan, [], false}; %random different class values
for i=1:length(mycell)
    [ChkOk,updatedarray]     = updateparametricarray(mycell{i}, '',    '');
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
    
    [ChkOk,updatedarray]     = updateparametricarray('', mycell{i},    '');
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
    
    [ChkOk,updatedarray]     = updateparametricarray('', '',    mycell{i});
    verifyEqual(testCase,                          ChkOk,            false)
    verifyEqual(testCase,            class(updatedarray),           'cell')
    verifyEqual(testCase,          isempty(updatedarray),             true)
end


end

%% Test Functions16: Getparametric
function testFunctionSixteen(testCase)

% %This test is expected to success
[ChkOk,parametricarray] = Getparametric(true,[pwd '\parameters.txt'],',','.',Inf, 0);
verifyEqual(testCase,                             ChkOk,                 1)
verifyEqual(testCase,         class(parametricarray{1}),      'parametric')
verifyEqual(testCase,         ~isempty(parametricarray),              true)

% % This test is expected to return empty
[ChkOk,parametricarray] = Getparametric(true,     '',    '',    '', 0,  1);
verifyEqual(testCase,                             ChkOk,             false)
verifyEqual(testCase,          isempty(parametricarray),              true)
% %
% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,parametricarray] = Getparametric(mycell{i},'','','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('',mycell{i},'','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','',mycell{i},'',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','',mycell{i},0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','','',mycell{i},1);
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
    
    [ChkOk,parametricarray] = Getparametric('','','',nan,nan,mycell{i});
    verifyEqual(testCase,                               ChkOk,       false)
    verifyEqual(testCase,            isempty(parametricarray),        true)
end

end

%% Test Functions17: Check_parametric
function testFunctionSeventeen(testCase)

% %This test is expected to success
[ChkOk,headers,data] = ReadFile(true,[pwd '\parameters.txt'],',','.',Inf, 0);
if ChkOk
    [ChkOk, m]       = Check_parametric(headers,data,          headers{1});
    verifyEqual(testCase,              ChkOk,                           1)
    verifyEqual(testCase,           class(m),                     'double')
    verifyEqual(testCase,        ~isempty(m),                         true)
end

%This test is expected to ´return empty
[ChkOk, m]           = Check_parametric({},  {},               headers{1});
verifyEqual(testCase,                  ChkOk,                            0)
verifyEqual(testCase,               class(m),                     'double')
verifyEqual(testCase,             isempty(m),                         true)


% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, m]       = Check_parametric(mycell{i},{},          headers{1});
    verifyEqual(testCase,                      ChkOk,                    0)
    verifyEqual(testCase,                   class(m),             'double')
    verifyEqual(testCase,                 isempty(m),                 true)
    
    [ChkOk, m]       = Check_parametric({},mycell{i},          headers{1});
    verifyEqual(testCase,                      ChkOk,                    0)
    verifyEqual(testCase,                   class(m),             'double')
    verifyEqual(testCase,                 isempty(m),                 true)
    
    [ChkOk, m]       = Check_parametric({},       {},           mycell{i});
    verifyEqual(testCase,                      ChkOk,                    0)
    verifyEqual(testCase,                   class(m),             'double')
    verifyEqual(testCase,                 isempty(m),                 true)
end
    
end


%% Test Functions18: LoadButtonPushed
function testFunctionEighteen(testCase) %#ok<INUSD>

% %--------------------------------------------------------------------------
% Channel.txt must be manually selected to test this function.
% ChkOk = false;
% headers = {};  %clear memory
% data    = {};  %clear memory
% 
% [ChkOk,headers, data] = LoadButtonPushed(',','.',Inf, 0); 
% 
% %This test is expected to success
% if ChkOk
%     verifyEqual(testCase,             class(headers),               'cell')
%     verifyEqual(testCase,          ~isempty(headers),                 true)
%     verifyEqual(testCase,                class(data),             'double')
%     verifyEqual(testCase,             ~isempty(data),                 true)
% end
% 
% %This test is expected to return empty
% verifyEqual(testCase,                 class(headers),               'cell')
% verifyEqual(testCase,               isempty(headers),                 true)
% verifyEqual(testCase,                    class(data),             'double')
% verifyEqual(testCase,                  isempty(data),                 true)
% %--------------------------------------------------------------------------

    
end

%% Test Functions19: WriteFile_ASCII
function testFunctionNineteen(testCase)
% %This test is expected to success
[ChkOk,Chanarray] = GetChannels(true,[pwd '\channels.txt'],',','.',Inf, 0);
if ChkOk
    [ChkOk] = WriteFile_ASCII(false, Chanarray,[pwd '\AAAA.txt'],'.txt',',','.',Inf);
    verifyEqual(testCase,                ChkOk,                       true)
    tmp_name = [pwd '\AAAA.txt'];
    delete(tmp_name) %delete the temporarily created file.
end

% % %This test is expected to return false
% [ChkOk]     = WriteFile_ASCII(false,{}, '', ',',    '.',    Inf,        0);
% verifyEqual(testCase,                    ChkOk,                      false)
% 
% % %This test is expected to return empty
% s='A':'J';
% str=s(randi(numel(s)));
% mycell = {nan, [], false, str}; %random different class values
% for i=1:length(mycell)
%     ChkOk = WriteFile_ASCII(mycell{i},'','',0,1,nan,'');
%     verifyEqual(testCase,                ChkOk,                      false)
%     
%     ChkOk = WriteFile_ASCII('',mycell{i},'','','',0,1);
%     verifyEqual(testCase,                ChkOk,                      false)
%     
%     ChkOk = WriteFile_ASCII('','',mycell{i},'',0,1,'');
%     verifyEqual(testCase,                ChkOk,                      false)
%     
%     ChkOk = WriteFile_ASCII('','','',mycell{i},'',0,1);
%     verifyEqual(testCase,                ChkOk,                      false)
%     
%     ChkOk = WriteFile_ASCII('','','','',mycell{i},'',1);
%     verifyEqual(testCase,                ChkOk,                      false)
%     
%     ChkOk = WriteFile_ASCII('','','',nan,nan,mycell{i},'');
%     verifyEqual(testCase,                ChkOk,                      false)
% 
%     ChkOk = WriteFile_ASCII('','','',nan,nan,'', mycell{i});
%     verifyEqual(testCase,                ChkOk,                      false)
% 
% end

end

%% Test Functions20: parametric
function testFunctionTwenty(testCase)

% %This test is expected to return empty Channel
Example    = parametric('');
verifyEqual(testCase,            class(Example),              'parametric', 'Error 22.0: parametric class was expected')
verifyEqual(testCase,GetparametricNames(Example),                     {''}, 'Error 22.1: parametric was expected empty')
verifyEqual(testCase,GetparametricName(Example),                        '', 'Error 22.2: parametric was expected empty')
verifyEqual(testCase,GetParamDataByName(Example),                       [], 'Error 22.3: parametric data was incorrect')
verifyEqual(testCase,          LenData(Example),                         0, 'Error 21.4: parametric data was incorrect')
verifyEqual(testCase,          Example.Comments,                        {}, 'Error 22.8: parametric comment was incorrect')


% %This test is expected to return empty
Example = parametric('Velocity','m/s','Velocity','m/s',[1 2 3],'');
verifyEqual(testCase,            class(Example),              'parametric', 'Error 22.00: parametric class was expected')
verifyEqual(testCase,GetparametricNames(Example),             {'Velocity'}, 'Error 22.10: parametric was expected empty')
verifyEqual(testCase, GetparametricName(Example),               'Velocity', 'Error 22.20: parametric was expected empty')
verifyEqual(testCase,GetParamDataByName(Example,'Velocity'),       [1 2 3], 'Error 22.30: parametric data was incorrect')
verifyEqual(testCase,          LenData(Example),                         3, 'Error 22.40: Channel data was incorrect')
Example= AddComment(Example,'New Parametric');
verifyEqual(testCase,         Example.Comments,         {'New Parametric'}, 'Error 22.50: parametric comment was incorrect')


%This test is expected to return empty
Example    = parametric(false,false,false,false,false,false); %check incorrect input
verifyEqual(testCase,           class(Example),               'parametric', 'Error 21.000: parametric class was expected')
verifyEqual(testCase,GetparametricNames(Example),                     {''}, 'Error 21.100: parametric was expected empty')
verifyEqual(testCase,GetparametricName(Example),                        '', 'Error 21.200: parametric was expected empty')
verifyEqual(testCase,GetParamDataByName(Example),                       [], 'Error 21.300: parametric data was incorrect')
verifyEqual(testCase,          LenData(Example),                         0, 'Error 21.400: Channel data was incorrect')
verifyEqual(testCase,         Example.Comments,                         {}, 'Error 21.500: parametric comment was incorrect')
end

%% Test Functions21: Channel
function testFunctionTwentyOne(testCase)

% %This test is expected to return empty Channel
Example    = Channel('');
verifyEqual(testCase,            class(Example),                 'Channel', 'Error 21.0: Channel class was expected')
verifyEqual(testCase,  GetChannelNames(Example),                      {''}, 'Error 21.1: Channel was expected empty')
verifyEqual(testCase,   GetChannelName(Example),                        '', 'Error 21.2: Channel was expected empty')
verifyEqual(testCase,GetChanDataByName(Example),                        [], 'Error 21.3: Channel data was incorrect')
verifyEqual(testCase,          LenData(Example),                         0, 'Error 21.4: Channel data was incorrect')
verifyEqual(testCase,       MinLenData(Example),                         0, 'Error 21.5: Channel data was incorrect')
verifyEqual(testCase,              Min(Example),                        [], 'Error 21.6: Channel data was incorrect')
verifyEqual(testCase,              Max(Example),                        [], 'Error 21.7: Channel data was incorrect')
verifyEqual(testCase,          Example.Comments,                        {}, 'Error 21.8: Channel comment was incorrect')


% %This test is expected to return empty
Example = Channel('Velocity','m/s','Velocity','m/s',[1 2 3],'');
verifyEqual(testCase,            class(Example),                 'Channel', 'Error 21.00: Channel class was expected')
verifyEqual(testCase,  GetChannelNames(Example),              {'Velocity'}, 'Error 21.10: Channel was expected empty')
verifyEqual(testCase,   GetChannelName(Example),                'Velocity', 'Error 21.20: Channel was expected empty')
verifyEqual(testCase, GetChanDataByName(Example,'Velocity'),       [1 2 3], 'Error 21.30: Channel data was incorrect')
verifyEqual(testCase,        (LenData(Example)),                         3, 'Error 21.40: Channel data was incorrect')
verifyEqual(testCase,       MinLenData(Example),                         3, 'Error 21.50: Channel data was incorrect')
verifyEqual(testCase,              Min(Example),                         1, 'Error 21.60: Channel data was incorrect')
verifyEqual(testCase,              Max(Example),                         3, 'Error 21.70: Channel data was incorrect')
Example= AddComment(Example,'New Channel');
verifyEqual(testCase,          Example.Comments,           {'New Channel'}, 'Error 21.80: Channel comment was incorrect')


%This test is expected to return empty
Example    = Channel(false,false,false,false,false,false); %check incorrect input
verifyEqual(testCase,            class(Example),                 'Channel', 'Error 21.000: Channel class was expected')
verifyEqual(testCase,  GetChannelNames(Example),                      {''}, 'Error 21.100: Channel was expected empty')
verifyEqual(testCase,   GetChannelName(Example),                        '', 'Error 21.200: Channel was expected empty')
verifyEqual(testCase,GetChanDataByName(Example),                        [], 'Error 21.300: Channel data was incorrect')
verifyEqual(testCase,          LenData(Example),                         0, 'Error 21.400: Channel data was incorrect')
verifyEqual(testCase,       MinLenData(Example),                         0, 'Error 21.500: Channel data was incorrect')
verifyEqual(testCase,              Min(Example),                        [], 'Error 21.600: Channel data was incorrect')
verifyEqual(testCase,              Max(Example),                        [], 'Error 21.700: Channel data was incorrect')
verifyEqual(testCase,          Example.Comments,                        {}, 'Error 21.800: Channel comment was incorrect')

end



% %% Optional file fixtures  
% function setupOnce(testCase)  % do not change function name
% % set a new path, for example
% end
% 
% function teardownOnce(testCase)  % do not change function name
% % change back to original path, for example
% end
% 
% %% Optional fresh fixtures  
% function setup(testCase)  % do not change function name
% % open a figure, for example
% end
% 
% function teardown(testCase)  % do not change function name
% % close figure, for example
% end


