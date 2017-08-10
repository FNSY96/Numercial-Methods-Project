function varargout = Part2NumericalAnalysis(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Part2NumericalAnalysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Part2NumericalAnalysis_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Part2NumericalAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Part2NumericalAnalysis_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbuttonFile_Callback(hObject, eventdata, handles)
set(handles.result, 'Visible','On');
set(handles.result1, 'Visible','Off');
set(handles.result2, 'Visible','Off');
set(handles.result3, 'Visible','Off');
set(handles.textStatic, 'Visible','On');
set(handles.initialPointText,'Visible','Off');
set(handles.initialPointStaticText,'Visible','Off');
set(handles.iterationStaticText,'Visible','Off');
set(handles.iterationtext,'Visible','Off');
set(handles.precisionStatictext,'Visible','Off');
set(handles.precisionText,'Visible','Off');
path = get(handles.pathFileText, 'String'); 
[methodName,time,mesg,answer,errors,rootsGauss,rootsJordan,rootsLU,rootsSeidel,errorsSeidel]  = fileOperations (path, 'null')
if(isempty(mesg))
if(strcmpi(methodName,'gauss'))
    result='';
    arrayLength=length(answer);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(answer(i)),','];
    end
     result=[result,'time = ',num2str(time)]
    set(handles.result, 'String',result);
elseif(strcmpi(methodName,'gauss jordan'))
    result='';
    arrayLength=length(answer);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(answer(i)),','];
    end
     result=[result,'time = ',num2str(time)]
    set(handles.result, 'String',result);
elseif(strcmpi(methodName,'LU decomposition'))
    result='';
    arrayLength=length(answer);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(answer(i)),','];
    end
     result=[result,'time = ',num2str(time)]
    set(handles.result, 'String',result);
elseif(strcmpi(methodName,'gauss seidel'))
    result='';
    for i=1:size(answer,1)
           for j=1:size(answer,2)
               result=[result,'itr',num2str(j),': x',num2str(i),'=',num2str(answer(i,j)),','];
           end
    end
       for i=1:size(errors,1)
           for j=1:size(errors,2)
               result=[result,'itr',num2str(j),': error',num2str(i),'=',num2str(errors(i,j)),','];
           end
       end
       result=[result,'time = ',num2str(time)]
       set(handles.result, 'String',result);
elseif(strcmpi(methodName,'all'))
    set(handles.result1, 'Visible','On');
    set(handles.result2, 'Visible','On');
    set(handles.result3, 'Visible','On');
    result='';
    arrayLength=length(rootsGauss);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(rootsGauss(i)),','];
    end
    set(handles.result, 'String',result);
    
    result='';
    arrayLength=length(rootsLU);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(rootsLU(i)),','];
    end
    set(handles.result1, 'String',result);
    
    result='';
    arrayLength=length(rootsJordan);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(rootsJordan(i)),','];
    end
    set(handles.result2, 'String',result);
    y=[];
    result='';
    disp(rootsSeidel)
    for i=1:size(rootsSeidel,1)
           for j=1:size(rootsSeidel,2)
               y(j)=j;
               result=[result,'itr',num2str(j),': x',num2str(i),'=',num2str(rootsSeidel(i,j)),','];
           end
    end
       for i=1:size(errorsSeidel,1)
           for j=1:size(errorsSeidel,2)
               result=[result,'itr',num2str(j),': error',num2str(i),'=',num2str(errorsSeidel(i,j)),','];
           end
       end
       set(handles.result3, 'String',result);
       axes(handles.axes1);
       c = {};
       for k = 1 : size(rootsSeidel,1)  
           c = cat(2, c, y, rootsSeidel([k],:) );
       end
       
       plot(c{:});
end
else
    set(handles.mesg,'Visible','On');
    set(handles.mesg,'string',mesg);
end
function pathFileText_Callback(hObject, eventdata, handles)

function pathFileText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu1_Callback(hObject, eventdata, handles)
set(handles.result, 'Visible','Off');
set(handles.result1, 'Visible','Off');
set(handles.result2, 'Visible','Off');
set(handles.result3, 'Visible','Off');
set(handles.result3, 'Visible','Off');
set(handles.textStatic, 'Visible','Off');
set(handles.initialPointText,'Visible','Off');
set(handles.initialPointStaticText,'Visible','Off');
set(handles.iterationStaticText,'Visible','Off');
set(handles.iterationtext,'Visible','Off');
set(handles.precisionStatictext,'Visible','Off');
set(handles.precisionText,'Visible','Off');
option = get(handles.popupmenu1, 'Value');
if(option==1)
    set(handles.methodText, 'String','Gaussian-Elimination');
elseif(option==2)
    set(handles.methodText, 'String','LU decomposition');
elseif(option==3)
    set(handles.methodText, 'String','Gaussian-Jordan');
elseif(option==4)
    set(handles.methodText, 'String','Gauss-Seidel.');
    set(handles.initialPointText,'Visible','On');
    set(handles.initialPointStaticText,'Visible','On');
    set(handles.iterationStaticText,'Visible','On');
    set(handles.iterationtext,'Visible','On');
    set(handles.precisionStatictext,'Visible','On');
    set(handles.precisionText,'Visible','On');
elseif(option==5)
    set(handles.methodText, 'String','All Method');
    set(handles.initialPointText,'Visible','On');
    set(handles.initialPointStaticText,'Visible','On');
    set(handles.iterationStaticText,'Visible','On');
    set(handles.iterationtext,'Visible','On');
    set(handles.precisionStatictext,'Visible','On');
    set(handles.precisionText,'Visible','On');
end

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function iterationtext_Callback(hObject, eventdata, handles)

function iterationtext_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function precisionText_Callback(hObject, eventdata, handles)

function precisionText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function equationsText_Callback(hObject, eventdata, handles)

function equationsText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initialPointText_Callback(hObject, eventdata, handles)

function initialPointText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonRun_Callback(hObject, eventdata, handles)
set(handles.result, 'Visible','On');
set(handles.result1, 'Visible','Off');
set(handles.mesg, 'Visible','Off');
set(handles.result2, 'Visible','Off');
set(handles.result3, 'Visible','Off');
set(handles.textStatic, 'Visible','On');
eqnStringInput= get(handles.equationsText, 'String');
answerStringInput=get(handles.AnswerTextBox, 'String');
initialStringInput=get(handles.initialPointText, 'String');
option = get(handles.popupmenu1, 'Value');
[ eqnArrayInput,mesg ] = getCoefficent(eqnStringInput);
if(isempty(mesg))
[ answerArrayInput,mesg1 ] = getCoefficent(answerStringInput);
if(isempty(mesg1))
if(option==1)
    result='';
    now1 = tic();
    [GaussOutput] = Gauss(eqnArrayInput,answerArrayInput);
    gaussTime = toc(now1);
    file=fopen('part2.txt','wb');
    fprintf(file,'Gauss Elimination');
    fprintf(file,'\n%6s %8f\n','execution time = ',gaussTime);
    arrayLength=length(GaussOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(GaussOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',GaussOutput(i));
    end
    fclose(file);
    finalResult=[result,'time=',num2str(gaussTime)];
    set(handles.result, 'String',finalResult);
elseif(option==2)
    result='';
    now2 = tic();
    [LUOutput] = LU_Decomposition(eqnArrayInput,answerArrayInput);
    LUTime = toc(now2);
    file=fopen('part2.txt','wb');
    fprintf(file,'LU Decomposition');
    fprintf(file,'\n%6s %8f\n','execution time = ',LUTime);
    arrayLength=length(LUOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(LUOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',LUOutput(i));
    end
    fclose(file);
    finalResult=[result,'time=',num2str(LUTime)];
    set(handles.result, 'String',finalResult);
elseif(option==3)
    result='';
    now3 = tic();
    [JordanOutput] = Gauss_Jordan(eqnArrayInput,answerArrayInput);
    gauss_jordanTime = toc(now3);
    file=fopen('part2.txt','wb');
    fprintf(file,'Gauss_Jordan');
    fprintf(file,'\n%6s %8f\n','execution time = ',gauss_jordanTime);
    arrayLength=length(JordanOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(JordanOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',JordanOutput(i));
    end
    fclose(file);
    finalResult=[result,'time=',num2str(gauss_jordanTime)];
    set(handles.result, 'String',finalResult);
elseif(option==4)
    Itr = get(handles.iterationtext, 'String');
    precision = get(handles.precisionText, 'String');
    if (isempty(Itr))
        IMax = 50;
    else
        IMax = str2double(Itr);
    end;
    if (isempty(precision))
        es = 0.00001;
    else
        es = str2double(precision);
    end;
    [ initialArrayInput,mesg2 ] = getCoefficent(initialStringInput);
    if(isempty(mesg2))
    if(IMax <= 50 && IMax > 0)
       result='';
       now4 = tic();
       [ rootsMatrix,errors ] = GaussSeidel( eqnArrayInput,answerArrayInput,initialArrayInput,IMax,es );
       gaussSeidelTime = toc(now4);
       file=fopen('part2.txt','wb');
       fprintf(file,'Gauss_Seidel');
       fprintf(file,'\n%6s %8f\n','execution time = ',gaussSeidelTime);
       fprintf(file,'%6s\n','rootsMatrix');   
       for i=1:size(rootsMatrix,1)
           for j=1:size(rootsMatrix,2)
               result=[result,'itr',num2str(j),': x',num2str(i),'=',num2str(rootsMatrix(i,j)),','];
               fprintf(file,'%6f',rootsMatrix(i,j));
               fprintf(file,'%3s',' ');
           end
           fprintf(file,'\n');
       end
       fprintf(file,'%6s\n','errors');
       for i=1:size(errors,1)
           for j=1:size(errors,2)
               result=[result,'itr',num2str(j),': error',num2str(i),'=',num2str(errors(i,j)),','];
               fprintf(file,'%6f',errors(i,j));
               fprintf(file,'%3s',' ');
           end
           fprintf(file,'\n');
       end
       fclose(file); 
       finalResult=[result,'time=',num2str(gaussSeidelTime)];
       set(handles.result, 'String',finalResult);
    end
    else
        set(handles.mesg,'Visible','On');
        set(handles.mesg,'string',mesg2);
    end
elseif(option==5)
    set(handles.result1, 'Visible','On');
    set(handles.result2, 'Visible','On');
    set(handles.result3, 'Visible','On');
    axes(handles.axes1);
    result='';
    now1 = tic();
    [GaussOutput] = Gauss(eqnArrayInput,answerArrayInput);
    gaussTime = toc(now1);
    file=fopen('part2.txt','wb');
    fprintf(file,'Gauss Elimination');
    fprintf(file,'\n%6s %8f\n','execution time = ',gaussTime);
    arrayLength=length(GaussOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(GaussOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',GaussOutput(i));
    end
     fprintf(file,'\n');
     finalResult=[result,'time=',num2str(gaussTime)];
     set(handles.result, 'String',finalResult);
     result='';
    now2 = tic();
    [LUOutput] = LU_Decomposition(eqnArrayInput,answerArrayInput);
    LUTime = toc(now2);
    fprintf(file,'LU Decomposition');
    fprintf(file,'\n%6s %8f\n','execution time = ',LUTime);
    arrayLength=length(LUOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(LUOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',LUOutput(i));
    end
    fprintf(file,'\n');
    finalResult=[result,'time=',num2str(LUTime)];
    set(handles.result1, 'String',finalResult);
    result='';
    now3 = tic();
    [JordanOutput] = Gauss_Jordan(eqnArrayInput,answerArrayInput);
    gauss_jordanTime = toc(now3);
    fprintf(file,'Gauss_Jordan');
    fprintf(file,'\n%6s %8f\n','execution time = ',gauss_jordanTime);
    arrayLength=length(JordanOutput);
    for i=1:arrayLength
        result=[result,'x',num2str(i),'=',num2str(JordanOutput(i)),','];
        fprintf(file,'%6s %0u','X',i);
        fprintf(file,'%3s %2f\n','=',JordanOutput(i));
    end
    fprintf(file,'\n');
    finalResult=[result,'time=',num2str(gauss_jordanTime)];
    set(handles.result2, 'String',finalResult);
    result='';
    Itr = get(handles.iterationtext, 'String');
    precision = get(handles.precisionText, 'String');
    if (isempty(Itr))
        IMax = 50;
    else
        IMax = str2double(Itr);
    end;
    if (isempty(precision))
        es = 0.00001;
    else
        es = str2double(precision);
    end;
    [ initialArrayInput,mesg4 ] = getCoefficent(initialStringInput);
    if(isempty(mesg4))
    if(IMax <= 50 && IMax > 0)
       now4 = tic();
       [ rootsMatrix,errors ] = GaussSeidel( eqnArrayInput,answerArrayInput,initialArrayInput,IMax,es );
       gaussSeidelTime = toc(now4);
       fprintf(file,'Gauss_Seidel');
       fprintf(file,'\n%6s %8f\n','execution time = ',gaussSeidelTime);
       fprintf(file,'%6s\n','rootsMatrix');
       y=[];
       for i=1:size(rootsMatrix,1)
           for j=1:size(rootsMatrix,2)
               y(j)=j;
               result=[result,'itr',num2str(j),': x',num2str(i),'=',num2str(rootsMatrix(i,j)),','];
               fprintf(file,'%6f',rootsMatrix(i,j));
               fprintf(file,'%3s',' ');
           end
           fprintf(file,'\n');
       end
       fprintf(file,'%6s\n','errors');
       for i=1:size(errors,1)
           for j=1:size(errors,2)
               result=[result,'itr',num2str(j),': error',num2str(i),'=',num2str(errors(i,j)),','];
               fprintf(file,'%6f',errors(i,j));
               fprintf(file,'%3s',' ');
           end
           fprintf(file,'\n');
       end
       fclose(file);  
        
       axes(handles.axes1);
       c = {};
       for k = 1 : size(rootsMatrix,1)  
           c = cat(2, c, y, rootsMatrix([k],:) );
       end
       %x=[0:1:size(rootsMatrix,2)]
       plot(c{:});
       finalResult=[result,'time=',num2str(gaussSeidelTime)];
       set(handles.result3, 'String',finalResult);    
    end
    else
        set(handles.mesg,'Visible','On');
        set(handles.mesg,'string',mesg4);
    end
end
else
    set(handles.mesg,'Visible','On');
    set(handles.mesg,'string',mesg1);
end
else
    set(handles.mesg,'Visible','On');
    set(handles.mesg,'string',mesg);
end
function AnswerTextBox_Callback(hObject, eventdata, handles)

function AnswerTextBox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function result_Callback(hObject, eventdata, handles)
function result_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result1_Callback(hObject, eventdata, handles)
function result1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result2_Callback(hObject, eventdata, handles)

function result2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result3_Callback(hObject, eventdata, handles)

function result3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function mesg_Callback(hObject, eventdata, handles)
function mesg_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
