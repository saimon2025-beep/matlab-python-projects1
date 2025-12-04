%5
alpha=2.9;
beta=1;
delta=3.58;
gamma=0.2;
t=0:100;

f=@(xn,yn) alpha*xn*(1-xn)-beta*xn*yn;
g=@(xn,yn) delta*xn*yn-gamma*yn;
xn=[];       %array define
yn=[];
xn(1)=0.2;
yn(1)=2;
for i=2:101
    xn(i)=f(xn(i-1),yn(i-1));
    yn(i)=g(xn(i-1),yn(i-1));
end
plot(t,xn,t,yn)
figure(2)
plot(xn,yn)  %phase plot

hold on
syms x y lambda
[u,v]=solve(f(x,y)==x,g(x,y)==y);       %fixed point
ce(x,y)=charpoly(jacobian([f(x,y),g(x,y)],[x,y]),lambda);    %characteristic equation
for i=1:3
    eval=solve(ce(u(i),v(i))==0,lambda);     % value of eigenvalue
    fprintf('%f,%f',u(i),v(i))
    if real(eval)==1
        fprintf(' non hyperbolic \n')    %discrete that is why
    elseif real(eval)<1
        fprintf(' stable \n')
    elseif real(eval)>1
        fprintf(' unstable \n')
    else
        fprintf(' saddle \n')
    end
    plot(u(i),v(i),'*r')      %for showing fixed points in phase plot (extra)
    hold on
end
hold off

figure()
for alpha=2.8:0.05:3
    f=@(xn,yn) alpha*xn*(1-xn)-beta*xn*yn;
    g=@(xn,yn) delta*xn*yn-gamma*yn;
    t=0:100;
    xn=[];
    yn=[];
    xn(1)=0.2;
    yn(1)=2;
    for i=2:101
        xn(i)=f(xn(i-1),yn(i-1));
        yn(i)=g(xn(i-1),yn(i-1));
    end 
    plot(xn,yn)
end