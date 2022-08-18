import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifinder/entity/gif.dart';
import 'package:gifinder/services/banco.dart';

class VerGif extends StatefulWidget {
  VerGif(this.gif);

  Gif gif;

  @override
  State<VerGif> createState() => _VerGifState();
}

class _VerGifState extends State<VerGif> {
  Widget getIconButton(bool estaNoBanco) {
    if (estaNoBanco) {
      return IconButton(icon: Icon(Icons.favorite), onPressed: excluirGif);
    } else {
      return IconButton(icon: Icon(Icons.favorite_outline), onPressed: salvarGif);
    }
  }

  void excluirGif() async {
    await Banco.remover(widget.gif.id!);
    setState(() {});
  }

  void salvarGif() async {
    await Banco.salvar(widget.gif);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: widget.gif.url),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Link copiado com sucesso."),
                    duration: Duration(seconds: 1),
                  ),
                );
              }),
          FutureBuilder(
            future: Banco.estaNoBanco(widget.gif.url),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                int? id = snapshot.data as int?;
                widget.gif.id = id;
                return getIconButton(id != null);
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          widget.gif.url,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              );
            }
          },
        ),
      ),
    );
  }
}
