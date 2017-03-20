ImageBase64プラグイン
=====================

はじめに
--------

このプラグインは、指定された画像ファイル(jpeg,png,gif,bmp)をbase64エンコードした文字列を出力します。


インストール
------------

本プラグインではCPAN ModuleのMIME::Base64を使用しますので、事前にインストールしてください。
MovableTypeのPluginディレクトリにプラグインのディレクトリを設置してください。


使い方
------

MovableTypeの任意のテンプレート上で使用することができます。下記は、AssetIDが1のファイルをbase64エンコードした文字列をhtmlに埋め込み表示させる場合の例です。

` <html> <body> <mt:SetVarBlock name="asset_file"><mt:Asset id="1"><$mt:AssetFilePath$></mt:Asset></mt:SetVarBlock> <img src="<$mt:ImageBase64 filepath="data:image/{jpg||gif||png||bmp||....};base64,$asset_file"$>"> </body> </html>`


