# [Tabular Playground Series - Dec 2021](https://www.kaggle.com/c/tabular-playground-series-dec-2021)
## 内容
- 不均衡問題を持つテーブルデータによる多クラス分類(7クラス)  
- 評価関数はAccuracy．
- Trainデータ数は4,000,000．詳細は下記の通り．  
    Cover_Type1: 1,468,136  
    Cover_Type2: 2,262,087  
    Cover_Type3: 195,712  
    Cover_Type4: 377  
    Cover_Type5: 1  
    Cover_Type6: 11,426  
    Cover_Type7: 62,261  
- Testデータ数は1,000,000．

## やったこと
1. 不均衡問題があるので，Cover_Type4に合わせてダウンサンプリングを行った．サンプリングはランダムとした．
1. 一部0-1のバイナリ変数となっていたため，それらを主成分分析により連続変数に変換した(MCAを使わなかった理由は，データ数が多すぎて処理できなかったからである)．
1. あとは標準化などの一般的な前処理を行った．
1. それぞれの機械学習モデル(LightGBM，RF，非線形SVM)で交差検証を行い，アンサンブル学習を行った(アンサンブルは単純な多数決)．

## 結果
Accuracy: 0.88430  
あんま高くないね  

## 原因・反省点
1. 
