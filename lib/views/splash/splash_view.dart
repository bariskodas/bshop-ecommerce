import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends ConsumerWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 160,
                width: 160,
                child: Image.asset("assets/applogo_png.png")),
            const SizedBox(height: 50),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
