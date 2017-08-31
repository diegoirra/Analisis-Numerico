function [t, V] = resolver_ode23_e1()

options = odeset;
fvdp_e1 = @(t, v) [v(2); (1-v(1)^2)*v(2) - v(1)];
[t, V] = ode23(fvdp_e1, [0 30], [1 0], options);

plot(V(1), V(2));

endfunction

% para ver el grafico pueden correr el programa de la forma:

% [t, u] = resolver_ode23_e1

%si no ponen ; al final esto les imprime la respuesta, y despues pueden:

%plot(t, u)

%y les sale el grafico

%%% IMPORTANTE:
%%%
%%% Lo mas probable es que les diga que tienen que instalar odpkg para usar ode45
%%% o les va a decir que octave tiene lsode para resolver eso.
%%% Para instalarlo les dejo el tar.gz aca mismo en la carpeta de dropbox.
%%% tienen que correr la linea:

%%% pkg install odepkg-0.8.5.tar.gz

%%% si no les sale nada, o salvo algun warning, probablmente se instalo bien.
%%% despues lo tienen que cargar, de la forma:

%%% pkg load all

%%% ESTA LINEA LA TIENEN QUE METER CADA VEZ QUE ABREN EL PROGRAMA.
