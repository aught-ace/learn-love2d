# Love2Dを学んだノート

Lua言語でゲームを作れる[Love2D (LÖVE)](https://love2d.org/)フレームワークに入門した時のノート。

日本語の情報が少ないので一応ここに書き残しておく。



## そもそも学ぶ目的

- **MODを制作して後から拡張しやすいゲーム** を作ろうとした際、既に利用した事があった以下の2つの方法では、技術面はもとよりMOD作者側の手軽さという点でも難があった為。
    + Unityには、そもそもMODで後から拡張する為の仕組みがあまり存在せず、C#はコンパイル言語の為、特に後からベースのゲームにプログラムを追加する方法が無かった。
    + JavaScriptは、ローカルのファイルへのアクセスにセキュリティ上の厳しい制限があり、あくまでサーバーにアップロードするか、ローカルサーバーを建てて作る前提がある。
- Luaは **MOD対応ゲームを作る為の最適な選択肢として既に人気** らしく、学習しようと思った。



## インストール手順

1. [Love2D](https://love2d.org/)の「64-bit installer」など、環境に合ったものをダウンロードしてインストール
2. Windowsボタンを押して「cmd」を入力しコマンドプロンプトを起動
3. 「love --version」と入力してEnterを押し、「LOVE」の文字とバージョンが表示されれば成功

- Love2DにはLuaが内蔵されているので、Lua単体で計算などをする目的ではなくグラフィカルなゲーム作りをしたい場合は、 **別途Luaをインストールする必要はない** 。
- インストーラーを使ってインストールした場合は、手動でパスを通す必要はない。



## Hello World!を表示するプログラム

**[hello-world/main.lua](hello-world/main.lua)**
```lua
function love.draw()
    love.graphics.print("Hello World!", 0, 0)
end
```



## 実行する方法

### 普通の方法

最初に実行されるluaファイルは **「main.lua」という名前である必要がある** 。

1. Windowsボタンを押して「cmd」入力しコマンドプロンプトを起動
2. 「cd main.luaがあるパス」を実行して移動
3. 「love .」で **main.luaそのものではなく現在のフォルダをloveで実行** し、Hello World!と書かれたウィンドウが出たら成功

### VS Codeを利用している場合の速い方法

まず、main.luaを直接開かず、 **main.luaが入ったプロジェクトのフォルダを開いている事** 。そうしないと実行できない。

1. EXTENTIONSから「Love2D Support」をインストール
2. <kbd>Alt</kbd> + <kbd>L</kbd> を押して実行

ただし、私の環境では Alt+L が別の機能と競合しており、ショートカットキーを変える必要があった。

1. <kbd>Ctrl</kbd> + <kbd>K</kbd> を入力した後に <kbd>Ctrl</kbd> + <kbd>S</kbd> を入力し「Keyboard Shortcuts」タブを開く
2. 「alt+l」で検索すると「Run Love2D on the workspace folder.」がヒットするので、左の鉛筆のボタンを押して編集
3. <kbd>F5</kbd> を押してF5に割り当てる

また、デバッグコンソールを開いた状態で実行するには、以下の設定をする。

1. <kbd>Ctrl</kbd> + <kbd>,</kbd> を押して「Settings」を開く
2. 上の検索欄に「Love2D」と入力
3. 「Runs Love2D with a console window for debugging.」にチェック



## 日本語を描画できるようにする

デフォルトのフォントだと日本語が描画できず四角形になってしまう。

1. **再配布可能な** フォントをダウンロードし、例えばmain.luaと同じ階層に置く。
2. ロード時に実行される `function love.load()` 内に以下のようなコードを書く。 

```lua
local font = love.graphics.newFont("misaki_gothic.ttf", 8)
love.graphics.setFont(font)
```

今回はゲームらしさを出す為に「美咲フォント」を使用した。



## ダブルクリックで実行可能なファイルにする

- luaファイルや画像などのリソースをzipとして固めて、その拡張子をloveにする事で、ダブルクリックで実行できるゲームになる。ただしこの場合はLove2Dがインストール済みの環境である必要があり、そのまま配布しただけでは動かない。
    + さらに注意点として、 **luaファイルなどが入ったフォルダの方をzipにするのではなく、luaファイルやリソース達そのものを選択してzipにする** 必要がある。
- love.exeとloveファイルを結合する事で、Love2DがインストールされていないWindows環境でもダブルクリックすれば動くexeファイルにする事ができる。

### batファイルを作って快適にする

コマンドを使ってファイル出力を行ってもいいが、各フォルダにはそれらを楽に行うためのバッチファイルの例が入っている。

- [_package-as-love.bat](hello-world/_package-as-love.bat) : 自動でフォルダ内のファイルをmain.loveにまとめる
- [_love-to-exe.bat](hello-world/_love-to-exe.bat) : love.exeとmain.loveを結合し、Love2D無しの環境でも実行可能なmain.exeを作る
