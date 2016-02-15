function boustrophedon(polygon_image)
%% intro
%boustrophedon means moving left to right and right to left
%give any irregular polygon then it decomposes into sub poygons by finding
% the critical points
%input- image of irregular polygon
%output- coverage path  
%% code
A= imread(polygon_image);
A=im2bw(A);
x=zeros(size(A,1),1);
idy=[];obstacle_points=[];critical_points=[];
for i=1:size(A,1)
    [x(i),idy]=no_of_lines(A(i,:));
    obstacle_points=[obstacle_points;[i*ones(size(idy,1),1),idy]];
end
[idx,]=find_boundary_ids(x,A);
for i=1:size(idx,1)
    critical_points=[critical_points;obstacle_points(find(idx(i)==(obstacle_points(:,1))),:)];
end
A(idx,:)=0;
imshow(A);
hold on;
plot(critical_points(:,2),critical_points(:,1),'r*');
end