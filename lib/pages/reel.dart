import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sara_flutter/Util/bubblegame/ball.dart';
import 'package:sara_flutter/widgets.dart/button.dart';
import 'package:sara_flutter/Util/bubblegame/missle.dart';
import 'package:sara_flutter/Util/bubblegame/player.dart';

class UserGame extends StatefulWidget {
  @override
  State<UserGame> createState() => _UserGameState();
}

enum direction { LEFT, RIGHT }

class _UserGameState extends State<UserGame> {
  static double playerX = 0;

  double missileX = playerX;
  double missileHeight = 10;
  bool midShot = false;

  double ballX = 0.5;
  double ballY = 1;
  var ballDirection = direction.LEFT;

  void startGame() {
    double time = 0;
    double height = 0;
    double velocity = 60;

    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = -5 * time + velocity * time;

      if (height < 0) {
        time = 0;
      }
      if (mounted) {
        setState(() {
          ballY = heightToPosition(height);
        });
      }

      if (ballX - 0.05 < -1) {
        ballDirection = direction.RIGHT;
      } else if (ballX + 0.05 > 1) {
        ballDirection = direction.LEFT;
      }
      if (ballDirection == direction.LEFT) {
        if (mounted) {
          setState(() {
            ballX -= 0.02;
          });
        }
      } else if (ballDirection == direction.RIGHT) {
        if (mounted) {
          setState(() {
            ballX += 0.02;
          });
        }
      }
      if (playerDies()) {
        timer.cancel();
        _showDialog();
      }

      time += 0.1;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Text(
              "You dead :)",
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  void moverLeft() {
    if (mounted) {
      setState(() {
        if (playerX - 0.1 < -1) {
        } else {
          playerX -= 0.1;
        }
        if (!midShot) {
          missileX = playerX;
        }
      });
    }
  }

  void moveRight() {
    if (mounted) {
      setState(() {
        if (playerX + 0.1 > 1) {
        } else {
          playerX += 0.1;
        }
        missileX = playerX;
      });
    }
  }

  void fireMissle() {
    if (midShot == false) {
      Timer.periodic(Duration(milliseconds: 20), (timer) {
        midShot = true;
        if (mounted) {
          setState(() {
            missileHeight += 10;
          });
        }
        if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
          resetMissile();
          timer.cancel();
        }
        if (ballY > heightToPosition(missileHeight) &&
            (ballX - missileX).abs() < 0.03) {
          resetMissile();
          ballX = 5;
          timer.cancel();
        }
      });
    }
  }

  double heightToPosition(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double position = 1 - 2 * height / totalHeight;
    return position;
  }

  void resetMissile() {
    missileX = playerX;
    missileHeight = 0;
    midShot = false;
  }

  bool playerDies() {
    if ((ballX - playerX).abs() < 0.05 && ballY > 0.95) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: false,
      onKey: (event) async {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moverLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          fireMissle();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.pink[50],
              child: Center(
                child: Stack(
                  children: [
                    MyBall(ballX: ballX, ballY: ballY),
                    MyMissle(
                      height: missileHeight,
                      missileX: missileX,
                    ),
                    UserPlayer(
                      playerX: playerX,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    icon: Icons.play_circle,
                    function: startGame,
                  ),
                  MyButton(
                    icon: Icons.arrow_back,
                    function: moverLeft,
                  ),
                  MyButton(
                    icon: Icons.arrow_upward,
                    function: fireMissle,
                  ),
                  MyButton(
                    icon: Icons.arrow_forward,
                    function: moveRight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
