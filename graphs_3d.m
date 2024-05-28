##clear
##t = 0:0.01:9*pi;
##x = 2*sin(t);
##y = 3*cos(t);
##z = t;
##comet3(x,y,t)
##grid on
##x = -5:0.2:5;
##y = -5:0.2:5;
##[X,Y] = meshgrid(x,y);
##Z = sin(sqrt(X.^2 + Y.^2))./sqrt((X.^2 + Y.^2));
##
##clear
##x = -pi:0.1:pi;
##y = -pi:0.1:pi;
##[X,Y] = meshgrid(x,y);
##
##Z = 20 - X.^2 - Y.^2
##
##surf(X,Y,Z)
##shading interp
##colormap('cool')
##
##clear
##u = 0:0.0314:3*pi;
##v = -1:0.01:1;
##[U,V] = meshgrid(u,v);
##X = (1 + ((V./2).*(cos(U./2)))).*(cos(U));
##Y = (1 + ((V./2).*(cos(U./2)))).*(sin(U));
##Z = ((V./2).*(sin(U./2)));
##surf(X,Y,Z)
##shading interp
##colormap('cool')

x = 0:pi/100:4*pi;
y = x
[X,Y] = meshgrid(x,y);
Z = 3*sin(X) + cos(Y);
h = surf(Z);
axis manual
set(gca,'nextplot', 'replacechildren')
shading interp
colormap(ocean)
k = pi/100;
while k < 2*pi
  k = k + pi/100;
  Z = (3*sin(X) + cos(Y)).*sin(k);
  set(h, 'ZData', Z)
  drawnow
  if k > 2*pi - pi/100
    k = 0;
  endif
end

