%% Problema 6a
t   = -2:0.01:2;
x   = triangle(t/2);
FTx = sinc(t/2).*sinc(t/2);
plot(t,x)
plot(t,FTx)
figure(1)
  subplot(1,2,1)
    plot(t,x)
    grid on
    ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$x(t)=\rm \Lambda \left(\frac{\it t}{2}\right)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('t','FontSize',16,'FontName','Cambria');
    ylabel('\it{x}\rm(\it{t}\rm)','FontSize',16,'FontName','Cambria');
  subplot(1,2,2)
    plot(t,FTx)
    grid on
    ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$F_{[x(t)]}(\omega)=\rm Sinc \left(\frac{\it \omega}{2}\right)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('\omega','FontSize',16,'FontName','Cambria');
    ylabel('F_{[x(t)]}(\omega)','FontSize',16,'FontName','Cambria');

%% Problema 6b
T = 0.8;
n = -2:2;
f = 0:0.125:2;
X = zeros(size(f)) ;
for k = 1: length(f)
    X(k) = sum(T.*triangle(n*T/2).*exp(-1i*2*pi.*f(k).*n*T));
end
figure(2)
  subplot(1,2,1)
    plot(n,triangle(n/2))
    grid on
    ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$x(t)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('t','FontSize',16,'FontName','Cambria');
    ylabel('\it{x}\rm(\it{t}\rm)','FontSize',16,'FontName','Cambria');
  subplot(1,2,2)
    plot(f,real(X))
    grid on
    %ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$F(\omega)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('\omega','FontSize',16,'FontName','Cambria');
    ylabel('F_{[x(t)]}(\omega)','FontSize',16,'FontName','Cambria');
    
%% Problema 6c
T = 0.08;
n = -2:2;
f = 0:0.125:2;
X = zeros(size(f)) ;
for k = 1: length(f)
    X(k) = sum(T.*triangle(n*T/2).*exp(-1i*2*pi.*f(k).*n*T));
end
figure(3)
  subplot(1,2,1)
    plot(n,triangle(n/2))
    grid on
    ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$x(t)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('t','FontSize',16,'FontName','Cambria');
    ylabel('\it{x}\rm(\it{t}\rm)','FontSize',16,'FontName','Cambria');
  subplot(1,2,2)
    plot(f,real(X))
    grid on
    %ylim([-0.2 1.2])
    set(gca,'FontSize',12,'FontName','Cambria');
    title('$$F(\omega)$$',...
          'Interpreter','latex','FontSize',18);
    xlabel('\omega','FontSize',16,'FontName','Cambria');
    ylabel('F_{[x(t)]}(\omega)','FontSize',16,'FontName','Cambria');