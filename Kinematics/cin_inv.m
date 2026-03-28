%Esta funcion recibe como parametros angulos, para luego calcular la posicion del efector final,
% y dibujar esa posicion.

function [q] = cin_inv(P)


%calcula cinematica inversa con un punto x,y,z 
L1=0.105;
L2=0.12;
L3=0.082;
L4=0.14;

    % ángulo theta1 (rotación en la base):
    q1 = atan2(P(2), P(1));  

    % distancia horizontal desde la base al punto proyectado en XY:
    D = sqrt(P(1)^2 + P(2)^2) - L4 * cosd(0); 

    % altura vertical desde la base al punto P menos la proyección de L4:
    Z = P(3) - L1 - L4 * sind(0);

    % distancia total desde la base al punto final P:
    J = sqrt(D^2 + Z^2);

    % ángulo theta3 (rotación del codo):
    cos_q3 = (J^2 - L2^2 - L3^2) / (2 * L2 * L3);
    cos_q3 = min(max(cos_q3, -1), 1);  
    q3 = acos(cos_q3);  

    % ángulo theta2 (rotación del hombro):
    beta = atan2(L3 * sin(q3), L2 + L3 * cos(q3));
    alfa = atan2(Z, D);
    q2 = alfa - beta; 

    % cálculo del ángulo theta4 (rotación de la muñeca)
    q4 = 0 - (q2 + q3);

    % limitar los ángulos entre -180 y 180 grados:
    q1 = mod(q1 + 180, 360) - 180;
    q2 = mod(q2 + 180, 360) - 180;
    q3 = mod(q3 + 180, 360) - 180;
    q4 = mod(q4 + 180, 360) - 180;



% convertir los ángulos de radianes a grados
q1 = q1 * 180 / pi;
q2 = q2 * 180 / pi;
q3 = q3 * 180 / pi;
q4 = q4 * 180 / pi;

%vector con todos los ángulos
q = [q1 q2 q3 q4];
 
 
cin_direc(q) 
end

