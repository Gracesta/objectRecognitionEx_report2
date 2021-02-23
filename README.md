# 物体認識論期末課題　レポート課題2 プログラムリスト

### trainMyModel.m: ポジティブとネガティブ画像を学習し、モデルを作成
### downloadPics.m: 実験用画像をダウンロード、画像リンクのテキストファイルの指定により行う<br>
### outputResult.m:ソートした画像のリンクとその点数をテキストファイルに出力<br>
### ranking.m: trainMyModel.mで学習したモデルで、ノイズの含む画像をリランキング<br>
### init.m:実験の下処理、画像リンクをlistなどのパラメータに読み込む<br>
### extractDCNN.m: リンクで指定された画像の、指定されたｆｃ層のAlexnetによるDCNNを抽出 <br>
### createHtml.py: outputResult.mで得たテキストファイルを用いて、リランキング結果をhtmlファイルに出力 <br>

### DestUrlList.txt: 50枚の犬画像（ポジティブ学習データ）
### DestWithNoise.txt:　３００枚のノイズを帯びた犬画像（評価データ・リランキング結果）

### 備考：ランダム画像（ネガティブ学習データ）はサーバーにあるbgimgをダウンロードして利用した。
