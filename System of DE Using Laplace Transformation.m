syms t y(t) s x(t) X Y

lapx1=laplace(diff(x)==2*x-3*y,t,s);
lapy1=laplace(diff(y)==y-2*x,t,s);

lapx2=subs(lapx1,{'laplace(x(t),t,s)','laplace(y(t),t,s)','x(0)'},{X,Y,8});
lapy2=subs(lapy1,{'laplace(x(t),t,s)','laplace(y(t),t,s)','y(0)'},{X,Y,3});

[X(s),Y(s)]=solve(lapx2==0,lapy2==0,[X,Y]);
x(t)=ilaplace(X(s))
y(t)=ilaplace(Y(s))

t=0:0.2:10;
plot(t,x(t),'--b')
hold on
plot(t,y(t),'--r')
legend('x(t)','y(t)')