L = 10; 
teta = pi; 
x = 0; 
y = 0; 
ZmianaX=0; 
ZmianaY=0; 
% promieñ kó³ 
R = 2 ; 
% wype³nienie PWM dla ko³a 1 
kolo1 = 100/255; 
% wype³nienie PWM dla ko³a 2 
kolo2 = 90/255; 

% rysowanie po³o¿enia robota
while(1)
    % wype³nienie PWM w procentach dla ko³a 1
    PWM1 = kolo1*100; 
    % wype³nienie PWM w procentach dla ko³a 2
    PWM2 = kolo2*100; 
    % prêdkoœæ k¹towa dla ko³a 1 
    ZmianaTeta1 = kolo1*teta; 
    % prêdkoœæ k¹towa dla ko³a 2 
    ZmianaTeta2 = kolo2*teta; 
    
    ZmianaX = (ZmianaTeta1+ZmianaTeta2) * R / 2  * cos(teta) * 0.01; 
    ZmianaY = (ZmianaTeta1+ZmianaTeta2) * R / 2  * sin(teta) * 0.01;
    ZmianaTeta = R * (ZmianaTeta2 - ZmianaTeta1) / L * 0.01; 
    % wyliczenie zmiany po³o¿enia w osi X
    x = x + ZmianaX; 
    % wyliczenie zmiany po³o¿enia w osi Y  
    y = y + ZmianaY;  
    % wyliczenie zmiany k¹ta
    teta= teta + ZmianaTeta; 
    % nowe po³o¿enie robota w osi X
    X = [ x+ZmianaX+L*sin(teta)/2 x+ZmianaX-L*sin(teta)/2]; 
    % nowe po³o¿enie robota w osi Y
    Y = [ y+ZmianaY-L*cos(teta)/2 y+ZmianaY+L*cos(teta)/2]; 
    
    plot(X,Y) 
    axis([-100 100 -100 100]);
    hold on
    plot(X,Y)
    hold on     
    hold off
    pause(0.01)
        
end
