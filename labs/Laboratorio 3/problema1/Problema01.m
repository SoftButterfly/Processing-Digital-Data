n = -10:1:10;

figure(1)
  x = funX(n); 
  h = funH(n);
  y = conv(x,h);
  subplot (2,2,1);
    stem(n,x,'r')
    grid on
    ylim([min(x)-0.5 max(x)+0.5])
    title('$$\rm x(n)$$','interpreter','latex','FontSize',20)
  subplot (2,2,3);
    stem(n,h,'g')
    grid on
    ylim([min(h)-0.5 max(h)+0.5])
    title('$$\rm h(n)$$','interpreter','latex','FontSize',20)
  subplot (1,2,2);
    stem(-(length(y)-1)/2:1:(length(y)-1)/2,y,'b')
    grid on
    ylim([min(y)-0.5 max(y)+0.5])
    title('$$\rm y_{1}(n)=x(n)*h(n)$$','interpreter','latex','FontSize',20)
figure(2)
  x = funX(n+2); 
  h = funH(n);
  y = conv(x,h);
  subplot (2,2,1);
    stem(n,x,'r')
    grid on
    ylim([min(x)-0.5 max(x)+0.5])
    title('$$\rm x(n+2)$$','interpreter','latex','FontSize',20)
  subplot (2,2,3);
    stem(n,h,'g')
    grid on
    ylim([min(h)-0.5 max(h)+0.5])
    title('$$\rm h(n)$$','interpreter','latex','FontSize',20)
  subplot (1,2,2);
    stem(-(length(y)-1)/2:1:(length(y)-1)/2,y,'b')
    grid on
    ylim([min(y)-0.5 max(y)+0.5])
    title('$$\rm y_{2}(n)=x(n+2)*h(n)$$','interpreter','latex','FontSize',20)
figure(3)
  x = funX(n); 
  h = funH(n+2);
  y = conv(x,h);
  subplot (2,2,1);
    stem(n,x,'r')
    grid on
    ylim([min(x)-0.5 max(x)+0.5])
    title('$$\rm x(n)$$','interpreter','latex','FontSize',20)
  subplot (2,2,3);
    stem(n,h,'g')
    grid on
    ylim([min(h)-0.5 max(h)+0.5])
    title('$$\rm h(n+2)$$','interpreter','latex','FontSize',20)
  subplot (1,2,2);
    stem(-(length(y)-1)/2:1:(length(y)-1)/2,y,'b')
    grid on
    ylim([min(y)-0.5 max(y)+0.5])
    title('$$\rm y_{3}(n)=x(n)*h(n+2)$$','interpreter','latex','FontSize',20)
