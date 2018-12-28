faceDatabase = imageSet('att_faces','recursive');


%Split database into training and test sets
[training,test] = partition(faceDatabase,[0.7 0.3]);
figure('Name','Extracting Features', 'NumberTitle','off');
trainingFeatures = zeros(size(training,2)*training(1).Count,4680);
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        imshow(read(training(i),j)); 
        trainingFeatures(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{featureCount} = training(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = training(i).Description;
end


% Multi-Class classifier
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);%, 'Learners', 'knn', 'Verbose',true



%%

% Test the classifier from a random input from test set

person = round(40*rand(1));
testnumber = round(1+2*rand(1));
queryImage = read(test(person),testnumber);
queryFeatures = extractHOGFeatures(queryImage);%, 'CellSize', [64 64]);%, 'CellSize', [64 64]
personLabel = predict(faceClassifier,queryFeatures);
booleanIndex = strcmp(personLabel, personIndex);
integerIndex = find(booleanIndex);
subplot(1,2,1);imshow(queryImage);title('Query Face');
subplot(1,2,2);imshow(read(training(integerIndex),1));title('Matched Face');

