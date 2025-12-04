syms x y(x)
sol(x) = dsolve(diff(y) == (4*x-x^3)/(4+y^3))
y0=[-3 -2 -1 0 1 2 3];

for i=1:length(y0)
    syms x y(x)
    sol(x)=dsolve(diff(y) == (4*x-x^3)/(4+y^3),y(0)==y0(i));
    x=-5:0.1:5;
    plot(x,sol(x),'LineWidth',2)
    hold on
    plot(0,y0(i),'*','LineWidth',3)
end

%%
clear x y 
syms x y(x)
sol(x) = dsolve(diff(y) == (4*x-x^3)/(4+y^3),y(0)==1)
x = -5:.1:5;
plot(x,sol(x),'LineWidth',2)
hold on 
plot(0,1,'o','LineWidth',2)
grid on

%%
syms y
soly = solve(4+y^3 ==0,y)

syms x y(x)
for i=1:length(soly)
    val=subs(dsolve(diff(y) == (4*x-x^3)/(4+y^3),y(0)==1),y,soly(i));
    solx=solve(val(i),x)
end