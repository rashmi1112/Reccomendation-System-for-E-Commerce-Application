function vec = userItemRatings(finalMatrix);
  [m,n] = size(finalMatrix);   %% m = 1682, n = 943
  u = 1:943;
  v = 1:1682;
  col1 = zeros(m*n,1);
  col2 = zeros(m*n,1);
  temp_vec1 = ones(m,1);
  temp_vec2 = v;
  for i = 1:n
    col1(v,1) = i*temp_vec1;
    col2(v,1) = temp_vec2;
    col3(v,1) = finalMatrix(:,i);
    v = v.+m;  
  end
  vec = [col1 col2 col3]; 
endfunction
