# Love2Dを学んだノート

Lua言語でゲームを作れる[Love2D](https://love2d.org/)フレームワークを学んだ際のノートです。


## インストール手順

Love2D(LÖVE)にはLua言語が内蔵されているので、Lua単体で計算などをするのではなくグラフィカルなゲーム作りをしたい場合は、**別途Luaをインストールする必要はない**。

1. [Love2D](https://love2d.org/)の「64-bit installer」をダウンロードしてインストール
2. システム環境変数に行きパスを通す
    1. Windowsボタンを押し「環境変数」で検索し、「システム環境変数を編集」を起動
    2. 「環境変数」ボタンを押す
    3. **上のユーザー環境変数ではなく下のシステム環境変数**のPathを押し「編集」
    4. 「新規」を押し「C:\Program Files\LOVE」と入力、OKですべて閉じる
3. Windowsボタンを押して「cmd」を入力しコマンドプロンプトを起動
4. 「love --version」と入力してEnterを押し、**「LOVE」の文字とバージョンが表示されれば成功**

## Hello Worldを表示する

**[hello-world/main.lua](hello-world/main.lua)**
```lua
function love.draw()
    love.graphics.print("Hello World!", 0, 0)
end
```

### 起動方法

1. Windowsボタンを押して「cmd」入力しコマンドプロンプトを起動
2. 「cd main.luaがあるパス」を実行して移動
3. 「love .」で**main.luaではなく現在のフォルダのパス**をloveで実行し、**Hello Worldと書かれたウィンドウが出たら成功**

## ダブルクリックで実行可能なファイルにする

- luaファイルや画像などのリソースをzipとして固めて、その拡張子をloveにする事で、ダブルクリックで実行できるゲームになる。ただしこの場合はLove2Dがインストール済みの環境である必要があり、そのまま配布しただけでは動かない。
    + さらに注意点として、luaファイルなどが入ったフォルダをzipにするのではなく、luaファイルやリソース達そのものを選択してzipにする必要がある。
- love.exeとloveファイルを結合する事で、Love2DがインストールされていないWindows環境でもダブルクリックすれば動くexeファイルにする事ができる。

### batファイルを作って快適にする

各フォルダには開発やファイル出力を楽にするバッチファイルが入っています。

- _package-as-love.bat : 叩くと自動でフォルダ内のファイルをmain.loveにまとめる
- _love-to-exe.bat : love.exeとmain.loveを結合し、Love2D無しの環境でも叩けば起動するmain.exeを作る
- _debug.bat : デバッグ画面を出した状態でmain.luaを起動する
