# Love2Dを学んだノート

Lua言語 + Love2Dフレームワークでゲームを作るために学んだ事です。

- Love2D(LÖVE)にはLua言語が内蔵されているので、Lua単体で計算などをするのではなくグラフィカルなゲーム作りをしたい場合は、別途Luaをインストールする必要はない。
- luaファイルや画像などのリソースをzipとして固めて、その拡張子をloveにする事で、ダブルクリックで実行できるゲームになる。ただしこの場合はLove2Dがインストール済みの環境である必要があり、そのまま配布しただけでは動かない。
  + さらに注意点として、luaファイルなどが入ったフォルダをzipにするのではなく、luaファイルやリソース達そのものを選択してzipにする必要がある。
- love.exeとloveファイルを結合する事で、Love2DがインストールされていないWindows環境でもダブルクリックすれば動くexeファイルにする事ができる。
- こういった処理は毎回コマンドで行わず、bat化してしまうと便利である。

## Hello Worldを表示する

**[hello-world/main.lua](hello-world/main.lua)**
```lua
function love.draw()
    love.graphics.print("Hello World!", 0, 0)
end
```

## batファイルを作って快適にする

各フォルダには開発やファイル出力を楽にするバッチファイルが入っています。

- _package-as-love.bat : 叩くと自動でフォルダ内のファイルをmain.loveにまとめます
- _love-to-exe.bat : love.exeとmain.loveを結合し、Love2D無しの環境でも叩けば起動するmain.exeを作ります
- _debug.bat : デバッグ画面を出した状態でmain.luaを起動します
