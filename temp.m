mu = [0 0];
Sigma = [1 0; 0 1];
x1 = 0:.1:10; x2 = 0:.1:10;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);