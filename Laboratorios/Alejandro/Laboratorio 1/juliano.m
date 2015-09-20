function juliano
clear all
clc
d=input('Escriba el dia Juliano:');
a=input('Escriba el a?o: ');
m=0;
if (rem(a,4)==0 && rem(a,100)~=0);
    if d<0 || d>366
        fprintf ('Usted ha ingresado un numero no valido\n');
    else
        if d>31 && d<=60
            f=d-31;
            m=2;
        else if d>60 &&d<=91
            f=d-60;
            m=3;
        else if d>91 &&d<=121
            f=d-91;
            m=4;
        else if d>121 &&d<=152
            f=d-121;
            m=5;
        else if d>152 &&d<=182
            f=d-152;
           m=6;
        else if d>182 &&d<=213
            f=d-182;
            m=7;
        else if d>213 &&d<=244
            f=d-213;
            m=8;
        else if d>244 &&d<=274
            f=d-244;
            m=9;
        else if d>274 &&d<=305
            f=d-274;
            m=10;
        else if d>305 &&d<=335
            f=d-305;
            m=11;
        else if d>335 &&d<=366
            f=d-335;
            m=12;
            else
            f=d;
            m=1;
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
        end
    end
else
    if d<0 || d>365
        fprintf ('Usted ha ingresado un numero no valido\n');
    else
        if d>31 && d<=59
            f=d-31;
            m=2;
        else if d>59 &&d<=90
            f=d-59;
            m=3;
        else if d>90 &&d<=120
            f=d-90;
            m=4;
        else if d>120 &&d<=151
            f=d-120;
            m=5;
        else if d>151 &&d<=181
            f=d-151;
           m=6;
        else if d>181 &&d<=212
            f=d-181;
            m=7;
        else if d>212 &&d<=243
            f=d-212;
            m=8;
        else if d>243 &&d<=273
            f=d-243;
            m=9;
        else if d>273 &&d<=304
            f=d-273;
            m=10;
        else if d>304 &&d<=334
            f=d-304;
            m=11;
        else if d>334 &&d<=365
            f=d-334;
            m=12;
            else
            f=d;
            m=1;
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
        end
    end
end
if (m~=0)
    switch (m)
    case 1
        fprintf ('Es el %2.0f de Enero del %2.0f\n', f, a);
    case 2
        fprintf ('Es el %2.0f de Febrero del %2.0f\n', f, a);
    case 3
        fprintf ('Es el %2.0f de Marzo del %2.0f\n', f, a);
    case 4
        fprintf ('Es el %2.0f de Abril del %2.0f\n', f, a);
    case 5
        fprintf ('Es el %2.0f de Mayo del %2.0f\n', f, a);
    case 6
        fprintf ('Es el %2.0f de Junio del %2.0f\n', f, a);
    case 7
        fprintf ('Es el %2.0f de Julio del %2.0f\n', f, a);
    case 8
        fprintf ('Es el %2.0f de Agosto del %2.0f\n', f, a);
    case 9
        fprintf ('Es el %2.0f de Septiembre del %2.0f\n', f, a);
    case 10
        fprintf ('Es el %2.0f de Octibre del %2.0f\n', f, a);
    case 11
        fprintf ('Es el %2.0f de Noviembre del %2.0f\n', f, a);
    case 12
        fprintf ('Es el %2.0f de Diciembre del %2.0f\n', f, a);
    end
end
end 