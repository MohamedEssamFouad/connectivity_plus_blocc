import 'package:connectivity_plus_blocc/screens/buildWid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
      body: const Center(child: BuildWid()),
    );
  }
}
