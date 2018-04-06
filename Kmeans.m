dataTrain = csvread('TrainsetTugas2.csv');
dataTest = csvread('TestsetTugas2.csv');
figure
hold on
scatter(dataTrain(:,1),dataTrain(:,2),'r');
hold off


%ambil nilai k=7
k = 7
for i=1 : k
    c(i,1)=dataTrain(randi(688),1);% isi nilai x
    c(i,2)=dataTrain(randi(688),2);% isi nilai y
end
%inisiasi centroid lama
clama=zeros(k,2);
while clama~=c %bandingkan centroid lama sama centroid baru
    %centroid lama dibackup
    for i=1 : k
        clama(i,1) = c(i,1);
        clama(i,2) = c(i,2);
    end
    for i = 1 : size(dataTrain)
        for j = 1 : k
            jarak(j)=sqrt(((c(j,1)-dataTrain(i,1))^2)+(c(j,2)-dataTrain(i,2))^2);%ngitung centroid
        end
        [nilaiMin,indeksMin]=min(jarak);
        dataTrain(i,3)=indeksMin;
    end
%     dtTrainC1 = dataTrain(find(dataTrain(:,3)==1),:);
%     dtTrainC2 = dataTrain(find(dataTrain(:,3)==2),:);
%     dtTrainC3 = dataTrain(find(dataTrain(:,3)==3),:);
%     dtTrainC4 = dataTrain(find(dataTrain(:,3)==4),:); 
%     dtTrainC5 = dataTrain(find(dataTrain(:,3)==5),:);
%     dtTrainC6 = dataTrain(find(dataTrain(:,3)==6),:);
%     dtTrainC7 = dataTrain(find(dataTrain(:,3)==7),:);
%     c(1,1) = mean(dtTrainC1(:,1)); %update centroid baru
%     c(1,2) = mean(dtTrainC1(:,2));
%     c(2,1) = mean(dtTrainC2(:,1));
%     c(2,2) = mean(dtTrainC2(:,2));
%     c(3,1) = mean(dtTrainC3(:,1));
%     c(3,2) = mean(dtTrainC3(:,2));
%     c(4,1) = mean(dtTrainC4(:,1));
%     c(4,2) = mean(dtTrainC4(:,2));
%     c(5,1) = mean(dtTrainC5(:,1));
%     c(5,2) = mean(dtTrainC5(:,2));
%     c(6,1) = mean(dtTrainC6(:,1));
%     c(6,2) = mean(dtTrainC6(:,2));
%     c(7,1) = mean(dtTrainC7(:,1));
%     c(7,2) = mean(dtTrainC7(:,2));
    for i=1 : k
        c(i,1) = mean(dataTrain(find(dataTrain(:,3)==i),1));
        c(i,2) = mean(dataTrain(find(dataTrain(:,3)==i),2));
    end
end

figure
hold on
for i = 1 : k
    scatter(dataTrain(find(dataTrain(:,3)==i),1),dataTrain(find(dataTrain(:,3)==i),2));
    scatter(c(i,1),c(i,2),'k','filled');
end
hold off

% figure
% hold on
% scatter(dtTrainC1(:,1),dtTrainC1(:,2),'r','+');
% scatter(dtTrainC2(:,1),dtTrainC2(:,2),'g');
% scatter(dtTrainC3(:,1),dtTrainC3(:,2),'b');
% scatter(dtTrainC4(:,1),dtTrainC4(:,2),'y');
% scatter(dtTrainC5(:,1),dtTrainC5(:,2),'m');
% scatter(dtTrainC6(:,1),dtTrainC6(:,2),'c');
% scatter(dtTrainC7(:,1),dtTrainC7(:,2),'k');
% scatter(c(1,1),c(1,2),'k','filled');
% scatter(c(2,1),c(2,2),'k','filled');
% scatter(c(3,1),c(3,2),'k','filled');
% scatter(c(4,1),c(4,2),'k','filled');
% scatter(c(5,1),c(5,2),'k','filled');
% scatter(c(6,1),c(6,2),'k','filled');
% scatter(c(7,1),c(7,2),'k','filled');
% hold off
% 
for i = 1 : size(dataTest)
    for j = 1 : k
        jarak(j)=sqrt(((c(j,1)-dataTest(i,1))^2)+(c(j,2)-dataTest(i,2))^2);%ngitung centroid
    end
    [nilaiMin,indeksMin]=min(jarak);
    dataTest(i,3)=indeksMin;
end

figure
hold on
for i = 1 : k
    scatter(dataTrain(find(dataTrain(:,3)==i),1),dataTrain(find(dataTrain(:,3)==i),2));
    scatter(dataTest(find(dataTest(:,3)==i),1),dataTest(find(dataTest(:,3)==i),2),'filled');
    scatter(c(i,1),c(i,2),'k','filled');
end
hold off
% 
% dtTestC1 = dataTest(find(dataTest(:,3)==1),:);
% dtTestC2 = dataTest(find(dataTest(:,3)==2),:);
% dtTestC3 = dataTest(find(dataTest(:,3)==3),:);
% dtTestC4 = dataTest(find(dataTest(:,3)==4),:); 
% dtTestC5 = dataTest(find(dataTest(:,3)==5),:);
% dtTestC6 = dataTest(find(dataTest(:,3)==6),:);
% dtTestC7 = dataTest(find(dataTest(:,3)==7),:);
% 
% figure
% hold on
% scatter(dtTrainC1(:,1),dtTrainC1(:,2),'r');
% scatter(dtTrainC2(:,1),dtTrainC2(:,2),'g');
% scatter(dtTrainC3(:,1),dtTrainC3(:,2),'b');
% scatter(dtTrainC4(:,1),dtTrainC4(:,2),'y');
% scatter(dtTrainC5(:,1),dtTrainC5(:,2),'m');
% scatter(dtTrainC6(:,1),dtTrainC6(:,2),'c');
% scatter(dtTrainC7(:,1),dtTrainC7(:,2),'k');
% scatter(dtTestC1(:,1),dtTestC1(:,2),'r','filled');
% scatter(dtTestC2(:,1),dtTestC2(:,2),'g','filled');
% scatter(dtTestC3(:,1),dtTestC3(:,2),'b','filled');
% scatter(dtTestC4(:,1),dtTestC4(:,2),'y','filled');
% scatter(dtTestC5(:,1),dtTestC5(:,2),'m','filled');
% scatter(dtTestC6(:,1),dtTestC6(:,2),'c','filled');
% scatter(dtTestC7(:,1),dtTestC7(:,2),'k','filled');
% scatter(c(1,1),c(1,2),'k','filled');
% scatter(c(2,1),c(2,2),'k','filled');
% scatter(c(3,1),c(3,2),'k','filled');
% scatter(c(4,1),c(4,2),'k','filled');
% scatter(c(5,1),c(5,2),'k','filled');
% scatter(c(6,1),c(6,2),'k','filled');
% scatter(c(7,1),c(7,2),'k','filled');
% hold off


