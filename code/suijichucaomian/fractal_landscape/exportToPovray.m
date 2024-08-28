function exportToPovray(x)
nm=5/size(x,1);
fd=fopen('fractal_landscape.pov','w+');
fprintf(fd,'#include "colors.inc"\n');
fprintf(fd,'#include "stones.inc"\n');
fprintf(fd,'#include "textures.inc"\n');
fprintf(fd,'#include "shapes.inc"\n');
fprintf(fd,'#include "glass.inc"\n');
fprintf(fd,'#include "metals.inc"\n');
fprintf(fd,'#include "woods.inc"\n');
fprintf(fd,'#declare c1 = texture { T_Stone1 scale 1 }\n');
fprintf(fd,'light_source { <0, 2, 2> color White}\n');
fprintf(fd,'camera { location <3, 1, -3> look_at  <3,0,3>  }\n');
fprintf(fd,'mesh {\n');
for i=1:size(x,1)-1
    for j=1:size(x,1)-1
        fprintf(fd,'triangle{<%8.5f,%8.5f,%8.5f>,<%8.5f,%8.5f,%8.5f>,<%8.5f,%8.5f,%8.5f> texture {c1}}\n',...
            i*nm,x(i,j),j*nm,...
            (i+1)*nm,x(i+1,j),j*nm,...
            (i+1)*nm,x(i+1,j+1),(j+1)*nm);
        fprintf(fd,'triangle{<%8.5f,%8.5f,%8.5f>,<%8.5f,%8.5f,%8.5f>,<%8.5f,%8.5f,%8.5f> texture {c1}}\n',...
            i*nm,x(i,j),j*nm,...
            i*nm,x(i,j+1),(j+1)*nm,...
            (i+1)*nm,x(i+1,j+1),(j+1)*nm);
    end
end
fprintf(fd,'}\n');
end