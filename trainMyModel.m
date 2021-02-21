%-------------レポート課題2 (Web画像検索リランキング実験)-----------------------%
%
%              trainMyModel.m
%              n = 25 or 50のポジティブ画像と m =　1192のネガティブ画像を
%              用いて、リランキングする
%
%------------------------------------------------------------------%

% 画像リンクを読み込む
load('trainSet.mat');
% 1142枚ネガティブ画像
k = 1142;
%　n枚ポジティブ画像 25 or 50
n = 25;
m = k + n;
idx = [1:m];

net = alexnet;

% 1~50: dest images, 51~1192 dest with noise images
if n == 50
    imgList = list;
else
    imgList = [list(1:25) list(51:end)];
end
% label sushi with 1, tiger with 0
labels = [ones(n, 1); zeros(m,1)];

% For more convincible result, shuffle the dataset
shuffled_idx = randperm(m);
imgList = imgList(shuffled_idx);
labels = labels(shuffled_idx);


% layer_numの数字のfc層のDCNN特徴量を抽出し、学習します
layer_name = 'fc6';
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

model = fitcsvm(dcnnf_trans, labels, 'KernelFunction','linear', 'KernelScale','auto');
if n == 25
    save('myModel25.mat', 'model');
else % 50 model
    save('myModel.mat', 'model');
end

