import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenPomodoro extends StatefulWidget {
  const HomeScreenPomodoro({super.key});

  @override
  State<HomeScreenPomodoro> createState() => _HomeScreenPomodoro();
}

class _HomeScreenPomodoro extends State<HomeScreenPomodoro> {
  static int maxRound = 4;
  static int maxGoal = 12;
  static int restTime = 300;
  int pomotimer = 0;
  int totalSeconds = 0;
  bool isRunning = false;
  int activeRound = 0;
  int activeGoal = 0;
  bool isResting = false;
  bool isAlert = false;

  late Timer timer;
  void onSetTimePressed(int miniute) {
    setState(() {
      pomotimer = miniute;
      totalSeconds = miniute;
      isAlert = false;
    });
  }

  void onTick(Timer timer) {
    if (pomotimer != 0) {
      if (totalSeconds == 0) {
        if (activeRound == maxRound) {
          setState(() {
            isResting = true;
            activeGoal = activeGoal + 1;
            activeRound = 0;
            totalSeconds = restTime;
          });
        } else {
          setState(() {
            isResting = false;
            isRunning = false;
            totalSeconds = pomotimer;
            if (activeRound < maxRound) {
              activeRound = activeRound + 1;
            }
          });
          timer.cancel();
        }
      } else {
        setState(() {
          totalSeconds = totalSeconds - 1;
        });
      }
    }
  }

  void onStartPressed() {
    if (pomotimer != 0) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );
      setState(() {
        if (activeRound == 0) {
          activeRound = activeRound + 1;
        }
        isRunning = true;
      });
    } else {
      setState(() {
        isAlert = true;
      });
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onPressReset() {
    timer.cancel();
    setState(() {
      pomotimer = 0;
      totalSeconds = 0;
      activeRound = 0;
      activeGoal = 0;
      isRunning = false;
      isAlert = false;
    });
  }

  String format(int seconds, String type) {
    var duration = Duration(seconds: seconds);
    var min = duration.toString().split(".").first.substring(2, 4);
    var sec = duration.toString().split(".").first.substring(5, 7);
    return type == 'min' ? min : sec;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: isResting
                  ? Text(
                      'Take A Break!',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    )
                  : isAlert
                      ? Text(
                          'Please Setting Time!',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        )
                      : pomotimer != totalSeconds ||
                              activeRound > 0 ||
                              activeGoal > 0
                          ? TextButton(
                              onPressed: onPressReset,
                              child: Text(
                                'Press Here To Reset',
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            )
                          : Text(
                              'Let\'s Start!',
                              style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: const Offset(10, -10),
                          child: Container(
                            width: 120,
                            height: 160,
                            color: Theme.of(context).cardColor.withOpacity(0.4),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(5, -5),
                          child: Container(
                            width: 130,
                            height: 160,
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 180,
                          color: Theme.of(context).cardColor,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              format(totalSeconds, 'min'),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 89,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ' : ',
                      style: TextStyle(
                        color: Theme.of(context).cardColor.withOpacity(0.4),
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: const Offset(10, -10),
                          child: Container(
                            width: 120,
                            height: 160,
                            color: Theme.of(context).cardColor.withOpacity(0.4),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(5, -5),
                          child: Container(
                            width: 130,
                            height: 160,
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 180,
                          color: Theme.of(context).cardColor,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              format(totalSeconds, 'sec'),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 89,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 15; i <= 35; i = i + 5)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: OutlinedButton(
                            onPressed: () =>
                                !isRunning ? onSetTimePressed(i * 60) : '',
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 3,
                                color: Colors.white.withOpacity(
                                    pomotimer == (i * 60) ? 1 : 0.6),
                              ),
                              backgroundColor: Colors.white
                                  .withOpacity(pomotimer == (i * 60) ? 1 : 0),
                              fixedSize: const Size(70, 50),
                            ),
                            child: Text(
                              i.toString(),
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                                color: pomotimer == (i * 60)
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  color: Colors.black.withOpacity(0.2),
                  onPressed: isResting
                      ? () => ''
                      : isRunning
                          ? onPausePressed
                          : onStartPressed,
                  icon: Icon(isResting
                      ? Icons.access_time_filled_rounded
                      : isRunning
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_filled_rounded),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$activeRound/$maxRound',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ROUND',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).cardColor,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$activeGoal/$maxGoal',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'GOAL',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).cardColor,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
