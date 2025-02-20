# Docker × Ruby × Selenium Web　スクレイピングサンプル
かにみそ協会サイトのコラム記事を収集するWebスクレイピングシステムのサンプルコードです。Docker環境で簡単にセットアップ可能で、実際に動作する完全な構成を提供します。

## インストール方法

リポジトリをクローン
```
git clone https://github.com/kojipon/kanimiso-scraper.git
cd kanimiso-scraper
```

依存関係のインストール
```
docker-compose build
```

コンテナ起動
```
docker-compose up -d
```

## 実行方法

スクレイピングを実行:
```
docker-compose run --rm ruby ruby scraper.rb
```

成功時の出力例:
```
記事1:
タイトル: かにみその正体
URL: /column/かにみその正体
概要: 皆さんは蟹を食べる時、茶色っぽい部分を「蟹味噌」と呼んで美味しく頂いたことはありませんか？実は、この「蟹味噌」には驚くべき秘密が隠されているのです。今回は、この珍味の正体に迫ってみましょう。

記事2:
タイトル: かにみその種類 
URL: /column/かにみその種類
概要: 蟹味噌愛好家の皆さん、こんにちは。「蟹味噌は全て同じ」とお考えではありませんか？実は、蟹味噌にも様々な種類があり、それぞれに異なる特徴があるのです。今回は、蟹味噌の多様性に迫ってみましょう。

記事3:
タイトル: かにみそとさるかに合戦
URL: /column/かにみそとさるかに合戦
概要: 皆さんは「さるかに合戦」の物語をご存じでしょうか。日本の昔話の中でも特に有名なこの物語、実は蟹味噌に関する驚くべき一面が隠されているのです。今回は、この古典的な物語を蟹味噌の視点から紐解いてみましょう。
< 省略 >
```

## XPath 検索手順
XPath は HTML の要素、属性値などを指定するための言語で、Google Chrome で表示されている要素を右クリックして「検証」から「Copy full XPath」を選択し取得できます。

<img width="919" alt="kanimiso_xpath" src="https://github.com/user-attachments/assets/40515ec5-ffac-4f3e-878b-19b9926c789f" />

