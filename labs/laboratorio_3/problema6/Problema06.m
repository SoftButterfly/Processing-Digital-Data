n = -20:1:20;
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
    title('$$\rm y(n)=x(n)*h(n)$$','interpreter','latex','FontSize',20)