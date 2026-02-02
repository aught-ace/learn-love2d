# Love2Dを学んだノート

Lua言語でゲームを作れる[Love2D](https://love2d.org/)フレームワークを学んだ際のノートです。


## インストール手順

Love2D(LÖVE)にはLua言語が内蔵されているので、Lua単体で計算などをする目的ではなくグラフィカルなゲーム作りをしたい場合は、 **別途Luaをインストールする必要はない** 。

1. [Love2D](https://love2d.org/)の「64-bit installer」など、環境に合ったものをダウンロードしてインストール
2. Windowsボタンを押して「cmd」を入力しコマンドプロンプトを起動
3. 「love --version」と入力してEnterを押し、「LOVE」の文字とバージョンが表示されれば成功

インストーラーを使ってインストールした場合は、手動でパスを通す必要はない。

## Hello World!を表示するプログラム

**[hello-world/main.lua](hello-world/main.lua)**
```lua
function love.draw()
    love.graphics.print("Hello World!", 0, 0)
end
```

## 実行方法

最初に実行されるluaファイルは **「main.lua」という名前である必要がある** 。

1. Windowsボタンを押して「cmd」入力しコマンドプロンプトを起動
2. 「cd main.luaがあるパス」を実行して移動
3. 「love .」で **main.luaそのものではなく現在のフォルダをloveで実行** し、Hello World!と書かれたウィンドウが出たら成功

## ダブルクリックで実行可能なファイルにする

- luaファイルや画像などのリソースをzipとして固めて、その拡張子をloveにする事で、ダブルクリックで実行できるゲームになる。ただしこの場合はLove2Dがインストール済みの環境である必要があり、そのまま配布しただけでは動かない。
    + さらに注意点として、 **luaファイルなどが入ったフォルダの方をzipにするのではなく、luaファイルやリソース達そのものを選択してzipにする** 必要がある。
- love.exeとloveファイルを結合する事で、Love2DがインストールされていないWindows環境でもダブルクリックすれば動くexeファイルにする事ができる。

## batファイルを作って快適にする

コマンドを使ってファイル出力やデバッグを行ってもいいが、各フォルダにはそれらを楽に行うためのバッチファイルの例が入っている。

- _package-as-love.bat : 自動でフォルダ内のファイルをmain.loveにまとめる
- _love-to-exe.bat : love.exeとmain.loveを結合し、Love2D無しの環境でも叩けば起動するmain.exeを作る
- _debug.bat : デバッグ画面を出した状態で実行する
