clear all;
f = @(z) (z).^3 - 1;
fpr = @(z) 3*(z).^2;

roots_actual = roots([1, 0, 0, -1]);

x_values = -2:0.01:2;
y_values = -2:0.01:2;
[X, Y] = meshgrid(x_values, y_values);

% Максимальное число итераций и точность
max_iter = 10;
tol = 1e-2;

closest_root = zeros(size(X));

for i = 1:numel(x_values)
    for j = 1:numel(y_values)
        zn = complex(x_values(i), y_values(j));
        for iter = 1:max_iter
            zn_next = zn - f(zn) / fpr(zn);
            if abs(zn_next - zn) < tol
                break;
            end
            zn = zn_next;
        end

        distances = abs(roots_actual - zn);
        [~, idx] = min(distances);
        closest_root(j, i) = idx;
    end
end

colors = ['r', 'g', 'b'];

for k = 1:3
    [x, y] = find(closest_root == k);
    plot(x_values(x), y_values(y), [colors(k) '.']);
    hold on
end
hold off;
title('Newton Fractal for the function z^3 - 1');
xlabel('Real Part');
ylabel('Imaginary Part');
colormap([1 0 0; 0 1 0; 0 0 1]);

