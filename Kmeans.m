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
%     c(4,2) = mean(dtTrainC4(:,2));
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
