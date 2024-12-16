import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Produto extends StatelessWidget {
  const Produto({super.key});


  @override
  Widget build(BuildContext context) {
        return Center( child: Column(
      children: [
        Text("eu sou o produto",style: Theme.of(context).textTheme.headlineMedium,),
        ElevatedButton(onPressed: () {
          context.go("/");
        }, child: const Text("ir para home"))
      ],
    ));
  }
}