%-------------レポート課題2 (Web画像検索リランキング実験)-----------------------%
%                     ranking.m
%              
%           trainMyModel.mで学習したモデルで、ノイズの含む画像をリランキング
%
%
%-------------------------------------------------------------------------%

n = 50;
load('testSet.mat');
if n == 50
    load('myModel.mat');
else
    load('myModel25.mat');
end
testSet = extractDCNN(testList, 'fc6');

[label,score] = predict(model,testSet);

% 降順 ('descent') でソートして，ソートした値とソートインデックスを取得します．
[sorted_score,sorted_idx] = sort(score(:,2),'descend');

% list{:} に画像ファイル名が入っているとして，
% sorted_idxを使って画像ファイル名，さらに
% sorted_score[i](=score[sorted_idx[i],2])の値を出力します．
for i=1:numel(sorted_idx)
  fprintf('%s %f\n',testList{sorted_idx(i)},sorted_score(i));
end

sorted_imgList = testList(sorted_idx);
if n == 50
    save('result.mat', 'sorted_imgList', 'sorted_score');
else
    save('result25.mat', 'sorted_imgList', 'sorted_score');
end