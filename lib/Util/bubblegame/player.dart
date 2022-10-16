import 'package:flutter/material.dart';

class UserPlayer extends StatelessWidget {
  final playerX;

  UserPlayer({this.playerX});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.transparent,
          height: 50,
          width: 50,
          child: Image.network(
              'https://assets.stickpng.com/images/580b57fcd9996e24bc43c2fe.png'),
        ),
      ),
    );
  }
}
