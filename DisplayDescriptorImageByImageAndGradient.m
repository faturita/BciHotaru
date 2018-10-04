function DisplayDescriptorImageByImageAndGradient(frames,descriptor,image,descriptorid,gradient,showpatch)

% Gradient which is [x,y,norm,angle] is considering angle as pointing
% upwards. @fixme, it will need some adjustment if descriptor is oriented.
DisplayDescriptorImageByImage(frames,descriptor,image,descriptorid,showpatch);

if (showpatch)
    
    S=(floor(sqrt(2)*15/4)*frames(3))/(3)+1;
else
    S=0;
end

hold on;
quiver(-S+gradient(2,:)+1,gradient(1,:)+1,cos(-gradient(4,:)).*gradient(3,:),sin(-gradient(4,:)).*gradient(3,:));
hold off;

end