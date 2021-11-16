import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: mainBg,
          appBar: AppBar(
            backgroundColor: appBarBg,
            title: Center(child: Text("Wp NoSave")),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  "Mesaj gönderilecek kişinin numarasını giriniz.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  cursorColor: mainBg,
                  keyboardType: TextInputType.number,
                  controller: textFieldController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appBarBg, width: 2.0)),
                      filled: true,
                      hintText: "90**********",
                      fillColor: Color(0xFFF2F2F2),
                      helperStyle: TextStyle(color: Colors.white),
                      helperText:
                          "Telefon numarasını başında + olmadan giriniz.",
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      labelStyle: TextStyle(color: appBarBg)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                ),
                onPressed: () async {
                  print(textFieldController.text);
                  var url = "https://wa.me/" + textFieldController.text;
                  await launch(url, forceSafariVC: false);
                },
                child: const Text('Sohbete Başla'),
              ),
            ],
          )),
    );
  }
}
