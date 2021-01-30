set(0,'DefaultFigureWindowStyle','docked')
set(0,'Defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'defaultLineLineWidth',2)

clear all
close all

x = 0;
xp = 0;

v = 0;
F = 1;
m = 1;
dt = 1;
nt = 1000;
np = 1;
x = zeros(np,1);
v = zeros(np,1);
t = 0;
ra = 0;

for i = 2:nt
    t(i) = t(i-1) + dt;
    
    v(:,i) = v(:,i-1) +F/m+dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt +F/m+dt^2/2;
    
    r = rand(np,1) < 0.05;
    v(r,i) = ra*v(r,i);
    AveV(i,:) = mean(v,2);
    
    
    subplot(3,1,1),plot(t,v);hold on
    subplot(3,1,1),plot(t,AveV,'g+');
    hold off
    
    xlabel('time')
    ylabel('x')
    title(['Average √:' num2str(AveV(i))])
    subplot(3,1,2),plot(x(1,:),v(1,:),'r-'); hold on 
    subplot(3,1,2),plot(x(1,:),AveV, 'g+'); 
    hold off
    xlabel('x')
    ylabel('v')
    
    subplot(3,1,3),plot(t,x,'-');
    xlabel('time')
    ylabel('x')
    
    pause(0.01)
end
display('Average V')
mean(v)    
    