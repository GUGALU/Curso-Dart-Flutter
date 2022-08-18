import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifinder/entity/gif.dart';

class VerGif extends StatefulWidget {
  VerGif(this.gif);

  Gif gif;

  @override
  State<VerGif> createState() => _VerGifState();
}

class _VerGifState extends State<VerGif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () => Clipboard.setData(
              ClipboardData(text: widget.gif.url),
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite_outline),
            onPressed: () => null,
          ),
        ],
      ),
      body: Center(
        child: Image.network(widget.gif.url),
      ),
    );
  }
}
