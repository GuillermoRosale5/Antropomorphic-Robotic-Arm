
%Función que sirve para dibujar un sistema de coordenadas
%teniendo una matriz de transformación homogenea (A) y una longitud t

function sist_coor(A,t,E)
    a1=[0;0;0;1];
    b1=[t;0;0;1];
    c1 = [0;t;0;1];
    d1 = [0;0;t;1];

    a0 = A*a1;
    b0 = A*b1;
    c0 = A*c1;
    d0 = A*d1;

    rojo =[1, 0, 0];
    verde = [0, 1, 0]; 
    azul = [0, 0,1];

    linea(a0,b0,rojo,4);
    hold on
    linea(a0,c0,azul,4);
    hold on
    linea(a0,d0,verde,4);
    hold on

     axis([-15 45 -15 45 -15 45])

 text(b0(1), b0(2), b0(3), E(1,1:2), 'Color', rojo);
    text(c0(1), c0(2), c0(3), E(1,3:4), 'Color', azul);
    text(d0(1), d0(2), d0(3), E(1,5:6), 'Color', verde);
