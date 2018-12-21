%y(x)=2*x para x<1 
%y(x)=3*x-1 para 1<=X<=2 
%y(x)=5*x-5 para x>2 

%para visualizarla podemos hacer una función como la siguiente: 

function yidresult=yid(x,m,b,b1,t1,t2) 
y1=0; 
y2=m*x + b;
y3=m*x + b1;
yidresult=y1.*(x<=t1)+y2.*((x>t1)&(x<=t2))+y1.*((x>t2)&(x<=(t2+t1)))+y3.*((x>(t2+t1))&(x<=(2*t2))); 
end

