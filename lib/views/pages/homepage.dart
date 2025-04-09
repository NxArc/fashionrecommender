import 'package:fasionrecommender/views/widget/appbar.dart';
import 'package:fasionrecommender/views/widget/ootd.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Ootd(),
          SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}