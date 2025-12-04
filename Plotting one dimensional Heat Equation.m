function pdex1
 x = linspace(0,1,20);  % 0<x<1 in question
 t = linspace(0,10,20);
 m = 0;
 
 sol = pdepe(m,@pdefun,@pdeic,@pdebc,x,t);
 u = sol(:,:,1);
 
 surf(x,t,u)
 xlabel('x'); ylabel('t'); zlabel('u(x,t)')
 
 figure(2)            %fixed t
 plot(x,u(end,:))     %t is 0 to 10 so use end for 10
 title('Solution at t = 10')
 xlabel('x'); ylabel('u(x,10)')
 
 figure(3)            %fixed x
 plot(t,u(:,10))      %0.5*20=10
 title('Solution at x = 0.5')
 xlabel('t'); ylabel('u(0.5,t)')
 
 function [c, f, s] = pdefun(x,t,u,DuDx)
 c = 1;
 f = DuDx;
 s = 0;
 
 function u0 = pdeic(x)
 u0 = 3*sin(2*pi*x);
 
 function [pl,ql,pr,qr] = pdebc(xl,ul,xr,ur,t)
 pl=ul;
 ql=0;
 pr=ur;
 qr=0;