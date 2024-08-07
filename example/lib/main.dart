import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:zip_encryption/zip_encryption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: const Text("Press"),
                onPressed: () async {
                  log("On Pressed");
                  ZipEncryption zipEncryption = ZipEncryption(123);
                  final bool flag = await zipEncryption.encryptAndStoreZip(zipFilePath: 'C:\\Users\\Prashant\\Desktop\\SwalekhanDesktop_zip\\Swalekhan-Data(HI).zip', encryptedFilePath: 'C:\\Users\\Prashant\\Desktop\\SwalekhanDesktop_zip\\Swalekhan-Data(HI)ENC.zip');
                  log(flag.toString());
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              log("Check");
            }, child: const Text("Check"))
          ],
        ));
  }
}
