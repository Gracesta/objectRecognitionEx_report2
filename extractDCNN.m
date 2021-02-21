%-------------レポート課題2 (Web画像検索リランキング実験)-----------------------%
%
%              extractDCNN.m
%              リンクで指定された画像の、指定されたｆｃ層のAlexnetによるDCNNを抽出
%
%------------------------------------------------------------------%


function dcnnf_trans = extractDCNN(imgList, layer_name)
% debug: imgList = testList;
% layer_name = 'fc6';
net = alexnet;
m = length(imgList);
% DCCN特徴量を抽出する
IM = [];
for i = 1:m
    img = imread(imgList{i});
    reimg = imresize(img,net.Layers(1).InputSize(1:2));
    % fprintf('processing with picture[%d]\n', i);
    IM = cat(4, IM, reimg);
end
dcnnf = activations(net,IM, layer_name);
dcnnf = squeeze(dcnnf);
dcnnf = dcnnf/norm(dcnnf);
dcnnf_trans = dcnnf';