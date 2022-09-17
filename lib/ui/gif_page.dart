import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class GifPage extends StatelessWidget {
  final Map _gifData;

  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              share();
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Image.network(_gifData["images"]["fixed_height"]["url"])),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Compartilhar Gif',
        text: 'Compartilhe com quem desejar essa gif...',
        linkUrl: _gifData["images"]["fixed_height"]["url"],
        chooserTitle: _gifData["title"]);
  }
}
