%1

tspan=[0 10];
r=2.855;
k=3;
f=@(t,p) r*p*(1-p/k);

for p0=0.1:0.5:5
    [t, sol]=ode45(f,tspan,p0);
    plot(t,sol);
    hold on
end

[u,v]=meshgrid(0:0.1:10,0.2:0.2:5);
m=r.*v.*(1-v./k);
l=sqrt(1+m.^2);
hold on
quiver(u,v,1./l,m./l)
axis tight