// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextHistory extends StatefulWidget {
const TextHistory({Key? key}) : super(key: key);

@override
State<TextHistory> createState() => _TextHistoryState();
}

class _TextHistoryState extends State<TextHistory> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Dashboard"),
actions: const [],
),
body: SingleChildScrollView(
child: Container(
padding: const EdgeInsets.all(10.0),
child: const Column(
children: [],
),
),
),
);
}
}
