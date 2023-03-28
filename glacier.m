% Script for plotting Glacier exercise data
% Zach Lifton, 11/19/09

clear
% Plot upper line:
for k = 1:15
    Ts(k) = k + (-3);
    A(k) = 1.33*(Ts(k) + 9.66)^(2.85);
end

plot(Ts,A,'k-');
% hAnnotation = get(object_handle,'Annotation');
% hLegendEntry = get(hAnnotation','LegendInformation');
% set(hLegendEntry,'IconDisplayStyle','off');
title('Mean summer temperature versus winter snow accumulation');
xlabel('Summer Temperature (degrees C)');
ylabel('Winter Snow Accumulation (mm water)');
hold on

% Plot lower line:
for k = 1:141
    Ts(k) = 0.1*(k + (-21));
    A(k) = 1.33*(Ts(k) + 6.66)^(2.85);
end

plot(Ts,A,'k-');
hold on

% Plot Rocky Mountain data points:
S = [10.7 11.2 9.5 9.0 10.4 8.6 7.7 8.4 8.7 9.1 9.3 8.2];
W = [829 674 421 433 362 429 301 351 422 529 721 481];
plot(S,W,'ko');
axis([-2 12 0 9000]);

for j = 1:12
    for m = 1:141;
        T(m) = (m-1)*0.1;
        b(m) = (0.063)*W(j)*10*(T(m));
        a(m) = 1.33*(T(m) + 6.66)^(2.85);
    end
    % Plot incremental "paths" of glacial points with changing temp:
    x =(S(j)-T);
    y =(W(j)+b);
%     % find xcross and ycross:
    xcut = x(1:(((S(j)-3)*10)+2));
    ycut = y(1:(((S(j)-3)*10)+2));
%     Tscut = Ts(51:133);
%     Acut = Ts(51:133);
%     diff = fliplr(Acut) - ycut;
%     crossover = diff(1:end-1).*diff(2:end);
%     distance(j) = find(crossover < 0);
%     distance(j) = sqrt(((S(j)-xcross)^2) + (ycross-W(j))^2);
    plot(xcut,ycut,'b-');
    %     plot((S(j)-deltaTp),(W(j)+deltaA),'b-');
end

% disp('Distance from Pleistocene glacial conditions to modern ELA:');
% distance


% Make-shift method:
xorig = S;
yorig = W;
xcross = [7.5 7.2 5.2 5.1 5.2 4.9 3.8 4.4 4.9 5.6 6.4 5.0];
ycross = [2500 2372 1548 1497 1561 1423 1041 1236 1423 1695 2038 1451];
for j = 1:12
    distance(j) = sqrt(((xorig(j)-xcross(j))^2) + (ycross(j)-yorig(j))^2);
end
distance

plot(11.2,337,'ro');
plot(11.2,1348,'ro');

for m = 1:101;
    temp(m) = (m-1)*0.1;
    u(m) = (0.063)*3370*(T(m));
    v(m) = (0.063)*13480*(T(m));
end

plot(11.2-temp,337+u,'r-');
plot(11.2-temp,1348+v,'r-');

% Old method, not correct:
% % Finding the least and most glacial points:
% for k = 1:12
%     ydist(k) = (1.33*(S(k) + 6.66)^(2.85)) - W(k);
%     xdist(k) = abs(((W(k)/1.33)^(1/2.85) - 6.66) - S(k));
% end
% 
% for j = 1:12
%     theta(j) = atand(ydist(j)/xdist(j));
%     l(j) = xdist(j)*sind(theta(j));
% end
% 
% % Display max and min distances from glacial envelope:
% max(l)
% min(l)
% 
% % Plot points and lines:
% least_glac_A = 1.33*(S(5) + 6.66)^(2.85);
% most_glac_A = 1.33*(S(11) + 6.66)^(2.85);
% least_glac_temp = (W(5)/1.33)^(1/2.85) - 6.66;
% most_glac_temp = (W(11)/1.33)^(1/2.85) - 6.66;
% plot(most_glac_temp,W(11),'ro');
% plot(least_glac_temp,W(5),'bo');
% plot(S(11),most_glac_A,'ro');
% plot(S(5),least_glac_A,'bo');
% 
% x = [S(5) S(5)];
% y = [W(5) least_glac_A];
% a = [least_glac_temp S(5)];
% b = [W(5) W(5)];
% plot(x,y,'b-');
% plot(a,b,'b-');
% 
% u = [S(11) S(11)];
% v = [W(11) most_glac_A];
% c = [most_glac_temp S(11)];
% d = [W(11) W(11)];
% plot(u,v,'r-');
% plot(c,d,'r-');
% 
% % Display the distance of most and least glacial points from envelope:
% disp('Least glacial summer temp depression:')
% xdist(5)
% disp('Least glacial winter accumulation increase:')
% ydist(5)
% 
% disp('Most glacial summer temp depression:')
% xdist(11)
% disp('Most glacial winter accumulation increase:')
% ydist(11)
