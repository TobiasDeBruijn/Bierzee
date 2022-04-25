# Bierzee
Bierzee is a simple app written for some folk at work who drink beers but occasionally forget to pay. Progress can be tracked [here](https://trello.com/b/bywuxafZ/bierzee).

Available on [Google Play](https://play.google.com/store/apps/details?id=dev.array21.bierzee) and the [Apple AppStore](https://apps.apple.com/us/app/zandzee-bierzee/id1616386645?platform=iphone)

## Server
The bierzee server is written in Rust. Compiling it thus requires the [Rust compiler](https://www.rust-lang.org/learn/get-started). A Dockerfile is available as well.

When running the server, set the following environmental variables:
- `MYSQL_HOST`
- `MYSQL_DATABASE`
- `MYSQL_USERNAME`
- `MYSQL_PASSWORD`

The server will be listening on port `8080`. The endpoints are documented [here](server/README.md)

## App
The mobile app is written in Dart and requires the [Flutter framework](https://docs.flutter.dev/get-started/install) and all of its dependencies to be installed. The app can then be build with `flutter build`.

## Web
TODO
