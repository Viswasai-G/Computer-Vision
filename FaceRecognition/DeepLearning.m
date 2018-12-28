categories = {'s1','s2','s3','s4','s5','s6','s7','s8','s9','s10','s11','s12','s13','s14','s15','s16','s17','s18','s19','s20','s21','s22','s23','s24','s25','s26','s27','s28','s29','s30','s31','s32','s33','s34','s35','s36','s37','s38','s39','s40'};%,'41','42','43','44','45','46','47','48','49','50'};
rootFolder = 'att_faces';
imds = imageDatastore(fullfile(rootFolder, categories), ...
    'LabelSource', 'foldernames');
numTrainFiles=6;
[imdsTrain, imdsValid] = splitEachLabel(imds, numTrainFiles, 'randomize');

layers = [
    imageInputLayer([112 92 1])
    
    convolution2dLayer(7,24,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,12,'Padding','same')
    
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(40)
    softmaxLayer
    classificationLayer];

opts = trainingOptions('sgdm', ...
    'InitialLearnRate',0.05, ...
    'MaxEpochs',20, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValid, ...
    'ValidationFrequency',30, ... 
    'MiniBatchSize',16, ...
    'Verbose',false, ...
    'Plots','training-progress');%'MiniBatchSize',64,

[net, info] = trainNetwork(imdsTrain, layers, opts);

labels = classify(net, imds);
ii = randi(400);
im = imread(imds.Files{ii});
imshow(im);
if labels(ii) == imds.Labels(ii)
   colorText = 'g'; 
else
   colorText = 'r';
end
title(char(labels(ii)),'Color',colorText);