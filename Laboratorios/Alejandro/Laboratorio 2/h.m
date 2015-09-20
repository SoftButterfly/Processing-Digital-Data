function h=h(t)
h=1.*(t>=-2&t<-1)-t.*(t>=-1&t<0)+1.*(t>=0&t<1)-(t-2).*(t>=1&t<2);
end