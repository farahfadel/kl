function [idx]=find_boundary_ids(x,A)
%% intro
%    known the no of lines in each row
%    finding the discontinuity in the no of lines in the rows creates 
%    boundaries those ids of rows of image are returned as output
%    input - no_of_lines_vector
%    output- boundaries ids
%% code
idx=[];
output=0;
for i=2: size(x,1)
   if  x(i-1)~=x(i)   
       [output1, idy1]=no_of_lines(A(i-1,:));
       [output2, idy2]=no_of_lines(A(i,:));
       if(output1>output2)
         idx=[idx;i-1];
       else
         idx=[idx;i];
       end
   end
end
end