import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:four_foto_one_word/repository/repository.dart';
import 'package:four_foto_one_word/widgets/you_win.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final repository = Repository();
  var item;
  var coinValue = 3;
  var text16 = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];
  var text8 = ["", "", "", "", "", "", "", ""];

  @override
  void initState() {
    super.initState();
    repository.load();
    item = repository.getItem();
    setText16();
    setState(() {});
  }

  void setText16() {
    for (int i = 0; i < 16; ++i) {
      text16[i] = item.str16[i];
    }
  }

  void changeTextValue16(String str, int index16) {
    for (int i = 0; i < item.str8.length; ++i) {
      if (text8[i] == "") {
        text8[i] = str;
        text16[index16] = "";
        setState(() {});
        return;
      }
    }
  }

  void changeTextValue8(String str, int index8) {
    for (int i = 0; i < 16; ++i) {
      if (text16[i] == "" && item.str16[i] == str) {
        text16[i] = str;
        text8[index8] = "";
        setState(() {});
        return;
      }
    }
  }

  void isWin() {
    for (int i = 0; i < item.str8.length; ++i) {
      if (item.str8[i] != text8[i]) {
        return;
      }
    }
    if (repository.getIndex() == 30) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const YouWin()));
    }
    for (int i = 0; i < 8; ++i) {
      text8[i] = "";
    }
    item = repository.getItem();
    setText16();
    setState(() {});
  }

  void clickLamp() {
    if (coinValue > 0) {
      coinValue--;
      for (int i = 0; i < item.str8.length; ++i) {
        if (text8[i] == "") {
          for (int j = 0; j < 16; ++j) {
            if (text16[j] == item.str8[i]) {
              text8[i] = text16[j];
              text16[j] = "";
              setState(() {});
              return;
            }
          }
          for (int j = 0; j < item.str8.length; ++j) {
            if (text8[j] == item.str8[i] && i != j) {
              text8[i] = item.str8[i];
              text8[j] = "";
              setState(() {});
              return;
            }
          }
        }
      }

      for (int i = 0; i < item.str8.length; ++i) {
        if (item.str8[i] != text8[i]) {
          for (int j = 0; j < 16; ++j) {
            if (text16[j] == item.str8[i]) {
              for (int k = 0; k < 16; ++k) {
                if (item.str16[k] == text8[i] && text16[k] == "") {
                  text16[k] = text8[i];
                  text8[i] = item.str8[i];
                  text16[j] = "";
                  setState(() {});
                  return;
                }
              }
            }
          }
        }
      }

      for (int i = 0; i < item.str8.length; ++i) {
        if (text8[i] != item.str8[i]) {
          for (int j = 0; j < item.str8.length; ++j) {
            if (text8[i] == text8[j] && j != i) {
              for (int k = 0; k < 16; ++k) {
                if (item.str16[k] == text8[i] && text16[k] == "") {
                  text16[k] = text8[i];
                  text8[i] = text8[j];
                  text8[j] = "";
                  setState(() {});
                  return;
                }
              }
            }
          }
        }
      }
    } else {
      /// show dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
          ),
          Positioned.fill(
            child: FloatingBubbles(
              noOfBubbles: 25,
              colorsOfBubbles: const [
                Colors.green,
                Colors.red,
                Colors.blue,
                Colors.purple,
                Colors.teal,
              ],
              sizeFactor: 0.29,
              duration: 999999999999999999,
              // 120 seconds.
              opacity: 70,
              paintingStyle: PaintingStyle.fill,
              strokeWidth: 12,
              shape: BubbleShape.circle,
              // circle is the default. No need to explicitly mention if its a circle.
              speed: BubbleSpeed.normal, // normal is the default
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              height: 24,
              child: Row(
                children: [
                  Image.asset("assets/images/coin.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      ":",
                      style: TextStyle(
                          color: coinValue > 0
                              ? Colors.green.withOpacity(0.9)
                              : Colors.red,
                          decoration: TextDecoration.none,
                          fontSize: 24),
                    ),
                  ),
                  Text(
                    coinValue.toString(),
                    style: TextStyle(
                        color: coinValue > 0
                            ? Colors.green.withOpacity(0.9)
                            : Colors.red,
                        decoration: TextDecoration.none,
                        fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              color: Colors.black.withOpacity(0.3),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: (MediaQuery.of(context).size.width * 0.9) / 2,
                    child: Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02, left: MediaQuery.of(context).size.width * 0.005),
                          width: (MediaQuery.of(context).size.width * 0.9) / 2,
                          height: (MediaQuery.of(context).size.width * 0.9) / 2,
                          child: Image.asset(
                            item.image1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.005, left: MediaQuery.of(context).size.width * 0.02),
                          width: (MediaQuery.of(context).size.width * 0.9) / 2,
                          height: (MediaQuery.of(context).size.width * 0.9) / 2,
                          child: Image.asset(
                            item.image2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: (MediaQuery.of(context).size.width * 0.9) / 2,
                    child: Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.005),
                          width: (MediaQuery.of(context).size.width * 0.9) / 2,
                          height: (MediaQuery.of(context).size.width * 0.9) / 2,
                          child: Image.asset(
                            item.image3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.005),
                          width: (MediaQuery.of(context).size.width * 0.9) / 2,
                          height: (MediaQuery.of(context).size.width * 0.9) / 2,
                          child: Image.asset(
                            item.image4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom:
                80 + 3 * (((MediaQuery.of(context).size.width * 0.9) - 14) / 8),
            right: MediaQuery.of(context).size.width * 0.05,
            child: GestureDetector(
              onTap: () {
                clickLamp();
                isWin();
              },
              child: Image.asset(
                "assets/images/lamp.png",
                width: 32,
                height: 32,
              ),
            ),
          ),
          Positioned(
            bottom:
                72 + 2 * (((MediaQuery.of(context).size.width * 0.9) - 14) / 8),
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: ((MediaQuery.of(context).size.width * 0.9) - 14) / 8,
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 0) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[0], 0);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[0],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height:
                              ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                  8,
                          width:
                              ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                  8,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 1) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[1], 1);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[1],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 2) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[2], 2);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[2],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 3) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[3], 3);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[3],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 4) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[4], 4);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[4],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 5) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[5], 5);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[5],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 6) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[6], 6);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[6],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: Builder(builder: (context) {
                      if (item.str8.length > 7) {
                        return GestureDetector(
                          onTap: () {
                            changeTextValue8(text8[7], 7);
                          },
                          child: Container(
                            height: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            width: ((MediaQuery.of(context).size.width * 0.9) -
                                    14) /
                                8,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                text8[7],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      (((MediaQuery.of(context).size.width *
                                                      0.9) -
                                                  14) /
                                              8) -
                                          4,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 0,
                          height: 0,
                        );
                      }
                    }),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 48 + ((MediaQuery.of(context).size.width * 0.9) - 14) / 8,
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: ((MediaQuery.of(context).size.width * 0.9) - 14) / 8,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[0], 0);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[0],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[1], 1);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[1],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[2], 2);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[2],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[3], 3);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[3],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[4], 4);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[4],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[5], 5);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[5],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[6], 6);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[6],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[7], 7);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[7],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: ((MediaQuery.of(context).size.width * 0.9) - 14) / 8,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[8], 8);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[8],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[9], 9);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[9],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[10], 10);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[10],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[11], 11);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[11],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[12], 12);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[12],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[13], 13);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[13],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[14], 14);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[14],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: GestureDetector(
                      onTap: () {
                        changeTextValue16(text16[15], 15);
                        isWin();
                      },
                      child: Container(
                        height:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        width:
                            ((MediaQuery.of(context).size.width * 0.9) - 14) /
                                8,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            text16[15],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.none,
                              fontSize:
                                  (((MediaQuery.of(context).size.width * 0.9) -
                                              14) /
                                          8) -
                                      4,
                            ),
                          ),
                        ),
                      ),
                    ),
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
