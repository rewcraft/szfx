function s=fdlag(x1,x2,x3,y1,y2,y3,u)
s=y1*(u-x2)*(u-x3)/((x1-x2)*(x1-x3))+y2*(u-x1)*(u-x3)/((x2-x1)*(x2-x3))+y3*(u-x1)*(u-x2)/((x3-x2)*(x3-x1));
end