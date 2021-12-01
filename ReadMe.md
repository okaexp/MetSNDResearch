## 比喩表現の解釈多様性と，主題の近傍意味密度と抽象度の関係性

「岡隆之介・楠見孝（印刷中, 『認知科学』）.隠喩と直喩の解釈多様性に果たす構成語の役割：単語の意味近傍密度と抽象度に基づく検討」で用いたデータと主要な解析用のコードをまとめたレポジトリ

## Rquirement
|項目|内容|
|---|---|
|Pythonのバージョン|3.8.0|
|mecabのバージョン|0.996|
|mecabの辞書|mecab-ipadic-neologd|
|Pythonの必要パッケージ|`requirement.txt`に記載|
|言語モデル|[WikiEntVecのリリースページ](https://github.com/singletongue/WikiEntVec/releases)から`jawiki.entity_vectors.200d.txt.bz2`をインストールし解凍。解凍されたテキストファイルを`entity_vector.200d.txt`と名前を変更し、`model`ディレクトリに格納する。|

## Usage
以下では、`notebook`および`src`ディレクトリにある各解析用コードの実行方法と、入出力について簡単な説明を行う。
1. `./notebook/calculate_interpretive_diversity.ipynb`
	- `./data/MetaphorSimileFeatures.csv`（参加者から得られた隠喩/直喩に対する特徴語をまとめたデータ）から、各隠喩/直喩表現の解釈多様性（`./data/MetaphorSimileDiversity.csv`）を算出する
2. `./notebook/calculate_snd.ipynb`
   - `./data/MetaphorSimileDiversity.csv`とAWD-JEXおよび中本・楠見（2004）の心理言語変数を抽出し、SNDの計算を行なった上で、相関分析用のデータを出力する（`./result/DatForCorrelation.csv`）
3. `./src/calculate_correlation.R`
   - `./result/DatForCorrelation.csv`のデータをもとに、隠喩/直喩それぞれの相関表と、記述統計量を算出する

## Note

- 上記コードは、論文中で報告している、主題のSNDと解釈多様性の相関係数が最も高くなった条件（word2vec, 200次元, 近傍単語数3000語）での結果を出力するためのコードである

