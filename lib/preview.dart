import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class PreviewScreen extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final message =
        // ignore: lines_longer_than_80_chars
        'Hey this is a QR code. Change this value in the main_screen.dart file.';

    return Material(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: <Widget>[
              Center(
                  child: QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 240,
              )),
              SizedBox(width: 10),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Share.share('check out my website https://example.com');
                    },
                    textColor: Color(0xff38AB10),
                    child: Text("Share".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(text: 'frog'));
                    },
                    textColor: Color(0xff38AB10),
                    child: Text("Copy".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    onPressed: () {},
                    color: Color(0xffF8E71C),
                    textColor: Color(0xff140F26),
                    child: Text("Камера".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                  FlatButton(
                    onPressed: () {},
                    textColor: Color(0xff140F26),
                    child: Text("Мой QR Код".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/4.0x/logo_yakka.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
