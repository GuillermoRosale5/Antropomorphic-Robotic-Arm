% Dibujar una linea a partir de dos puntos

function linea( p0, p1, color, grosor )
% vectores que contienen las componentes de los puntos a dibujar
x = [ p0(1), p1(1)];
y = [ p0(2), p1(2)];
z = [ p0(3), p1(3)];

% dibujo de las lineas
plot3(x,y,z, 'Color', color ,'LineWidth',grosor);

grid on

