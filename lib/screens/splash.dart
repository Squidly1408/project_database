import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff040f0f),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Color(0xff2ba84a),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Loading...',
                  style: TextStyle(color: Color(0xff2ba84a), fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
