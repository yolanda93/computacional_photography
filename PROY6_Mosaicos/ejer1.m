load keypoints;
subplot(2,2,1);
imshow('image01.jpg');hold on;
plot(s{1}.xy(:,1),s{1}.xy(:,2),'ro');

subplot(2,2,2);
imshow('image02.jpg');hold on;
plot(s{2}.xy(:,1),s{2}.xy(:,2),'ro');

subplot(2,2,3);
imshow('image03.jpg');hold on;
plot(s{3}.xy(:,1),s{3}.xy(:,2),'ro');

subplot(2,2,4);
imshow('image04.jpg');hold on;
plot(s{4}.xy(:,1),s{4}.xy(:,2),'ro');