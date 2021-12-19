# ディスカッション課題
ディスカッション課題として、本リポジトリの既存コードの改修を行った。

|       | Before | After |
| ----- | ------ | ----- |
| **gif**   | ![before-0](https://user-images.githubusercontent.com/37968814/146660780-476d899a-d18f-49d8-ac2c-7671d623742b.gif) | ![after-0](https://user-images.githubusercontent.com/37968814/146660816-62c78d4d-3ec2-4e07-bc58-43a1e97c5505.gif) |
| **リリース** | [ver-20211205](https://github.com/tokizuoh/Pendula/releases/tag/ver-20211205) | [ver-20211219](https://github.com/tokizuoh/Pendula/releases/tag/ver-20211219)|

※ コードの比較 > [link](https://github.com/tokizuoh/Pendula/compare/ver-20211205...ver-20211219)

## 改修内容

- [issue#109: 「#104 画像の読み込み速度の向上を考える」を改善する](https://github.com/tokizuoh/Pendula/issues/109)
  - 要約: 既存の ただのUICollectionView画面 を **漫画リーダーとして使うならどう改善するか** という題目で以下の観点について改修してみる
    - 設計
    - ユーザーの体験（スクロールしやすいか・表示を待って貰う場合はどうするか）
