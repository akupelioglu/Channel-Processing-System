
%% Main function to generate tests
function tests = test
tests = functiontests(localfunctions);
end


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
verifyEqual(testCase,  ChkOk,               true,     "Test1: Value must match.");
verifyEqual(testCase,  class(headers),    'cell',   "Test1: Classes must match.");
verifyEqual(testCase,  class(data),     'double',   "Test1: Classes must match.");

%This test is expected to return empty
% [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
[ChkOk,headers,data] = ReadFile_ASCII(0,'',',','.',Inf,0);
verifyEqual(testCase, ChkOk,             false,     "Test1: Value must match.");
verifyEqual(testCase, headers,              {},   "Test1: Classes must match.");
verifyEqual(testCase, data,                 [],   "Test1: Classes must match.");
%
%This test is expected to return empty
% [ChkOk,headers,data] = ReadFile_ASCII(boolUserInput,FileName,colsdelim_,decsdelim_,nLinesData_,nLinesOffset_)
for i=1:length(mycell)
    [ChkOk,headers,data] = ReadFile_ASCII(false,mycell{i},',','.',Inf,0);
    verifyEqual(testCase, ChkOk,              false,   "Test1: Classes must match.");
    verifyEqual(testCase, headers,               {},   "Test1: Classes must match.");
    verifyEqual(testCase, data,                  [],   "Test1: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',mycell{i},'.',Inf,0);
    verifyEqual(testCase, ChkOk,              false,   "Test1: Classes must match.");
    verifyEqual(testCase, headers,               {},   "Test1: Classes must match.");
    verifyEqual(testCase, data,                  [],   "Test1: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',',mycell{i},Inf,0);
    verifyEqual(testCase, ChkOk,              false,   "Test1: Classes must match.");
    verifyEqual(testCase, headers,               {},   "Test1: Classes must match.");
    verifyEqual(testCase, data,                  [],   "Test1: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',','.',mycell{i},0);
    verifyEqual(testCase, ChkOk,              false,   "Test1: Classes must match.");
    verifyEqual(testCase, headers,               {},   "Test1: Classes must match.");
    verifyEqual(testCase, data,                  [],   "Test1: Classes must match.");
    [ChkOk,headers,data] = ReadFile_ASCII(false,'',',','.',Inf,mycell{i});
    verifyEqual(testCase, ChkOk,              false,   "Test1: Classes must match.");
    verifyEqual(testCase, headers,               {},   "Test1: Classes must match.");
    verifyEqual(testCase, data,                  [],   "Test1: Classes must match.");
end
end
%% Test Functions2: function1
function testFunctionTwo(testCase)

X = [1 2 3];
% Test specific code
%This test is expected to success
[ChkOk, Y] = function1(1, X, 2);
verifyEqual(testCase, ChkOk, 1,            'Test2: Value must match')
verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
verifyEqual(testCase, Y, [3 4 5],          'Test2: Value must match')

%This test is expected to success
X = randi([0 100], 1,100);
[ChkOk, Y] = function1(1, X, 0);
verifyEqual(testCase, ChkOk, 1,            'Test2: Value must match')
verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
verifyEqual(testCase, Y, X,                'Test2: Value must match')

%This test is expected to return empty
X = randi([0 100], 1,100);
[ChkOk, Y] = function1(0, X, 0);
verifyEqual(testCase, ChkOk, 1,            'Test2: Value must match')
verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
verifyEqual(testCase, Y, X.*0,             'Test2: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, Y] = function1(mycell{i}, X, 0);
    verifyEqual(testCase, ChkOk, 0,            'Test2: Value must match')
    verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
    verifyEqual(testCase, Y, [],               'Test2: Value must match')
    [ChkOk, Y] = function1(0, mycell{i}, 0);
    verifyEqual(testCase, ChkOk, 0,            'Test2: Value must match')
    verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
    verifyEqual(testCase, Y, [],               'Test2: Value must match')
    [ChkOk, Y] = function1(0, X, mycell{i});
    verifyEqual(testCase, ChkOk, 0,            'Test2: Value must match')
    verifyEqual(testCase, class(Y),  'double', 'Test2: Class must match')
    verifyEqual(testCase, Y, [],               'Test2: Value must match')
end
end
%% Test Functions3: function2
function testFunctionThree(testCase)

A = [1 2 3];
Y = [1 2 3];
% Test specific code
[ChkOk, B, b] = function2(A, Y);
verifyEqual(testCase,   ChkOk,           1,  'Test3: Value must match')
verifyEqual(testCase,   class(B), 'double',  'Test3: Class must match')
verifyEqual(testCase,   class(b), 'double',  'Test3: Class must match')
verifyEqual(testCase,   B,             A+Y,  'Test3: Value must match')
verifyEqual(testCase,   b,       mean(A+Y),  'Test3: Value must match')

% Test specific code
%This test is expected to return empty
A = [];
Y = [];
[ChkOk, B, b] = function2(A, Y);
verifyEqual(testCase,   ChkOk,           0,  'Test3: Value must match')
verifyEqual(testCase,   class(B), 'double',  'Test3: Class must match')
verifyEqual(testCase,   class(b), 'double',  'Test3: Class must match')
verifyEqual(testCase,   B,              [],  'Test3: Value must match')
verifyEqual(testCase,   b,              [],  'Test3: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,        0,   'Test3: Value must match')
    verifyEqual(testCase,   B,         [],   'Test3: Value must match')
    verifyEqual(testCase,   b,         [],   'Test3: Value must match')
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,        0,   'Test3: Value must match')
    verifyEqual(testCase,   B,         [],   'Test3: Value must match')
    verifyEqual(testCase,   b,         [],   'Test3: Value must match')
    [ChkOk, B, b] = function2(A, Y);
    verifyEqual(testCase, ChkOk,        0,   'Test3: Value must match')
    verifyEqual(testCase,   B,         [],   'Test3: Value must match')
    verifyEqual(testCase,   b,         [],   'Test3: Value must match')
end
end
%% Test Functions4: function3
function testFunctionFour(testCase)
X = [1 2 4];
% Test specific code
[ChkOk, A] = function3(X);
%This test is expected to success
verifyEqual(testCase,   ChkOk,            1, 'Test4: Value must match')
verifyEqual(testCase,   class(A), 'double',  'Test4: Class must match')
verifyEqual(testCase,   A,     [1 0.5 0.25], 'Test4: Value must match')
%
% Test specific code
%This test is expected to success
[ChkOk, A] = function3(X);
verifyEqual(testCase,   ChkOk,            1, 'Test4: Value must match')
verifyEqual(testCase,   A,             1./X, 'Test4: Value must match')


%This test is expected to return empty
X = [];
[ChkOk, A] = function3(X);
verifyEqual(testCase,   ChkOk,            0, 'Test4: Class must match')
verifyEqual(testCase,   class(A), 'double',  'Test4: Class must match')
verifyEqual(testCase,   A,               [], 'Test4: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, A] = function3(mycell{i});
    verifyEqual(testCase, ChkOk,          0, 'Test4: Value must match')
    verifyEqual(testCase, A,             [], 'Test4: Value must match')
end
end
%% Test Functions5: function4
function testFunctionFive(testCase)
% Test specific code
%This test is expected to success
X = [1 2];
b = [1 2];
[ChkOk, C] = function4(X,b);
verifyEqual(testCase, ChkOk,              1, 'Test5: Value must match')
verifyEqual(testCase, class(C),    'double', 'Test5: Class must match')
verifyEqual(testCase, C,              [2 4], 'Test5: Value must match')

%This test is expected to return empty
X = [];
b = [];
[ChkOk, C] = function4(X,b);
verifyEqual(testCase,   ChkOk,            0, 'Test5: Value must match')
verifyEqual(testCase,   class(C), 'double',  'Test5: Class must match')
verifyEqual(testCase,   C,               [], 'Test5: Value must match')

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], true, false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk, C] = function4(mycell{i},b);
    verifyEqual(testCase, ChkOk, 0,          'Test5: Value must match')
    verifyEqual(testCase, C,    [],          'Test5: Value must match')
    
    [ChkOk, C] = function4(X, mycell{i});
    verifyEqual(testCase, ChkOk, 0,          'Test5: Value must match')
    verifyEqual(testCase, C,    [],          'Test5: Value must match')
end
end
%% Test Functions6: Chk_Path
function testFunctionSix(testCase)
%This test is expected to success
[ChkOk, Path] = Chk_Path(false,                     pwd,            false);
verifyEqual(testCase,                             ChkOk,             true)
verifyEqual(testCase,                       class(Path),           'char')
verifyEqual(testCase,                    ~isempty(Path),             true)

%This test is expected to return empty
currentfolder = pwd;
[ChkOk, Path] = Chk_Path(false,[currentfolder '\randomName'],        true);
verifyEqual(testCase,                               ChkOk,           true)
verifyEqual(testCase,                       isempty(Path),          false)

%This test is expected to success
[ChkOk, Path] = Chk_Path(false,                         '',          true);
verifyEqual(testCase,                               ChkOk,          false)
verifyEqual(testCase,                       isempty(Path),           true)


%This test is expected to return empty
mycell= {[], false}; %random different class values
for i=1:length(mycell)
    [ChkOk, Path] = Chk_Path(mycell{i},                '',          false);
    verifyEqual(testCase,                           ChkOk,          false)
    verifyEqual(testCase,                   isempty(Path),           true)
    [ChkOk, Path] = Chk_Path(false,             mycell{i},          false);
    verifyEqual(testCase,                           ChkOk,          false)
    verifyEqual(testCase,                   isempty(Path),           true)
    [ChkOk, Path] = Chk_Path(false,                    '',      mycell{i});
    verifyEqual(testCase,                           ChkOk,          false)
    verifyEqual(testCase,                   isempty(Path),           true)
end

end

%% Test Functions7: Chk_InputFile
function testFunctionSeven(testCase)
%This test is expected to success
ChkOk = Chk_InputFile([pwd '\channels.txt'],                       '.txt');
verifyEqual(testCase,                           ChkOk,               true)

%This test is expected to return empty
ChkOk = Chk_InputFile('','.txt');
verifyEqual(testCase,                           ChkOk,              false)

%This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell= {[], str, false}; %random different class values
for i=1:length(mycell)
    
    ChkOk = Chk_InputFile(mycell{i},                               '.txt');
    verifyEqual(testCase,                           ChkOk,          false)
    
    ChkOk = Chk_InputFile(mycell{i});
    verifyEqual(testCase,                           ChkOk,          false)
    
end

end

%% Test Functions8: Chk_OutputFile
function testFunctionEight(testCase)
%This test is expected to success
[ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,[pwd '\channels.txt'],'.txt');
verifyEqual(testCase,                           ChkOk,                true)
verifyEqual(testCase,           ~isempty(FileDefPath),                true)
verifyEqual(testCase,           ~isempty(FileDefName),                true)

%This test is expected to success
[ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,[pwd '\channels.txt'],'.csv');
verifyEqual(testCase,                           ChkOk,                true)
verifyEqual(testCase,           ~isempty(FileDefPath),                true)
verifyEqual(testCase,           ~isempty(FileDefName),                true)

%This test is expected to return empty
mycell= {[], false}; %random different class values
for i= 1:length(mycell)
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(mycell{i},[pwd '\channels.txt'],'.csv');
    verifyEqual(testCase,                       ChkOk,                true)
    verifyEqual(testCase,       ~isempty(FileDefPath),                true)
    verifyEqual(testCase,       ~isempty(FileDefName),                true)
    verifyEqual(testCase,          class(FileDefPath),              'char')
    verifyEqual(testCase,          class(FileDefName),              'char')
    
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,mycell{i},'.csv');
    verifyEqual(testCase,                           ChkOk,           false)
    verifyEqual(testCase,            isempty(FileDefPath),            true)
    verifyEqual(testCase,            isempty(FileDefName),           false)
    verifyEqual(testCase,          class(FileDefPath),              'char')
    verifyEqual(testCase,          class(FileDefName),              'char')
    
    [ChkOk, FileDefPath, FileDefName] = Chk_OutputFile(false,'',    mycell{i});
    verifyEqual(testCase,                           ChkOk,           false)
    verifyEqual(testCase,            isempty(FileDefPath),            true)
    verifyEqual(testCase,            isempty(FileDefName),            true)
    verifyEqual(testCase,          class(FileDefPath),              'char')
    verifyEqual(testCase,          class(FileDefName),              'char')
end


end
%% Test Functions9: CheckFileOptions
function testFunctionNine(testCase)
%This test is expected to success
[ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(',','.',Inf,0);
verifyEqual(testCase,                           ChkOk,                true)
verifyEqual(testCase,              isempty(ColsDelim),               false)
verifyEqual(testCase,              isempty(DecsDelim),               false)
verifyEqual(testCase,                 isempty(nlData),               false)
verifyEqual(testCase,               isempty(nlOffset),               false)
verifyEqual(testCase,                  logical(ChkOk),                true)
verifyEqual(testCase,                class(ColsDelim),              'char')
verifyEqual(testCase,                class(DecsDelim),              'char')
verifyEqual(testCase,                   class(nlData),            'double')
verifyEqual(testCase,                 class(nlOffset),            'double')

%This test is expected to return empty
mycell= {nan, [], false}; %random different class values
for i= 1:length(mycell)
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(mycell{i},nan,nan,nan);
    verifyEqual(testCase,                           ChkOk,            true)
    verifyEqual(testCase,              isempty(ColsDelim),           false)
    verifyEqual(testCase,              isempty(DecsDelim),           false)
    verifyEqual(testCase,                 isempty(nlData),           false)
    verifyEqual(testCase,               isempty(nlOffset),           false)
    verifyEqual(testCase,                  logical(ChkOk),            true)
    verifyEqual(testCase,                class(ColsDelim),          'char')
    verifyEqual(testCase,                class(DecsDelim),          'char')
    verifyEqual(testCase,                   class(nlData),        'double')
    verifyEqual(testCase,                 class(nlOffset),        'double')
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(nan,mycell{i},nan,nan);
    verifyEqual(testCase,                           ChkOk,            true)
    verifyEqual(testCase,              isempty(ColsDelim),           false)
    verifyEqual(testCase,              isempty(DecsDelim),           false)
    verifyEqual(testCase,                 isempty(nlData),           false)
    verifyEqual(testCase,               isempty(nlOffset),           false)
    verifyEqual(testCase,                  logical(ChkOk),            true)
    verifyEqual(testCase,                class(ColsDelim),          'char')
    verifyEqual(testCase,                class(DecsDelim),          'char')
    verifyEqual(testCase,                   class(nlData),        'double')
    verifyEqual(testCase,                 class(nlOffset),        'double')
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(mycell{i},nan,mycell{i},nan);
    verifyEqual(testCase,                           ChkOk,            true)
    verifyEqual(testCase,                  logical(ChkOk),            true)
    verifyEqual(testCase,                class(ColsDelim),          'char')
    verifyEqual(testCase,                class(DecsDelim),          'char')
    verifyEqual(testCase,                   class(nlData),        'double')
    verifyEqual(testCase,                 class(nlOffset),        'double')
    verifyEqual(testCase,              isempty(ColsDelim),           false)
    verifyEqual(testCase,              isempty(DecsDelim),           false)
    verifyEqual(testCase,                 isempty(nlData),           false)
    verifyEqual(testCase,               isempty(nlOffset),           false)
    
    
    [ChkOk,ColsDelim,DecsDelim,nlData,nlOffset] = CheckFileOptions(nan,nan,nan,mycell{i});
    verifyEqual(testCase,                           ChkOk,            true)
    verifyEqual(testCase,              isempty(ColsDelim),           false)
    verifyEqual(testCase,              isempty(DecsDelim),           false)
    verifyEqual(testCase,                 isempty(nlData),           false)
    verifyEqual(testCase,               isempty(nlOffset),           false)
    verifyEqual(testCase,                  logical(ChkOk),            true)
    verifyEqual(testCase,                class(ColsDelim),          'char')
    verifyEqual(testCase,                class(DecsDelim),          'char')
    verifyEqual(testCase,                   class(nlData),        'double')
    verifyEqual(testCase,                 class(nlOffset),        'double')
    
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
%% Test Functions13: ReadFile
function testFunctionThirteen(testCase)
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
verifyEqual(testCase,                  class(headers),              'cell')
verifyEqual(testCase,                     class(data),            'double')
verifyEqual(testCase,               isempty(headers),                 true)
verifyEqual(testCase,                  isempty(data),                 true)
% %
% % %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    [ChkOk,headers,data] = ReadFile(mycell{i},'','','',0,1);
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
    
    [ChkOk,headers,data] = ReadFile('',mycell{i},'','',0,1);
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
    
    [ChkOk,headers,data] = ReadFile('','',mycell{i},'',0,1);
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
    
    [ChkOk,headers,data] = ReadFile('','','',mycell{i},0,1);
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
    
    [ChkOk,headers,data] = ReadFile('','','','',mycell{i},1);
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
    
    [ChkOk,headers,data] = ReadFile('','','',nan,nan,mycell{i});
    verifyEqual(testCase,                         ChkOk,             false)
    verifyEqual(testCase,                  class(headers),          'cell')
    verifyEqual(testCase,                     class(data),        'double')
    verifyEqual(testCase,               isempty(headers),             true)
    verifyEqual(testCase,                  isempty(data),             true)
end
end
%% Test Functions14: Check_Channel
function testFunctionFourteen(testCase)
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


%% Test Functions15: updateChannelarray
function testFunctionFifteen(testCase)
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

%% Test Functions16: updateparametricarray
function testFunctionSixteen(testCase)

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

%% Test Functions17: Getparametric
function testFunctionSeventeen(testCase)

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


%% Test Functions18: Check_parametric
function testFunctionEighteen(testCase)

% %This test is expected to success
[ChkOk,headers,data] = ReadFile(true,[pwd '\parameters.txt'],',','.',Inf, 0);
if ChkOk
    [ChkOk, m]       = Check_parametric(headers,data,          headers{1});
    verifyEqual(testCase,                      ChkOk,                    1)
    verifyEqual(testCase,                   class(m),             'double')
    verifyEqual(testCase,                ~isempty(m),                 true)
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

%% Test Functions19: LoadButtonPushed
function testFunctionNineteen(~)
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

% % Test Functions20: WriteFile_ASCII
function testFunctionTwenty(testCase)
% %This test is expected to success
[ChkOk,Chanarray] = GetChannels(true,[pwd '\channels.txt'],',','.',Inf, 0);
if ChkOk
    [ChkOk] = WriteFile_ASCII(false, Chanarray,[pwd '\parameters.txt'],',','.',Inf, 0);
    verifyEqual(testCase,                      ChkOk,                 true)
end

% %This test is expected to return false
[ChkOk]     = WriteFile_ASCII(false,{}, '', ',',    '.',    Inf,        0);
verifyEqual(testCase,                      ChkOk,                    false)

% %This test is expected to return empty
s='A':'J';
str=s(randi(numel(s)));
mycell = {nan, [], false, str}; %random different class values
for i=1:length(mycell)
    ChkOk = WriteFile_ASCII(mycell{i},'','',0,1,nan,'');
    verifyEqual(testCase,                               ChkOk,       false)
    
    ChkOk = WriteFile_ASCII('',mycell{i},'','','',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    
    ChkOk = WriteFile_ASCII('','',mycell{i},'',0,1,'');
    verifyEqual(testCase,                               ChkOk,       false)
    
    ChkOk = WriteFile_ASCII('','','',mycell{i},'',0,1);
    verifyEqual(testCase,                               ChkOk,       false)
    
    ChkOk = WriteFile_ASCII('','','','',mycell{i},'',1);
    verifyEqual(testCase,                               ChkOk,       false)
    
    ChkOk = WriteFile_ASCII('','','',nan,nan,mycell{i},'');
    verifyEqual(testCase,                               ChkOk,       false)

    ChkOk = WriteFile_ASCII('','','',nan,nan,'', mycell{i});
    verifyEqual(testCase,                               ChkOk,       false)

end
end

% % Test Functions21: Channel
function testFunctionTwentyOne(testCase)
% %This test is expected to success
Example = Channel('');
verifyEqual(testCase,             class(Example),                'Channel')
Get_fields = fields(Example);
for i=1:length(Get_fields)
    verifyEqual(testCase, isempty(Get_fields{i}),                     true)
end
[ChkOk,Chanarray] = GetChannels(true,[pwd '\channels.txt'],',','.',Inf, 0);
% % % %This test is expected to return empty
% s='A':'J';
% str=s(randi(numel(s)));
% mycell = {nan, [], false, str}; %random different class values

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


