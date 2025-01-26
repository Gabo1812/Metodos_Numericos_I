%{

              _.--""`-..
            ,'          `.
          ,'          __  `.
         /|          " __   \
        , |           / |.   .
        |,'          !_.'|   |
      ,'             '   |   |
     /              |`--'|   |
    |                `---'   |
     .   ,                   |                       ,".
      ._     '           _'  |                    , ' \ `
  `.. `.`-...___,...---""    |       __,.        ,`"   L,|
  |, `- .`._        _,-,.'   .  __.-'-. /        .   ,    \
-:..     `. `-..--_.,.<       `"      / `.        `-/ |   .
  `,         """"'     `.              ,'         |   |  ',,
    `.      '            '            /          '    |'. |/
      `.   |              \       _,-'           |       ''
        `._'               \   '"\                .      |
           |                '     \                `._  ,'
           |                 '     \                 .'|
           |                 .      \                | |
           |                 |       L              ,' |
           `                 |       |             /   '
            \                |       |           ,'   /
          ,' \               |  _.._ ,-..___,..-'    ,'
         /     .             .      `!             ,j'
        /       `.          /        .           .'/
       .          `.       /         |        _.'.'
        `.          7`'---'          |------"'_.'
       _,.`,_     _'                ,''-----"'
   _,-_    '       `.     .'      ,\
   -" /`.         _,'     | _  _  _.|
    ""--'---"""""'        `' '! |! /
                            `" " -' mh

%}


%interpolación clase pasada

% Nuevo codigo 

function Yt = Neuville_interpolation(x,y,xt,epsilon)
% No se para que sirve pero ahi esta
%clearvars;
%x = (0:0.1:1)';
%y = exp(x);
%figure(1);
%plot(x,y, ' o r ');
%xt = 0.05;
%epsilon = 1e-3;

    Q = zeros(size(x,1), size(x,1));
    Q(:,1 )= y(:);
    for i=2:size(x,1)
        for j=2:i
            Q(i,j) = ((xt-x(i-j+1))*Q(i,j-1)-(xt-x(i))*Q(i-1,j-1))/(x(i)-x(i-j+1));
        end
        if abs(Q(i,j)-Q(i-1,j-1)) < epsilon
            break;
        end
    end
    Yt = Q(i,i); 

end

