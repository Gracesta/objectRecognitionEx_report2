%-------------レポート課題2 (Web画像検索リランキング実験)-----------------------%
%                     init.m
%              下処理をするコード、先にニクラス物体の画像のデータを読み込む
%
%-------------------------------------------------------------------------%

LIST={'destWithNoise'}; % LIST={'dest' 'bgimg'};

n = 0;
testList = {};
for i=1:length(LIST)
    DIR = strcat(LIST(i), '/');
    W = dir(DIR{:})
    
    for j=1:size(W)
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        testList={testList{:} fn};
      end
    end
end

save('testSet.mat', 'testList');

