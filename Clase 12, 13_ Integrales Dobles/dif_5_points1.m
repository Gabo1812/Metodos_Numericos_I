function dy = dif_5_points1(x,y,h)
    dy = zeros(size(x));
    for i=1:size(x,1)
        if i<=5
        dy(i) = 1/(12*h)*(-25*y(i)+48*y(i+1)-36*y(i+2)+16*y(i+3)-3*y(i+4));
        else
        dy(i) = -1/(12*h)*(-25*y(i)+48*y(i-1)-36*y(i-2)+16*y(i-3)-3*y(i-4));
        end
    end
end