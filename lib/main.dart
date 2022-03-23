import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nft_gallery/home_page.dart';
import 'package:opensea_dart/opensea_dart.dart';

void main() {
  runApp(const MyApp());
}

final openSea = OpenSea(null);

String formatDate(String date) {
  DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
  DateTime dateTime = inputFormat.parse(date);
  dateTime = dateTime.add(DateTime.now().timeZoneOffset);
  DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm a");
  String dateInString = outputFormat.format(dateTime);
  return dateInString;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
