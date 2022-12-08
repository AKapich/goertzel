function [x_0] = secant(a, b, factors, eps, x1, x2, max_iter)
% funkcja oblicza wartosc miejsca zerowego funkcji func
% w przedziale (a, b) 

% jezeli przedział jest podany na odwrót to odwaracamy go
if b < a
    disp("podano na odwrót przedział")
    p = a;
    a = b;
    b = p;
end
if nargin == 3
    eps = 0.1;
    x1 = (a+b)/2;
    x2 = a + (b-a)/3;
    max_iter = 10;
end

iter = 2;

% kolejne przybliżenia
x = zeros(max_iter+1, 1);

%fx = zeros(max_iter+1, 1); dla lepszego performancu

% ustalamy pierwsze dwa przybliżenia
x(1) = x1;
x(2) = x2;

disp("3 - trzecie")
disp(x(3))

while iter <= max_iter
    % jezeli przybliżenia są dostatecznie blisko siebie, to konczymy
    % dzialanie programu
    if abs(x(iter-1) - x(iter)) < eps
        x_0 = x(iter);
        return 
    end
    % liczymy kolejne przyblizenie miejsca zerowego
    fdiff = find_cos(x(iter), factors) - find_cos(x(iter-1), factors);
    disp(fdiff)

    disp(x(iter))
    x(iter+1) = x(iter) - find_cos(x(iter), factors)*(x(iter) - x(iter-1))/fdiff;
    iter = iter + 1;
end
% jezeli doszlismy do tego miejsca to de facto nie znaleziono miejsca zerowego
disp("brak miejsca zerowego")
x_0 = x(iter);



end