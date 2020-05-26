[x y] = meshgrid(-10:1:10);
z = 2.*x + 3.*y + 4;
surf(x,y,z);

hold on;
plot3(DataX, DataY, DataZ);