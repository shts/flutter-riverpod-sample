サンプルプロジェクト。
RiverPod の動作確認と、Dio の intercepter 機能を使って API のトークン切れを検知してトークンを再発行するロジックを検証するために作成。


対応するサーバーは下記。
https://github.com/shts/mock-api-server

`lib/config.dart` を作成して、起動したサーバーの URL を追加しないと動かないので注意。

```lib/config.dart
String apiServerBaseUrl =
    "http://~";
String tokenServerBaseUrl =
    "http://~";

```


