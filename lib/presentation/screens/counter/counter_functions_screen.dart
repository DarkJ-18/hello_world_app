import 'dart:ffi';

import 'package:flutter/material.dart';

class CoounterFunctionsScreen extends StatefulWidget {
  const CoounterFunctionsScreen({super.key});

  @override
  State<CoounterFunctionsScreen> createState() =>
      _CoounterFunctionsScreenState();
}

class _CoounterFunctionsScreenState extends State<CoounterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Functions')),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centrar verticalmente
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(icon: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            }),
            const SizedBox(height: 10),
            CustomButton(icon: Icons.plus_one,
            onPressed: () {
              clickCounter++;
              setState(() {});
            }),
            const SizedBox(height: 10),
            CustomButton(icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              if (clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            }),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, required this.icon,this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //shape: const StadiumBorder(), // Boton redondeado
      enableFeedback: true,
      elevation: 8,
      backgroundColor: const Color.fromARGB(255, 215, 106, 235),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
