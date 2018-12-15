# 講習事前準備
本講習会では、事前に受講者にプログラミング実習環境の構築を行っていただきました。後から本資料を見る方々用に、その際にご案内した内容を以下に記述しておきます。

プログラミング実習環境の構築として、講習で使用する下記のソフトウェアのインストールを事前に行っていただきます。
-	VirtualBoxおよびUbuntu (ver. 18以降) 
-	Python(ver3)および追加のPythonライブラリ (モジュール)。

今回の講習ではPython本体とともに多くの追加ライブラリが標準で組み込まれた「Anaconda」を利用します。
講習会ではソフトウェアのバージョンや環境の違いによる動作の違いを避けるため、上記の統一した環境で実習を行います。ただし、普段からMac/Linuxをお使いの方は、自己責任で仮装環境ではなくご自分で用意した環境でも構いません。


# Python プログラミング環境の構築

概要
* VirtualBoxでLinux (Ubuntu) の仮想マシンを作成
* Python のインストール。ver 3系を利用。ここでは Anaconda (Python と主要モジュールを含んだパッケージ) を導入する

以下の手順は Macintosh での操作を想定しています。各手順の詳細については参考サイト等を参照してください。

## 1.	VirtualBox および Ubuntu 仮想マシンの作成

(参考サイト) [仮想化アプリを使ってWindows 10にUbuntu Desktopをインストールしよう](https://news.mynavi.jp/article/liunx_win-3/)  (マイナビニュースWebページより)

### 1.1	VirtualBox 本体のインストーラの取得
VirtualBox ウェブサイトより[ダウンロード](https://www.virtualbox.org)
### 1.2	インストーラの指示に従ってインストールする
### 1.3	Ubuntu のディスクイメージの[取得](https://www.ubuntulinux.jp/download)

「日本語 Remix イメージのダウンロード」に進み、最新版の ISO イメージをダウンロードする。2018.10現在の最新版は 18.04.1

最新版ISOイメージへの[直リンク](http://cdimage.ubuntulinux.jp/releases/18.04.1/ubuntu-ja-18.04.1-desktop-amd64.iso)

### 1.4	VirtualBox を起動し、「新規」ボタンを押して新規環境の追加を行う
-	「名前」は任意。本文書では “ubuntu_python_lecture” とする。
-	「タイプ」、「バージョン」は、”Linux”, “Ubuntu (64-bit)” を指定。
-	「メモリーサイズ」は 2048 MB (2GB) 以上割り当てることを推奨。(後で変更可能。自分のマシンに合わせて調整してください。1GBでも起動はするが、動作が遅い。)

以上を指定し、「作成」ボタンで次に進む。

次の画面では仮想ディスクファイルの大きさ等等を指定するが、サイズは20GB を指定する (Anacondaをインストールする場合デフォルトの10GBでは不足)。それ以外ではデフォルトのまま「作成」を行う。

### 1.5	作成した仮想環境 “ubuntu_python_lecture” を選択し「起動」する。
初回起動時のみ、OSのインストーラを含んだディスクイメージの場所を聞かれるので、1.3で取得した iso ファイルを指定する。
(途中でキャンセルしてしまった場合、「設定」から手動でディスクイメージの指定を行う。仮想環境を一旦削除して1.4からやり直してもよい)

### 1.6	Ubuntu のインストールを行う
画面に表示されたインストーラの指示に従う。基本的にはデフォルト通りでよいが、ディスク容量を節減するため「最小インストール」を選択してもよい。途中で、「「コンピューターにインストールされたOSは見つかりませんでした。どのようにしますか？」という画面が出るが、「ディスクを削除してUbuntuをインストール」を選択して先に進む。 この「ディスク」は仮想マシン内のディスクのことを指すので、実際のマシンには影響ない。

ユーザー名、パスワード等は任意に設定する。

### 1.7	インストールが終了したら、指示に従って一旦再起動する
「Please remove the installation medium, then reboot」という黒い画面になった場合には、VirtualBoxの画面上部のメニューから「仮想マシン」→「リセット」を選択して再起動を行う。

場合によってはVirtualBoxの画面上部のメニューから、「デバイス」→「光学ドライブ」→「仮想ドライブからディスクを除去」を行い、手動でインストーラのディスクイメージを除去する。(1.5の指示通り操作を行っていればおそらく自動的に除去されているはず)

### 1.8	初期設定など
再起動が終わりデスクトップが表示されたら端末(ターミナル)を開き、下記の操作を実行する。
```bash
#gitコマンドのインストール
sudo apt install git
#(管理者用パスワードを要求されるので、最初にユーザーを作成したときに指定したパスワードを入力)
#javaのインストール
sudo apt install default-jre 
```
端末 (ターミナル) とテキストエディタは頻繁に使うので画面左のLauncherにお気に入りとして登録しておくとよい。

Ubuntu の基本的な操作方法については
[Sickly Life Blog](https://sicklylife.jp/ubuntu/tsukaikata/usage.html)などを参照 

## 2.	Python (Anaconda) のインストール
下記の操作は VirtualBox の Ubuntu 上で行います。
(参考)[Takekatsu Hiramura氏のPythonでデータサイエンス](https://pythondatascience.plavox.info/pythonのインストール/anaconda-ubuntu-linux)

### 2.1	インストーラーの取得
画面左のLauncherからFireFoxを起動し、[https://anaconda.org](https://anaconda.org) から Linux 版のPython 3系のインストーラーを取得する。2018年10月時点の最新版は Python 3.7 (Anaconda のバージョンは5.3.0)。

コマンドで取得するなら、
```bash
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
```
### 2.2	Anacondaのインストール
端末を開き、インストーラをダウンロードしたディレクトリに移動し、
```bash
sh Anaconda3-5.3.0-Linux-x86_64.sh
```
を実行する。途中でインストール場所等を聞かれるが、デフォルトの設定通りでよい。

インストールの最後の方にAnacondaのインストールディレクトリをpathに追加するか聞かれるので yes と答える。(設定は新しいターミナルウィンドウを開いた後に有効になります)

インストール後に、Microsoft 製のプログラミング用エディタ Visual Studio Code をインストールするか聞かれる。講習では不要なので、インストールは任意で。

### 2.3	Pythonの追加モジュールをインストール
```bash
#pip (pythonのパッケージマネージャ) の本体をアップデート
pip install --upgrade pip
#gccインストール
sudo apt install build-essential
#Biopython インストール:
pip install biopython
#bcbio-gff インストール:
pip install bcbio-gff
```
注) pandas, matplotlib などそれ以外のモジュールは Anaconda を導入した場合は、インストール済みです。

講習を始める前の準備としては以上になります。
