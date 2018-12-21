%y(x)=2*x para x<1 
%y(x)=3*x-1 para 1<=X<=2 
%y(x)=5*x-5 para x>2 

%para visualizarla podemos hacer una función como la siguiente: 

function yidresult=yid(x,m1,m2,b1,b2,b3,b4,t1,t2) 
y1=m1*x + b1; 
y2=m2*x + b2;
y3=m1*x + b3;
y4=m2*x + b4;
yidresult=y1.*(x<=t1)+y2.*((x>t1)&(x<=t2))+y3.*((x>t2)&(x<=(t2+t1)))+y4.*((x>(t2+t1))&(x<=(2*t2))); 
end