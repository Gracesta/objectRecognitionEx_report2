%-------------レポート課題2 (Web画像検索リランキング実験)-----------------------%
%
%              ソートした画像のリンクとその点数をファイルに出力
%
%-------------------------------------------------------------------------%

% sorted_imgList, sorted_score
n = 50;
if n == 50
    load('result.mat');
    FID = fopen('reranking50.txt','w');
else
    load('result25.mat');
    FID = fopen('reranking25.txt','w');
end
m = length(sorted_imgList);
for i = 1:m
    fprintf(FID,'%s %.5f\n', sorted_imgList{i}, sorted_score(i));
end
fclose(FID);