%1(a)

c = [1; 2];     % Minimize z = x + 2y
a = [1, -2; 3, 2; -1, 1]; % -x+2y>0 ---> x-2y<0
b = [0; 10; 1];
lb = [1; 0];    % Lower bounds
ub = [3; 5];    % Upper bounds

[x, z] = linprog(c, a, b, [], [], lb, ub);

sprintf('  x = %f\n  y = %f\n  min z = %f\n',x(1),x(2),z)