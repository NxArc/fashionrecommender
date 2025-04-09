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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Ootd(),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.question_mark_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.question_mark_rounded),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
