function varargout = Part1NumericalAnalysis(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Part1NumericalAnalysis_OpeningFcn, ...
    'gui_OutputFcn',  @Part1NumericalAnalysis_OutputFcn, ...
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

function Part1NumericalAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Part1NumericalAnalysis_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function functionText_Callback(hObject, eventdata, handles)

function functionText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XuBisecText_Callback(hObject, eventdata, handles)
function XlBisecText_Callback(hObject, eventdata, handles)

function XlBisecText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XuBisecText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonRun_Callback(hObject, eventdata, handles)
set(handles.axesall1,'Visible','Off');
set(handles.axesall2,'Visible','Off');
set(handles.messText,'Visible','Off'); 
Itr = get(handles.noOfIterationText, 'String');
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
option = get(handles.popupmenu3, 'Value');
%BISECTION
if(option==1)
    xu = get(handles.XuBisecText, 'String');
    xl=  get(handles.XlBisecText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <= 50 && IMax > 0)
        now1 = tic();
        [xr,itr,mesg] = biSection(funcStringInput,xl,xu,IMax,es)
        biSectionTime = toc(now1);
        if(isempty(mesg))
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','On');
            set(handles.text66,'Visible','On');
            set(handles.time,'Visible','Off');
            
            set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');


            set(handles.result, 'String','iteration   error       xr           xl           xu        time');
            set(handles.text1,'string',itr);
            if(itr>1)
                set(handles.text2,'string',xr(itr,4));
            else
                 set(handles.text2,'string',' ');
            end
            set(handles.text3,'string',xr(itr,1));
            set(handles.text44,'string',xr(itr,2));
            set(handles.text55,'string',xr(itr,3));
            set(handles.text66,'string',biSectionTime);
            x= [xr(1,2)-10 xr(1,3)+10];
            y1 = (func(xr(1,2))-60:0.0001:func(xr(1,3))+60);
            x1 = xr(1,2) * ones(size(y1));
            y2 = (func(xr(1,2))-30:0.0001:func(xr(1,3))+30);
            x2 = xr(1,3) * ones(size(y2));
            y3 = (func(xr(1,2))-30:0.0001:func(xr(1,3))+30);
            x3 = xr(1,1) * ones(size(y3));
            fplot(func,x,'b')
            hold on;
            plot(x1, y1,'r')
            hold on
            plot(x2, y2,'y')
            hold on
            plot(x3, y3,'g')
            hold off
            file=fopen('numerical.txt','wb');
            fprintf(file,'Bisection');
            fprintf(file,'\n%6s %8u\n','iteration',itr);
            fprintf(file,'%6s %8f\n','execution time',biSectionTime);
            fprintf(file,'%6s %14s %22s %28s\n','Xr','Xl','Xu','es');
            for i=1:itr
                fprintf(file,'%6f',xr(i,1));
                fprintf(file,'%14f',xr(i,2));
                fprintf(file,'%22f',xr(i,3));
                if(itr>1)
                    fprintf(file,'%30f\n',xr(i,4));
                end
            end
            fclose(file);
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);

        end
    
    end
    %FALSE
elseif(option==2)
    xuF = get(handles.XuFalseText, 'String');
    xlF=  get(handles.XlFalseText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <=50 && IMax > 0)
        now2 = tic();
        [ xr, itr,mesg ] = falsePosition(funcStringInput,xlF,xuF,IMax,es)
        falseTime = toc(now2);
        if(isempty(mesg))
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','On');
            set(handles.text66,'Visible','On');
            set(handles.time,'Visible','Off');
              set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
            set(handles.result, 'String','iteration   error       xr           xl           xu        time');
            set(handles.text1,'string',itr);
            if(itr>1)
                set(handles.text2,'string',xr(itr,4));
            else
                set(handles.text2,'string',' ');
            end
            set(handles.text3,'string',xr(itr,1));
            set(handles.text44,'string',xr(itr,2));
            set(handles.text55,'string',xr(itr,3));
            set(handles.text66,'string',falseTime);
            x= [xr(1,2)-0.1 xr(1,3)+0.1];
            y1 = (func(xr(1,2))-30:0.0001:func(xr(1,3))+30);
            x1 = xr(1,2) * ones(size(y1));
            y2 = (func(xr(1,2))-30:0.0001:func(xr(1,3))+30);
            x2 = xr(1,3) * ones(size(y2));
            y3 = (func(xr(1,2))-30:0.0001:func(xr(1,3))+30);
            x3 = xr(1,1) * ones(size(y3));
            fplot(func,x,'b')
            hold on
            plot(x1, y1,'r')
            hold on
            plot(x2, y2,'y')
            hold on
            plot(x3, y3,'g')
            hold off
            file=fopen('numerical.txt','wb');
            fprintf(file,'False Position');
            fprintf(file,'\n%6s %8u\n','iteration',itr);
            fprintf(file,'%6s %8f\n','execution time',falseTime);
            fprintf(file,'%6s %14s %20s %28s\n','Xr','Xl','Xu','es');
            for i=1:itr
                fprintf(file,'%6f',xr(i,1));
                fprintf(file,'%14f',xr(i,2));
                fprintf(file,'%22f',xr(i,3));
                if(itr>1)
                    fprintf(file,'%30f\n',xr(i,4));
                end
            end
            fclose(file);
        %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
        end
    end
    
    %FIXED POINT
elseif(option==3)
    x0Fix = get(handles.X0FixedText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <= 50 && IMax > 0)
        now3= tic();
        [ xn, itr,gx,delta,mesg ] = fixedPoint( funcStringInput, x0Fix, IMax, es )
        fixedTime = toc(now3);
        if(isempty(mesg))
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','On');
            set(handles.text66,'Visible','On');
            set(handles.time,'Visible','Off');
              set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
            set(handles.result, 'String','iteration   error       xi         xi-1        time         delta');
            
            if(itr>1)
                set(handles.text1,'string',itr);
                set(handles.text2,'string',xn(itr,3));
                set(handles.text44,'string',xn(itr,2));
                set(handles.text3,'string',xn(itr,1));
            else
                set(handles.text1,'string','1');
                set(handles.text3,'string',x0Fix);
                set(handles.text2,'string',' ');
                set(handles.text44,'string',' ');
            end
            set(handles.text55,'string',fixedTime);
            set(handles.text66,'string',delta);
            x= [xn(1,1)-2 xn(1,1)+2];
            y0=x;
            temp1= strcat('@(x) ', char(gx));
            g = str2func(temp1);
            if(itr>1)
                y1 = (func(xn(1,1))-30:0.001:func(xn(1,1))+30);
                x1 = xn(1,1) * ones(size(y1));
                y2 = (func(xn(2,1))-30:0.001:func(xn(2,1))+30);
                x2 = xn(2,1) * ones(size(y2));
                plot(x,y0,'b')
                hold on
                fplot(g,x,'y')
                hold on
                plot(x1, y1,'r')
                hold on
                plot(x2, y2,'g')
                hold off
            else
                y1 = (func(xn(1,1))-30:0.001:func(xn(1,1))+30);
                x1 = xn(1,1) * ones(size(y1));
                plot(x,y0,'b')
                hold on
                fplot(g,x,'y')
                hold on
                plot(x1, y1,'r')
                hold off
            end
            file=fopen('numerical.txt','wb');
            fprintf(file,'Fixed Point');
            fprintf(file,'\n%6s %12u\n','iteration = ',itr);
            fprintf(file,'%6s %12f\n','execution time = ',fixedTime);
            fprintf(file,'%6s %12f\n','delta = ',delta);
            fprintf(file,'%6s %14s %20s\n','Xi','Xi-1','es');
            for i=1:itr
                fprintf(file,'%6f',xn(i,1));
                fprintf(file,'%14f',xn(i,2));
                fprintf(file,'%22f\n',xn(i,3));
            end
            fclose(file);
              %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
        end
    end
    
    %NEWTON
elseif(option==4)
    x0N = get(handles.X0NewtonText, 'String');
    x0Ne =str2double(x0N);
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <= 50 && IMax > 0)
        now4= tic();
        [next_x ,Fi,f_dev,error, loop, delta,mesg] = Newton(funcStringInput,x0Ne, IMax, es )
        newtonTime = toc(now4);
        if(isempty(mesg))
            itr = loop;
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','On');
            set(handles.text66,'Visible','On');
              set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
            set(handles.result, 'String','iteration   error       xi         xi+1        delta       time');
            set(handles.text1,'string',itr);
            set(handles.text2,'string',error(itr));
            set(handles.text3,'string',next_x(itr));
            set(handles.text44,'string',' ');
            if(itr>1)
                set(handles.text3,'string',next_x(itr-1));
                set(handles.text44,'string',next_x(itr));
            end
            set(handles.text55,'string',delta);
            set(handles.text66,'string',newtonTime);
            x1= [next_x(1)-1 next_x(1)+1];
            if(itr==1)
                y2 = (func(next_x(1))-30:0.001:func(next_x(1))+30);
                x2 = next_x(1) * ones(size(y2));
            else
                y2 = (func(next_x(1))-30:0.001:func(next_x(1))+30);
                x2 = next_x(1) * ones(size(y2));
                y3 = (func(next_x(2))-30:0.001:func(next_x(2))+30);
                x3 = next_x(2) * ones(size(y3));
                plot(x3, y3,'y')
                hold on
            end
            syms x;
            div = diff(funcStringInput,x);
            temp1= strcat('@(x) ', char(div));
            func1 = str2func(temp1);
            fplot(func,x1,'b')
            hold on
            plot(x2, y2,'r')
            hold on
            fplot(func1,x1,'g')
            hold off
            file=fopen('numerical.txt','wb');
            fprintf(file,'Newton');
            fprintf(file,'\n%6s %12u\n','iteration = ',itr);
            fprintf(file,'%6s %12f\n','execution time = ',newtonTime);
            fprintf(file,'%6s %12f\n','delta = ',delta);
            fprintf(file,'%6s %14s %20s %23s\n','Xi','Fi','F_dev','es');
            for i=1:itr
                fprintf(file,'%6f',next_x(i));
                fprintf(file,'%14f',Fi(i));
                fprintf(file,'%20f',f_dev(i));
                fprintf(file,'%26f\n',error(i));
            end
            fclose(file);
              %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
        end
    end
    
    %SECANT
elseif(option==5)
    x0S = get(handles.X0SecantText, 'String');
    x1S = get(handles.X1SecantText, 'String');
    x0Se =str2double(x0S);
    x1Se =str2double(x1S);
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <= 50 && IMax > 0)
        now5= tic();
        [next_x,Fi ,error,loop, delta,mesg] = Secent( funcStringInput,x1Se,x0Se,IMax,es)
        secantTime = toc(now5);
        if(isempty(mesg))
            itr = loop;
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','On');
            set(handles.text66,'Visible','On');
            set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
            set(handles.result, 'String','iteration   error       xi       xi+1      xi-1    time');
            set(handles.text1,'string',itr);
            set(handles.text2,'string',error(itr));
            if(itr==1)
                set(handles.text3,'string',x1Se);
                set(handles.text55,'string',x0Se);
            elseif(itr==2)
                set(handles.text3,'string',next_x(itr-1));
                set(handles.text55,'string',x1Se);
            else
                set(handles.text3,'string',next_x(itr-1));
                set(handles.text55,'string',next_x(itr-2));
            end
            set(handles.text44,'string',next_x(itr));
            set(handles.text66,'string',secantTime);
            x= [next_x(1)-3 next_x(1)+3];
            y2 = (func(next_x(1))-30:0.001:func(next_x(1))+30);
            x2 = next_x(1) * ones(size(y2));
            y3 = (func(x0Se)-30:0.001:func(x0Se)+30);
            x3 = x0Se * ones(size(y3));
            y4 = (func(x1Se)-30:0.001:func(x1Se)+30);
            x4 = x1Se * ones(size(y4));
            fplot(func,x,'b');
            hold on
            plot(x2, y2,'r');
            hold on
            plot(x3, y3,'y');
            hold on
            plot(x4, y4,'g');
            hold off
            file=fopen('numerical.txt','wb');
            fprintf(file,'Secant');
            fprintf(file,'\n%6s %12u\n','iteration = ',itr);
            fprintf(file,'%6s %12f\n','execution time = ',secantTime);
            fprintf(file,'%6s %14s %20s\n','Xi','Fi','es');
            for i=1:itr
                fprintf(file,'%6f',next_x(i));
                fprintf(file,'%14f',Fi(i));
                fprintf(file,'%20f\n',error(i));
            end
            fclose(file);
              %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
        end
    end
    %BIERGE
elseif(option==6)
    x0B = get(handles.X0BiergeText, 'String');
    x0BV =str2double(x0B);
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    if(IMax <= 50 && IMax > 0)
        now6= tic();
        [ root_x,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(funcStringInput,x0BV,IMax, es )
        biergeTime = toc(now6);
        if(isempty(mesg))
            itr = loop;
            set(handles.resulttext,'Visible','On');
            set(handles.result,'Visible','On');
            set(handles.text1,'Visible','On');
            set(handles.text2,'Visible','On');
            set(handles.text3,'Visible','On');
            set(handles.text44,'Visible','On');
            set(handles.text55,'Visible','Off');
            set(handles.text66,'Visible','Off');
            set(handles.time,'Visible','Off');
              set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
            set(handles.result, 'String','iteration   error       root    time');
            set(handles.text1,'string',itr);
            set(handles.text2,'string',error(itr+1));
            set(handles.text3,'string',root_x(itr+1));
            set(handles.text44,'string',biergeTime);
            x= [root_x(1)-3 root_x(1)+3];
            y2 = (func(root_x(1))-30:0.001:func(root_x(1))+30);
            x2 = root_x(1) * ones(size(y2));
            y3 = (func(root_x(2))-30:0.001:func(root_x(2))+30);
            x3 = root_x(2) * ones(size(y2));
            fplot(func,x,'b');
            hold on
            plot(x2, y2,'r');
            hold on
            plot(x3, y3,'g');
            hold off
            file=fopen('numerical.txt','wb');
            fprintf(file,'Bierge vieta');
            fprintf(file,'\n%6s %12u\n','iteration = ',itr);
            fprintf(file,'%6s %12f\n','execution time = ',biergeTime);
            fprintf(file,'%6s\n','Xi');
            for i=1:length(root_x)
                fprintf(file,'%6f\n',root_x(i));
            end
            fprintf(file,'\n');
            fprintf(file,'%6s\n','A');
            for i=1:size(A,1)
                fprintf(file,'%6f\n',A(i));
            end
            fprintf(file,'\n');
            fprintf(file,'%6s\n','es');
            for i=1:length(error)
                fprintf(file,'%6f\n',error(i));
            end
            fprintf(file,'%6s\n','B');
            for i =1:size(B,1)
                for j=1:itr
                    fprintf(file,'%12f',B(i,j));
                end
                fprintf(file,'\n');
            end
            fprintf(file,'\n');
            fprintf(file,'%6s\n','c');
            for i =1:size(C,1)
                for j=1:itr
                    fprintf(file,'%14f',C(i,j));
                end
                fprintf(file,'\n');
            end
            fclose(file);
              %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
        end
    end
    %general method
elseif(option==8)
    set(handles.generalResult,'Visible','On');
    set(handles.resulttext,'Visible','On');
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    now6= tic();
    [ roots , size1, mesg] = generalMethod( funcStringInput );
    generalTime = toc(now6);
    if(isempty(mesg))
          set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
        x= [roots(1,2,1)-10 roots(1,3,1)+10];
        fplot(func,x,'b');
        hold on
        for i=1:size1
            y2 = (func(roots(1,2,i))-30:0.001:func(roots(1,2,i))+30);
            x2 = roots(1,2,i) * ones(size(y2));
            y3 = (func(roots(1,3,i))-30:0.001:func(roots(1,3,i))+30);
            x3 = roots(1,3,i) * ones(size(y3));
            y4 = (func(roots(1,1,i))-30:0.001:func(roots(1,1,i))+30);
            x4 = roots(1,1,i) * ones(size(y4));
            plot(x2, y2,'r');
            hold on
            plot(x3, y3,'g');
            hold on
            plot(x4, y4,'y');
            hold on
        end
        result='';
        file=fopen('numerical.txt','wb');
        fprintf(file,'General');
        fprintf(file,'\n%6s %12u\n','# of roots = ',size1);
        result=[result,'# of roots = ',num2str(size1),','];
        fprintf(file,'%6s %12f\n','execution time = ',generalTime);
        result=[result,'execution time = ',num2str(generalTime),','];
        for i=1:size1
            fprintf(file,'%6s %12u\n','root',i);
            result=[result,'root ',num2str(i),','];
            fprintf(file,'%6s %14s %22s %28s\n','Xr','Xl','Xu','es');
            [iter,col]=size(roots(:,:,1,i))
            for j=1:iter
                fprintf(file,'%6f',roots(iter,1,i));
                fprintf(file,'%14f',roots(iter,2,i));
                fprintf(file,'%22f',roots(iter,3,i));
                fprintf(file,'%30f\n',roots(iter,4,i));
                result=[result,'itr ',num2str(j),',','xr = ',num2str(roots(iter,1,i)),'xl = ',num2str(roots(iter,2,i)),'xu = ',num2str(roots(iter,3,i)),'es = ',num2str(roots(iter,4,i))];
            end
        end
        set(handles.generalResult, 'String',result);
        fclose(file);
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
    
    %option All
elseif(option==7)
    set(handles.text1,'Visible','Off');
    set(handles.text2,'Visible','Off');
    set(handles.text3,'Visible','Off');
    set(handles.text44,'Visible','Off');
    set(handles.text55,'Visible','Off');
    set(handles.text66,'Visible','Off');
    set(handles.resulttext,'Visible','Off');
    set(handles.generalResult,'Visible','Off');
    
     %msg
      set(handles.messText,'Visible','Off'); 
      set(handles.messBi,'Visible','Off');
      set(handles.messFa,'Visible','Off');
      set(handles.messFi,'Visible','Off');
      set(handles.messNe,'Visible','Off');
      set(handles.messSe,'Visible','Off');
      set(handles.messBe,'Visible','Off');
      set(handles.messGe,'Visible','Off');
    
    
    set(handles.result,'Visible','Off');
    set(handles.axesall1,'Visible','On');
    set(handles.axesall2,'Visible','On');
    axes(handles.axesall1);
    axes(handles.axesall2);
    xBisection=[],yBisection=[],xFalse=[],yFalse=[];xFixed=[],yFixed=[],
    xNewton=[],yNewton=[],,xSecant=[],ySecant=[],xBerge=[],yBerge=[],
    xGeneral=[],yGeneral=[];
    yBisectionEs=[],yFalseEs=[],yFixedEs=[],yNewtonEs=[],ySecantEs=[],
    yBergeEs=[],yGeneralEs=[];
    file=fopen('numerical.txt','wb');
    
    %BISECTION
    xu = get(handles.XuBisecText, 'String');
    xl=  get(handles.XlBisecText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    now1 = tic();
    [xr,itr,mesg] = biSection(funcStringInput,xl,xu,IMax,es)
    biSectionTime = toc(now1);
    if(isempty(mesg))
        fprintf(file,'Bisection');
        fprintf(file,'\n%6s %8u\n','iteration',itr);
        fprintf(file,'%6s %8f\n','execution time',biSectionTime);
        fprintf(file,'%6s %14s %22s %28s\n','Xr','Xl','Xu','es');
        for i=1:itr
            xBisection(i)=i;
            yBisection(i)=xr(i,1);
            fprintf(file,'%6f',xr(i,1));
            fprintf(file,'%14f',xr(i,2));
            fprintf(file,'%22f',xr(i,3));
            if(itr>1)
                fprintf(file,'%30f\n',xr(i,4));
                yBisectionEs(i)=xr(i,4);
            else
                yBisectionEs(i)=0;
            end
        end
        %msg
        else
            set(handles.messBi,'Visible','On');
            set(handles.messBi,'string',mesg);
    end
    fprintf(file,'\n');
    %FALSE
    xuF = get(handles.XuFalseText, 'String');
    xlF=  get(handles.XlFalseText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    now2 = tic();
    [ xr, itr,mesg ] = falsePosition(funcStringInput,xlF,xuF,IMax,es)
    falseTime = toc(now2);
    if(isempty(mesg))
        fprintf(file,'False Position');
        fprintf(file,'\n%6s %8u\n','iteration',itr);
        fprintf(file,'%6s %8f\n','execution time',falseTime);
        fprintf(file,'%6s %14s %20s %28s\n','Xr','Xl','Xu','es');
        for i=1:itr
            xFalse(i)=i;
            yFalse(i)=xr(i,1);
            fprintf(file,'%6f',xr(i,1));
            fprintf(file,'%14f',xr(i,2));
            fprintf(file,'%22f',xr(i,3));
            if(itr>1)
                fprintf(file,'%30f\n',xr(i,4));
                yFalseEs(i)=xr(i,4);
            else
                yFalseEs(i)=0;
            end
        end
         %msg
        else
            set(handles.messFa,'Visible','On');
            set(handles.messFa,'string',mesg);
    end
    fprintf(file,'\n');
    %FIXED POINT
    
    x0Fix = get(handles.X0FixedText, 'String');
    funcStringInput= get(handles.functionText, 'String');
    now3= tic();
    [ xn, itr,gx,delta,mesg ] = fixedPoint( funcStringInput, x0Fix, IMax, es )
    display(mesg)
    fixedTime = toc(now3);
    if(isempty(mesg))
        fprintf(file,'Fixed Point');
        fprintf(file,'\n%6s %12u\n','iteration = ',itr);
        fprintf(file,'%6s %12f\n','execution time = ',fixedTime);
        fprintf(file,'%6s %12f\n','delta = ',delta);
        fprintf(file,'%6s %14s %20s\n','Xi','Xi-1','es');
        for i=1:itr
            yFixed(i) =xn(i,1);
            xFixed(i) =i;
            fprintf(file,'%6f',xn(i,1));
            fprintf(file,'%14f',xn(i,2));
            fprintf(file,'%22f\n',xn(i,3));
            yFixedEs(i) =xn(i,3);
        end
         %msg
        else
            set(handles.messFi,'Visible','On');
            set(handles.messFi,'string',mesg);
    end
    fprintf(file,'\n');
    %newton
    x0N = get(handles.X0NewtonText, 'String');
    x0Ne =str2double(x0N);
    funcStringInput= get(handles.functionText, 'String');
    temp= strcat('@(x) ', char(funcStringInput));
    func = str2func(temp);
    axes(handles.axes2);
    now4= tic();
    [next_x ,Fi,f_dev,error, loop, delta,mesg] = Newton(funcStringInput,x0Ne, IMax, es )
    newtonTime = toc(now4);
    if(isempty(mesg))
        itr = loop;
        fprintf(file,'Newton');
        fprintf(file,'\n%6s %12u\n','iteration = ',itr);
        fprintf(file,'%6s %12f\n','execution time = ',newtonTime);
        fprintf(file,'%6s %12f\n','delta = ',delta);
        fprintf(file,'%6s %14s %20s %23s\n','Xi','Fi','F_dev','es');
        for i=1:itr
            xNewton(i)=i;
            yNewton(i)=next_x(i);
            fprintf(file,'%6f',next_x(i));
            fprintf(file,'%14f',Fi(i));
            fprintf(file,'%20f',f_dev(i));
            fprintf(file,'%26f\n',error(i));
            yNewtonEs(i)=error(i);
        end
         %msg
        else
            set(handles.messNe,'Visible','On');
            set(handles.messNe,'string',mesg);
    end
    fprintf(file,'\n');
    %SECANT
    x0S = get(handles.X0SecantText, 'String');
    x1S = get(handles.X1SecantText, 'String');
    x0Se =str2double(x0S);
    x1Se =str2double(x1S);
    funcStringInput= get(handles.functionText, 'String');
    now5= tic();
    [next_x,Fi ,error,loop, delta,mesg] = Secent( funcStringInput,x1Se,x0Se,IMax,es)
    secantTime = toc(now5);
    if(isempty(mesg))
        itr = loop;
        fprintf(file,'Secant');
        fprintf(file,'\n%6s %12u\n','iteration = ',itr);
        fprintf(file,'%6s %12f\n','execution time = ',secantTime);
        fprintf(file,'%6s %14s %20s\n','Xi','Fi','es');
        for i=1:itr
            xSecant(i)=i;
            ySecant(i) =next_x(i);
            fprintf(file,'%6f',next_x(i));
            fprintf(file,'%14f',Fi(i));
            fprintf(file,'%20f\n',error(i));
            ySecantEs(i) =error(i);
        end
         %msg
        else
            set(handles.messSe,'Visible','On');
            set(handles.messSe,'string',mesg);
    end
    fprintf(file,'\n');
    %BIERGE
    x0B = get(handles.X0BiergeText, 'String');
    x0BV =str2double(x0B);
    funcStringInput= get(handles.functionText, 'String');
    now6= tic();
    [ root_x,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(funcStringInput,x0BV,IMax, es )
    biergeTime = toc(now6);
    if(isempty(mesg))
        itr = loop;
        fprintf(file,'Bierge vieta');
        fprintf(file,'\n%6s %12u\n','iteration = ',itr);
        fprintf(file,'%6s %12f\n','execution time = ',biergeTime);
        fprintf(file,'%6s\n','Xi');
        for i=1:length(root_x)
            xBerge(i) = i;
            yBerge(i) = root_x(i);
            fprintf(file,'%6f\n',root_x(i));
        end
        fprintf(file,'\n');
        fprintf(file,'%6s\n','A');
        for i=1:size(A,1)
            fprintf(file,'%6f\n',A(i));
        end
        fprintf(file,'\n');
        fprintf(file,'%6s\n','es');
        for i=1:length(error)
            fprintf(file,'%6f\n',error(i));
            yBergeEs(i) = error(i);
        end
        fprintf(file,'%6s\n','B');
        for i =1:size(B,1)
            for j=1:itr
                fprintf(file,'%12f',B(i,j));
            end
            fprintf(file,'\n');
        end
        fprintf(file,'\n');
        fprintf(file,'%6s\n','c');
        for i =1:size(C,1)
            for j=1:itr
                fprintf(file,'%14f',C(i,j));
            end
            fprintf(file,'\n');
        end
         %msg
        else
            set(handles.messBe,'Visible','On');
            set(handles.messBe,'string',mesg);
    end
    fprintf(file,'\n');
    %generalAll
    funcStringInput= get(handles.functionText, 'String');
    now6= tic();
    [ roots , size1, mesg] = generalMethod( funcStringInput );
    generalTime = toc(now6);
    if(isempty(mesg))
        fprintf(file,'General');
        fprintf(file,'\n%6s %12u\n','# of roots = ',size1);
        fprintf(file,'%6s %12f\n','execution time = ',generalTime);
        roots2D=[];
        es2D=[];
        for i=1:size1
            fprintf(file,'%6s %12u\n','root',i);
            fprintf(file,'%6s %14s %22s %28s\n','Xr','Xl','Xu','es');
            [iter,col]=size(roots(:,:,1,i))
            x=[];
            for j=1:iter
                x(j)=j;
                roots2D(i,j) = roots(iter,1,i);
                es2D(i,j) = roots(iter,4,i);
                fprintf(file,'%6f',roots(iter,1,i));
                fprintf(file,'%14f',roots(iter,2,i));
                fprintf(file,'%22f',roots(iter,3,i));
                fprintf(file,'%30f\n',roots(iter,4,i));
            end
        end
        fclose(file);
         %msg
        else
            set(handles.messGe,'Visible','On');
            set(handles.messGe,'string',mesg);
    end
    axes(handles.axesall1);
    c = {};
    for k = 1 : size(roots2D,1)
        c = cat(2, c, x, roots2D([k],:) );
    end
    
    
    plot(c{:} , 'r');
    plot(xBisection,yBisection,'m',xFalse,yFalse,'c',xFixed,yFixed,'k',xNewton,yNewton,'y',xSecant,ySecant,'b',xBerge,yBerge,'g')
    axes(handles.axesall2);
    c = {};
    for k = 1 : size(es2D,1)
        c = cat(2, c, x, es2D([k],:) );
    end
    
    %   plot(c{:} , 'r');
    plot(c{:} , 'r',xBisection,yBisectionEs,'m',xFalse,yFalseEs,'c',xFixed,yFixedEs,'k',xNewton,yNewtonEs,'y',xSecant,ySecantEs,'b',xBerge,yBergeEs,'g')
    legend('General','Bisection','False Position' ,'Fixed Point' ,'Newton','Secant','Berge')
end

function popupmenu3_Callback(hObject, eventdata, handles)
set(handles.resulttext,'Visible','Off');
set(handles.result,'Visible','Off');
set(handles.result,'Visible','Off');
set(handles.text1,'Visible','Off');
set(handles.text2,'Visible','Off');
set(handles.text3,'Visible','Off');
set(handles.text44,'Visible','Off');
set(handles.text55,'Visible','Off');
set(handles.text66,'Visible','Off');
set(handles.generalResult,'Visible','Off');
set(handles.axesall1,'Visible','Off');
set(handles.axesall2,'Visible','Off');
set(handles.X0BiergeText,'Visible','Off');
set(handles.X1SecantText,'Visible','Off');
set(handles.X0SecantText,'Visible','Off');
set(handles.X0NewtonText,'Visible','Off');
set(handles.X0FixedText,'Visible','Off');
set(handles.XuFalseText,'Visible','Off');
set(handles.XlFalseText,'Visible','Off');
set(handles.XuBisecText,'Visible','Off');
set(handles.XlBisecText,'Visible','Off');
set(handles.axes2,'Visible','On');
option = get(handles.popupmenu3, 'Value');
if(option==1)
    set(handles.Name, 'String','Bisection');
    set(handles.XuBisecText,'Visible','On');
    set(handles.XlBisecText,'Visible','On');
    
elseif(option ==2 )
    set(handles.Name, 'String','False-position');
    set(handles.XuFalseText,'Visible','On');
    set(handles.XlFalseText,'Visible','On');
elseif(option ==3 )
    set(handles.Name, 'String','Fixed point');
    set(handles.X0FixedText,'Visible','On');
    
elseif(option ==4 )
    set(handles.Name, 'String','Newton-Raphson');
    set(handles.X0NewtonText,'Visible','On');
    
elseif(option ==5 )
    set(handles.Name, 'String','Secant');
    set(handles.X1SecantText,'Visible','On');
    set(handles.X0SecantText,'Visible','On');
    
elseif(option ==6 )
    set(handles.Name, 'String','Bierge-Vieta');
    set(handles.X0BiergeText,'Visible','On');
    
elseif(option ==7 )
    set(handles.Name, 'String','All Mehthods');
    set(handles.axes2,'Visible','Off');
    set(handles.axesall1,'Visible','On');
    set(handles.axesall2,'Visible','On');
    set(handles.X0BiergeText,'Visible','On');
    set(handles.X1SecantText,'Visible','On');
    set(handles.X0SecantText,'Visible','On');
    set(handles.X0NewtonText,'Visible','On');
    set(handles.X0FixedText,'Visible','On');
    set(handles.XuFalseText,'Visible','On');
    set(handles.XlFalseText,'Visible','On');
    set(handles.XuBisecText,'Visible','On');
    set(handles.XlBisecText,'Visible','On');
    
elseif(option ==8 )
    set(handles.Name, 'String','Orignal');
    
end

function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function X0NewtonText_Callback(hObject, eventdata, handles)

function X0NewtonText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function X1SecantText_Callback(hObject, eventdata, handles)

function X1SecantText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function X0SecantText_Callback(hObject, eventdata, handles)

function X0SecantText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function X0FixedText_Callback(hObject, eventdata, handles)

function X0FixedText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function X0BiergeText_Callback(hObject, eventdata, handles)

function X0BiergeText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function StepPushbutton_Callback(hObject, eventdata, handles)
Itr = get(handles.noOfIterationText, 'String');
precision = get(handles.precisionText, 'String');
stepNumber = get(handles.StepNumberText, 'String');
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
if (isempty(stepNumber))
else
    step = str2double(stepNumber);
    option = get(handles.popupmenu3, 'Value');
    if(option==1)
        xu = get(handles.XuBisecText, 'String');
        xl=  get(handles.XlBisecText, 'String');
        funcStringInput= get(handles.functionText, 'String');
        temp= strcat('@(x) ', char(funcStringInput));
        func = str2func(temp);
        axes(handles.axes2);
        if(IMax <= 50 && IMax > 0 && step > 0 && step <= IMax)
            now1 = tic();
            [xr,itr,mesg] = biSection(funcStringInput,xl,xu,IMax,es)
            biSectionTime = toc(now1);
            if(isempty(mesg))
                set(handles.resulttext,'Visible','On');
                set(handles.result,'Visible','On');
                set(handles.text1,'Visible','On');
                set(handles.text2,'Visible','On');
                set(handles.text3,'Visible','On');
                set(handles.text44,'Visible','On');
                set(handles.text55,'Visible','On');
                set(handles.text66,'Visible','Off');
                set(handles.result, 'String','iteration   error       xr           xl           xu');
                set(handles.text1,'string',step);
                if(step>1)
                    set(handles.text2,'string',xr(step,4));
                end
                set(handles.text3,'string',xr(step,1));
                set(handles.text44,'string',xr(step,2));
                set(handles.text55,'string',xr(step,3));
                x= [xr(step,2)-0.1 xr(step,3)+0.1];
                y1 = (func(xr(step,2))-30:0.0001:func(xr(step,3))+30);
                x1 = xr(step,2) * ones(size(y1));
                y2 = (func(xr(step,2))-30:0.0001:func(xr(step,3))+30);
                x2 = xr(step,3) * ones(size(y2));
                y3 = (func(xr(step,2))-30:0.0001:func(xr(step,3))+30);
                x3 = xr(step,1) * ones(size(y3));
                fplot(func,x,'b')
                hold on;
                plot(x1, y1,'r')
                hold on
                plot(x2, y2,'y')
                hold on
                plot(x3, y3,'g')
                hold off
                file=fopen('numerical.txt','wb');
                fprintf(file,'Bisection');
                fprintf(file,'\n%6s %8u\n','iteration',step);
                fprintf(file,'%6s %8f\n','execution time',biSectionTime);
                fprintf(file,'%6s %14s %22s %28s\n','Xr','Xl','Xu','es');
                for i=1:step
                    fprintf(file,'%6f',xr(i,1));
                    fprintf(file,'%14f',xr(i,2));
                    fprintf(file,'%22f',xr(i,3));
                    if(step>1)
                        fprintf(file,'%30f\n',xr(i,4));
                    end
                end
                fclose(file);
            end
        end
    end
end
function filePushbutton_Callback(hObject, eventdata, handles)
set(handles.axesall1,'Visible','Off');
set(handles.axesall2,'Visible','Off');
set(handles.resulttext,'Visible','Off');
set(handles.generalResult,'Visible','Off');
set(handles.result,'Visible','Off');
set(handles.text1,'Visible','Off');
set(handles.text2,'Visible','Off');
set(handles.text3,'Visible','Off');
set(handles.text44,'Visible','Off');
set(handles.text55,'Visible','Off');
set(handles.text66,'Visible','Off');
set(handles.time,'Visible','Off');
axes(handles.axes2);
path = get(handles.FilePathText, 'String');
[name,error,time,delta,equationString,mesg,xr,iterations,allowedError,xl,xu,size1,x_initial,x_zero,A,B,C,sendOrder,Fi,gx,f_dev,xrGeneral,sizeGeneral,msgGeneral,xrBierge,sendOrderAll,A_all,B_all,C_all ,errorBierge,loopBierge,msgBierge,xrNewton ,FiNewton,f_dev_all,errorNewton,loopNewton,msgNewton,xrFixedPoint, itrFixedPoint ,gx_all,xrBisection,itrBisection, xrFalsePosition, itrFalsePosition,xrSecent,FiSecent  ,errorSecent,loopSecent,deltaSecent,msgSecent,msgBisection,msgFixed,msgFalse] =  collector(path, 'null')
temp= strcat('@(x) ', char(equationString));
func = str2func(temp);
if(strcmpi(name,'Bisection'))
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
    set(handles.text55,'Visible','On');
    set(handles.text66,'Visible','On');
    %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    
    if(isempty(mesg))
        set(handles.result, 'String','iteration   error       xr           xl           xu       time');
        set(handles.text1,'string',iterations);
        if(iterations>1)
            set(handles.text2,'string',xr(iterations,4));
        end
        set(handles.text3,'string',xr(iterations,1));
        set(handles.text44,'string',xr(iterations,2));
        set(handles.text55,'string',xr(iterations,3));
        set(handles.text66,'string',time);
        x= [xr(1,2)-0.1 xr(1,3)+0.1];
        y1 = (-100:1:100);
        x1 = [];
        x2= [];
        x3= [];
        for i = 1:length(y1)
            x1(i)= xr(1,2) ;
            x2(i)= xr(1,3) ;
            x3(i)= xr(1,1) ;
            
            
        end
        
        fplot(func,x,'b')
        hold on;
        plot(x1, y1,'r')
        hold on
        plot(x2, y1,'y')
        hold on
        plot(x3, y1,'g')
        hold off
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
    
    
    
elseif(strcmpi(name,'false position'))
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
    set(handles.text55,'Visible','On');
    set(handles.text66,'Visible','On');
    %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    if(isempty(mesg))
        set(handles.result, 'String','iteration   error       xr           xl           xu         time');
        set(handles.text1,'string',iterations);
        if(iterations>1)
            set(handles.text2,'string',xr(iterations,4));
        end
        set(handles.text3,'string',xr(iterations,1));
        set(handles.text44,'string',xr(iterations,2));
        set(handles.text55,'string',xr(iterations,3));
        set(handles.text66,'string',time);
        x= [xr(1,2)-0.1 xr(1,3)+0.1];
        y1 = (-100:1:100);
        x1 = [];
        x2= [];
        x3= [];
        for i = 1:length(y1)
            x1(i)= xr(1,2) ;
            x2(i)= xr(1,3) ;
            x3(i)= xr(1,1) ;
            
            
        end
        
        fplot(func,x,'b')
        hold on;
        plot(x1, y1,'r')
        hold on
        plot(x2, y1,'y')
        hold on
        plot(x3, y1,'g')
        hold off
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
    
elseif(strcmpi(name,'fixed point'))%%%%%%%%%%%%%%%%%%%%
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
    set(handles.text55,'Visible','On');
    set(handles.text66,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    if(isempty(mesg))
        set(handles.result, 'String','iteration   error       xi         xi-1        delta      time');
        if(iterations>1)
            set(handles.text1,'string',iterations);
            set(handles.text2,'string',xr(iterations,3));
            set(handles.text44,'string',xr(iterations,2));
            set(handles.text3,'string',xr(iterations,1));
        else
            set(handles.text1,'string','1');
            set(handles.text2,'string',' ');
            set(handles.text44,'string',' ');
            set(handles.text3,'string',x0Fix);
        end
        set(handles.text55,'string',delta);
        set(handles.text66,'string',time);
        x= [xr(1,1)-2 xr(1,1)+2];
        y0=x;
        temp1= strcat('@(x) ', char(gx));
        g = str2func(temp1);
        if(iterations>1)
            y1 = (-100:1:100);
            x1 = [];
            x2= [];
            for i = 1:length(y1)
                x1(i)= xr(1,1) ;
                x2(i)= xr(2,1) ;
                
                
            end
            plot(x,y0,'b')
            hold on
            fplot(g,x,'y')
            hold on
            plot(x1, y1,'r')
            hold on
            plot(x2, y1,'g')
            hold off
        else
            y1 = (-100:1:100);
            x1 = [];
            for i = 1:length(y1)
                x1(i)= xr(1,1) ;
                
                
            end
            plot(x,y0,'b')
            hold on
            fplot(g,x,'y')
            hold on
            plot(x1, y1,'r')
            hold off
        end
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
elseif(strcmpi(name,'newton'))
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
    set(handles.text55,'Visible','On');
    set(handles.text66,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    set(handles.result, 'String','iteration   error       xi         xi+1        delta       time');
    if(isempty(mesg))
        set(handles.text1,'string',iterations);
        set(handles.text2,'string',error(iterations));
        set(handles.text3,'string',xr(iterations));
        if(iterations>1)
            set(handles.text3,'string',xr(iterations-1));
            set(handles.text44,'string',xr(iterations));
        end
        set(handles.text55,'string',delta);
        set(handles.text66,'string',time);
        x1= [xr(1)-1 xr(1)+1];
         y1 = (-100:1:100);
        if(iterations==1)
            
            
            y1 = (-100:1:100);
            x2= [];
            for i = 1:length(y1)
                x2(i)= xr(1) ;
                
                
            end
        else
            
            y2= (-100:1:100);
            y3 = (-100:1:100);
            
            x3 = [];
            x2= [];
            for i = 1:length(y2)
                x3(i)= xr(2) ;
                x2(i)= xr(1) ;
                
                
            end
            
            
            
            plot(x3, y3,'y')
            hold on
        end
        syms x;
        div = diff(equationString,x);
        temp1= strcat('@(x) ', char(div));
        func1 = str2func(temp1);
        fplot(func,x1,'b')
        hold on
        plot(x2, y1,'r')
        hold on
        fplot(func1,x1,'g')
        hold off
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
elseif(strcmpi(name,'secent'))
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
    set(handles.text55,'Visible','On');
    set(handles.text66,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    set(handles.result, 'String','iteration   error       xi       xi+1      xi-1    time');
    if(isempty(mesg))
        set(handles.text1,'string',iterations);
        set(handles.text2,'string',error(iterations));
        if(iterations==1)
            set(handles.text3,'string',x_zero);
            set(handles.text55,'string',x_initial);
        elseif(iterations==2)
            set(handles.text3,'string',xr(iterations-1));
            set(handles.text55,'string',x_zero);
        else
            set(handles.text3,'string',xr(iterations-1));
            set(handles.text55,'string',xr(iterations-2));
        end
        set(handles.text44,'string',xr(iterations));
        set(handles.text66,'string',time);
        x= [xr(1)-3 xr(1)+3];
        y = (-100:1:100);
        
        x3 = [];
        x2= [];
        x4 = [];
        
        for i = 1:length(y)
            x4(i)= x_zero ;
            
            x3(i)= x_initial ;
            x2(i)= xr(1) ;
            
            
        end
        
        
        
        fplot(func,x,'b');
        hold on
        plot(x2, y,'r');
        hold on
        plot(x3, y,'y');
        hold on
        plot(x4, y,'g');
        hold off
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
elseif(strcmpi(name,'bierge vieta'))
    set(handles.resulttext,'Visible','On');
    set(handles.result,'Visible','On');
    set(handles.text1,'Visible','On');
    set(handles.text2,'Visible','On');
    set(handles.text3,'Visible','On');
    set(handles.text44,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    set(handles.result, 'String','iteration   error       root       time');
    if(isempty(mesg))
        set(handles.text1,'string',iterations);
        set(handles.text2,'string',error(iterations+1));
        set(handles.text3,'string',xr(iterations+1));
        set(handles.text44,'string',time);
        x= [xr(1)-3 xr(1)+3];
        
        
        y = (-100:1:100);
        
        x3 = [];
        x2= [];
        
        for i = 1:length(y)
            
            x3(i)= xr(2) ;
            x2(i)= xr(1) ;
            
            
        end
        
        fplot(func,x,'b');
        hold on
        plot(x2, y,'r');
        hold on
        plot(x3, y,'g');
        hold off
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
elseif(strcmpi(name,'general'))
    set(handles.resulttext,'Visible','On');
    set(handles.generalResult,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    if(isempty(mesg))
        x= [xr(1,2,1)-10 xr(1,3,1)+10];
        fplot(func,x,'b');
        hold on
        for i=1:size1
    
            
                         y = (-100:1:100);

             x3 = [];
        x2= [];
                x4= [];


        for ii = 1:length(y)

            x2(ii)=  xr(1,2,i) ;
                        x3(ii)=  xr(1,3,i) ;
                        x4(ii)=  xr(1,1,i) ;

            
        end
            
            
            
            
            plot(x2, y,'r');
            hold on
            plot(x3, y,'g');
            hold on
            plot(x4, y,'y');
            hold on
        end
        result='';
        result=[result,'time = ',num2str(time),'# of roots = ',num2str(size1),','];
        for i=1:size1
            result=[result,'root ',num2str(i),','];
            [iter,col]=size(xr(:,:,1,i))
            for j=1:iter
                result=[result,'itr ',num2str(j),',','xr = ',num2str(xr(iter,1,i)),'xl = ',num2str(xr(iter,2,i)),'xu = ',num2str(xr(iter,3,i)),'es = ',num2str(xr(iter,4,i))];
            end
        end
        set(handles.generalResult, 'String',result);
          %msg     
        else
            set(handles.messText,'Visible','On');
            set(handles.messText,'string',mesg);
    end
elseif(strcmpi(name,'all'))
    disp('all');
    set(handles.axesall1,'Visible','On');
    set(handles.axesall2,'Visible','On');
     %msg
      set(handles.messText,'Visible','Off'); 
            set(handles.messBi,'Visible','Off');
            set(handles.messFa,'Visible','Off');
            set(handles.messFi,'Visible','Off');
            set(handles.messNe,'Visible','Off');
            set(handles.messSe,'Visible','Off');
            set(handles.messBe,'Visible','Off');
            set(handles.messGe,'Visible','Off');
    axes(handles.axesall1);
    axes(handles.axesall2);
    
    xBisection=[],yBisection=[],xFalse=[],yFalse=[],xFixed=[],yFixed=[],
    xNewton=[],yNewton=[],,xSecant=[],ySecant=[],xBerge=[],yBerge=[],
    xGeneral=[],yGeneral=[];
    yBisectionEs=[],yFalseEs=[],yFixedEs=[],yNewtonEs=[],ySecantEs=[],
    yBergeEs=[],yGeneralEs=[];
    file=fopen('numerical.txt','wb');
    
    %BISECTION
    if(isempty(msgBisection))
        for i=1:itrBisection
            xBisection(i)=i;
            yBisection(i)=xrBisection(i,1);
            if(itrBisection>1)
                yBisectionEs(i)=xrBisection(i,4);
            else
                yBisectionEs(i)=0;
            end
        end
          %msg     
        else
            set(handles.messBi,'Visible','On');
            set(handles.messBi,'string',msgBisection);
    end
    %FALSE
    if(isempty(msgFalse))
        for i=1:itrFalsePosition
            xFalse(i)=i;
            yFalse(i)=xrFalsePosition(i,1);
            if(itrFalsePosition>1)
                yFalseEs(i)=xrFalsePosition(i,4);
            else
                yFalseEs(i)=0;
            end
        end
          %msg     
        else
            set(handles.messFa,'Visible','On');
            set(handles.messFa,'string',msgFalse);
    end
    %FIXED POINT
    if(isempty(msgFixed))
        for i=1:itrFixedPoint
            yFixed(i) =xrFixedPoint(i,1);
            xFixed(i) =i;
            yFixedEs(i) =xrFixedPoint(i,3);
        end
           %msg     
        else
            set(handles.messFi,'Visible','On');
            set(handles.messFi,'string',msgFixed);
    end
    %newton
    if(isempty(msgNewton))
        itr = size(xrNewton,1);
        for i=1:itr
            xNewton(i)=i;
            yNewton(i)=xrNewton(i);
            yNewtonEs(i)=errorNewton(i);
        end
          %msg     
        else
            set(handles.messNe,'Visible','On');
            set(handles.messNe,'string',msgNewton);
    end
    %SECANT
    if(isempty(msgSecent))
        itr = size(xrSecent,1);
        for i=1:itr
            xSecant(i)=i;
            ySecant(i) =xrSecent(i);
            ySecantEs(i) =errorSecent(i);
        end
         %msg     
        else
            set(handles.messSe,'Visible','On');
            set(handles.messSe,'string',msgSecent);
    end
    %BIERGE
    if(isempty(msgBierge))
        itr = loopBierge;
        for i=1:itr+1
            xBerge(i) = i;
            yBerge(i) = xrBierge(i);
            yBergeEs(i) = errorBierge(i);
        end
         %msg     
        else
            set(handles.messBe,'Visible','On');
            set(handles.messBe,'string',msgBierge);
    end
    %generalAll%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(isempty(msgGeneral))
        roots2D=[];
        es2D=[];
        for i=1:sizeGeneral
            [iter,col]=size(xrGeneral(:,:,1,i))
            x=[];
            for j=1:iter
                x(j)=j;
                roots2D(i,j) = xrGeneral(iter,1,i);
                es2D(i,j) = xrGeneral(iter,4,i);
            end
        end
         %msg     
        else
            set(handles.messGe,'Visible','On');
            set(handles.messGe,'string',msgGeneral);
    end
    %%%%%%%GRAPH
    axes(handles.axesall1);
    c = {};
    for k = 1 : size(roots2D,1)
        c = cat(2, c, x, roots2D([k],:) );
    end
    plot(c{:} , 'r');
    plot(xBisection,yBisection,'m',xFalse,yFalse,'c',xFixed,yFixed,'k',xNewton,yNewton,'y',xSecant,ySecant,'b',xBerge,yBerge,'g')
    axes(handles.axesall2);
    for k = 1 : size(es2D,1)
        c = cat(2, c, x, es2D([k],:) );
    end
    plot(c{:} , 'r');
    plot(xBisection,yBisectionEs,'m',xFalse,yFalseEs,'c',xFixed,yFixedEs,'k',xNewton,yNewtonEs,'y',xSecant,ySecantEs,'b',xBerge,yBergeEs,'g')
    legend('General','Bisection','False Position' ,'Fixed Point' ,'Newton','Secant','Berge')
end


function XuFalseText_Callback(hObject, eventdata, handles)
function XuFalseText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function XlFalseText_Callback(hObject, eventdata, handles)
function XlFalseText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function noOfIterationText_Callback(hObject, eventdata, handles)

function noOfIterationText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function precisionText_Callback(hObject, eventdata, handles)

function precisionText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function StepNumberText_Callback(hObject, eventdata, handles)

function StepNumberText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FilePathText_Callback(hObject, eventdata, handles)

function FilePathText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function resultText_Callback(hObject, eventdata, handles)

function resultText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text44_Callback(hObject, eventdata, handles)

function text44_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text55_Callback(hObject, eventdata, handles)

function text55_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text66_Callback(hObject, eventdata, handles)

function text66_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text3_Callback(hObject, eventdata, handles)

function text3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text2_Callback(hObject, eventdata, handles)

function text2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function text1_Callback(hObject, eventdata, handles)

function text1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function time_Callback(hObject, eventdata, handles)

function time_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function generalResult_Callback(hObject, eventdata, handles)
function generalResult_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit27_Callback(hObject, eventdata, handles)

function edit27_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function messText_Callback(hObject, eventdata, handles)

function messText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messBi_Callback(hObject, eventdata, handles)

function messBi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messFa_Callback(hObject, eventdata, handles)
function messFa_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messFi_Callback(hObject, eventdata, handles)

function messFi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messNe_Callback(hObject, eventdata, handles)

function messNe_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messSe_Callback(hObject, eventdata, handles)
function messSe_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messBe_Callback(hObject, eventdata, handles)

function messBe_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function messGe_Callback(hObject, eventdata, handles)

function messGe_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
