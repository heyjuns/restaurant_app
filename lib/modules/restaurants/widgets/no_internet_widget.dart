import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/no-internet.png',
          width: 250,
          height: 250,
        ),
        const Text('you have no internet connection',
            textAlign: TextAlign.center),
      ],
    );
  }
}
