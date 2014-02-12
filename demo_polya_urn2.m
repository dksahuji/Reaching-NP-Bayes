function demo_polya_urn2()
	addpath(genpath('./ext'));
    Sigma = 0.1*[1 0; 0 1];
    x1 = 0:.1:10; x2 = 0:.1:10;
    [X1,X2] = meshgrid(x1,x2);
    Z = zeros(size(X1));
    num_balls = 1000;
    alpha = 1;
    Xin = 0:0.1:10;
    Yin = 0:0.1:10;
    [urn, colors] =  polya_urn_model(@()pinky(Xin,Yin,ones(length(Xin),length(Yin))), num_balls, alpha);
    num_colors = length(colors);
    for i=1:length(urn)
        F = mvnpdf([X1(:) X2(:)],urn(:,i)',Sigma);
        F = reshape(F,length(x2),length(x1));
        Z = Z + F;
    end
    histo = zeros(num_colors,1);
    for i=1:num_colors
        for j=1:size(urn,2)
            histo(i) = histo(i) + isequal(urn(:,j),colors(:,i));
        end
    end
    Z = (Z/sum(Z(:)));
    % distribution plot
    figure;
    hold on;
    hold all;
    subplot(1,2,1);
    hold on;
    surf(x1,x2,Z);
    subplot(1,2,2);
    hold on;
    for i=1:num_balls
        s = mvnrnd(urn(:,i),Sigma,1);
        %plot(s(1),s(2),'MarkerFaceColor','b',...
        %        'MarkerSize',10);       
        plot(s(1),s(2));
    end
    scatter(colors(1,:),colors(2,:));
    scatter(colors(1,:),colors(2,:),histo);
    num_colors
end