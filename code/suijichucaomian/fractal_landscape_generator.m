function [] = fractal_landscape_generator()
% Fractal landscape program generator
%
% Support : nicolas.douillet (at) free.fr, 2019.


n = 8;
roughness = 3;
basis_lvl = 0;
water_lvl = -0.1;

aff_Etape = false;
random_edge = false;
smooth_edge = true;
affine_altitude = false;

z = -ones(2^n+1,2^n+1);
r = roughness;

if random_edge == false 
    
    z(1,1) = basis_lvl;
    z(1,2^n+1) = basis_lvl;
    z(2^n+1,1) = basis_lvl;
    z(2^n+1,2^n+1) = basis_lvl; 
    
else    
    
    z(1,1) = (rand-0.5)*r + basis_lvl;
    z(1,2^n+1) = (rand-0.5)*r + basis_lvl;
    z(2^n+1,1) = (rand-0.5)*r + basis_lvl;
    z(2^n+1,2^n+1) = (rand-0.5)*r + basis_lvl; 
    
end

if (aff_Etape == false && n == 0) | aff_Etape == true
    
    [X Y] = meshgrid(1:2,1:2);
    surf(X,Y,[ z(1,1), z(1,2^n+1); z(2^n+1,1), z(2^n+1,2^n+1)],'FaceColor','interp','FaceLighting','phong');    
    axis tight, axis off;
    shading interp;
    colormap('jet');
    camlight('headlight');
    set(gcf,'Color',[0 0 0]), set(gca,'Color',[0 0 0]);
    pause(1);
    
end

if n > 0
    
    for nc = 1:n
        
        nb_pt = 2^nc;
        step = 2^n/nb_pt;
        nb_new_pt = nb_pt/2;
        Ml = ones(nb_new_pt,nb_new_pt);
        Mc = ones(nb_new_pt,nb_new_pt);

        for j = 1:nb_new_pt
            
            for i = 1:nb_new_pt
                
                if i ~= 1 | j ~= 1
                    
                    l = (2*step)*(j-1) + step + 1;
                    c = (2*step)*(i-1) + step + 1;
                    
                elseif i == 1 & j == 1
                    
                    l = step + 1;
                    c = l;
                    
                end

                pt_ne = [l+1,c-1];
                pt_no = [l-1,c-1];
                pt_se = [l+1,c+1];
                pt_so = [l-1,c+1];

                while (pt_ne(1,1)+1) <= 2^n+1 & (pt_ne(1,2)-1) >= 1 & z(pt_ne(1,1),pt_ne(1,2)) == -1
                    
                    pt_ne(1,1) = pt_ne(1,1)+1;
                    pt_ne(1,2) = pt_ne(1,2)-1;
                    
                end

                while (pt_no(1,1)-1) >= 1 & (pt_no(1,2)-1) >= 1 & z(pt_no(1,1),pt_no(1,2)) == -1
                    
                    pt_no(1,1) = pt_no(1,1)-1;
                    pt_no(1,2) = pt_no(1,2)-1;
                    
                end

                while((pt_se(1,1)+1) <= 2^n+1 & (pt_se(1,2)+1) <= 2^n+1 & z(pt_se(1,1),pt_se(1,2)) == -1)
                    
                    pt_se(1,1) = pt_se(1,1)+1;
                    pt_se(1,2) = pt_se(1,2)+1;
                    
                end

                while((pt_so(1,1)-1) >= 1 & (pt_so(1,2)+1) <= 2^n+1 & z(pt_so(1,1),pt_so(1,2)) == -1)
                    
                    pt_so(1,1) = pt_so(1,1) - 1;
                    pt_so(1,2) = pt_so(1,2) + 1;
                    
                end

                avg = (z(pt_ne(1,1),pt_ne(1,2)) + z(pt_no(1,1),pt_no(1,2)) + z(pt_se(1,1),pt_se(1,2)) + z(pt_so(1,1),pt_so(1,2)))/4;

                z(l,c) =  avg + (rand-0.5)*r;
                Ml(i,j) = l;
                Mc(i,j) = c;

            end
        end

        for i = 1:nb_new_pt
            
            for j = 1:nb_new_pt

                l = Ml(i,j);
                c = Mc(i,j);

                if z(l-step,c) == -1
                    
                    if (l-step) == 1
                        
                        avg = (z(l,c)+z(l-step,c+step)+z(l-step,c-step))/3;
                        
                    else
                        
                        avg = (z(l,c)+z(l-2*step,c)+z(l-step,c+step)+z(l-step,c-step))/4;
                        
                    end
                    
                    z(l-step,c) = avg + (rand-0.5)*r;
                    
                end

                if z(l,c+step) == -1
                    
                    if (c+step) == 2^n+1
                        
                        avg = (z(l,c)+z(l-step,c+step)+z(l+step,c+step))/3;
                        
                    else
                        
                        avg = (z(l,c)+z(l-step,c+step)+z(l+step,c+step)+z(l,c+2*step))/4;
                        
                    end
                    
                    z(l,c+step) = avg + (rand-0.5)*r;
                    
                end

                if z(l+step,c) == -1
                    
                    if (l+step) == 2^n+1
                        
                        avg = (z(l,c)+z(l+step,c-step)+z(l+step,c+step))/3;
                        
                    else
                        
                        avg = (z(l,c)+z(l+step,c-step)+z(l+step,c+step)+z(l+2*step,c))/4;
                        
                    end
                    
                    z(l+step,c) = avg + (rand-0.5)*r;
                    
                end

                if z(l,c-step) == -1
                    
                    if (c-step) == 1
                        
                        avg = (z(l,c)+z(l-step,c-step)+z(l+step,c-step))/3;
                        
                    else
                        
                        avg = (z(l,c)+z(l-step,c-step)+z(l+step,c-step)+z(l,c-2*step))/4;
                        
                    end
                    
                    z(l,c-step) = avg  + (rand-0.5)*r;
                    
                end
            end
            
        end
        
        x = ones(1,nb_pt+1);
        y = ones(1,nb_pt+1);

        for k = 0:nb_pt
            
            x(1,k+1) = k*(1/nb_pt)+1;
            
        end

        for k = 0:nb_pt
            
            y(1,k+1) = k*(1/nb_pt)+1;
            
        end

        [X,Y] = meshgrid(x,y);
        Z = ones(nb_pt+1,nb_pt+1);
        m = [0,1];

        for j = 1:2^n+1
            
            for i = 1:2^n+1
                
                if z(j,i) ~= 1
                    m(1,1) = m(1,1)+1;
                    Z(m(1,2),m(1,1)) = z(j,i);
                    
                end
                
            end
            
            if m(1,1) == nb_pt+1
                
                m(1,2) = m(1,2)+1;
                
            end
            
            m(1,1) = 0;
            
        end

        if smooth_edge == true & random_edge == false
            
            for i = 1:nb_pt+1
                
                if Z(i,1) > basis_lvl
                    
                    Z(i,1) = basis_lvl;
                    
                end
                
                if Z(1,i) > basis_lvl
                    
                    Z(1,i) = basis_lvl;
                    
                end
                
                if Z(nb_pt+1,i) > basis_lvl
                    
                    Z(nb_pt+1,i) = basis_lvl;
                    
                end
                
                if Z(i,nb_pt+1) > basis_lvl
                    
                    Z(i,nb_pt+1) = basis_lvl;
                    
                end
                
            end
            
        end

        if water_lvl ~= false
            
            for i = 1:nb_pt+1
                
                for j = 1:nb_pt+1
                    
                    if Z(j,i) < water_lvl
                        
                        Z(j,i) = water_lvl;
                        
                    end

                end
                
            end
            
        end

        if (aff_Etape == false && n == nc) | (aff_Etape == true)

            surf(X,Y,Z,'FaceColor','interp','FaceLighting','phong');            
            axis tight, axis off;
            shading interp;
            colormap('jet');
            camlight('headlight');
            set(gcf,'Color',[0 0 0]), set(gca,'Color',[0 0 0]);

            if affine_altitude == true
                colorbar
            end

            pause(1);
        end

        r = r/2;

    end
    
end