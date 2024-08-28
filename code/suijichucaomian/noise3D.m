function s = noise3D (m,k)
  s = zeros([m,m,m]);
  w = m;
  i = 0;
  while w > 3
    i = i + 1;
    d = smooth3(randn([m,m,m]), 'gaussian',k,i);
    s = s + i * d(1:m, 1:m, 1:m);
    w = w - ceil(w/2 - 1);
  end
  s = (s - min(min(s(:,:)))) ./ (max(max(s(:,:))) - min(min(s(:,:))));
end