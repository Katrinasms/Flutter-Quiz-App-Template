import 'package:finalquiz/models/questionBank.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_route_constant.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with TickerProviderStateMixin {
  late PageController _controller;
  int _counter = 0;
  bool selected = false;
  int selected_ind = -1;
  int total_score = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    _counter = 0;

    super.initState();
  }

  void nextQuestion() {
    if (_counter < questions.length - 1) {
      setState(() {
        _controller.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      });
    } else {
      gtotal_score = total_score;
      GoRouter.of(context).pushNamed(MyAppRouteConstraint.resultRouteName);
    }
  }

  void selectAns(int selected_index, bool isCorrect) {
    if (selected == false) {
      setState(() {
        selected_ind = selected_index;
        selected = true;
        if (isCorrect) {
          total_score++;
        }
      });
    } else {
      nextQuestion();
      selected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: questions.length,
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (context, index) {
          Question question1 = questions[index];
          _counter = index;
          return Scaffold(
            backgroundColor: Color(0xffF7EBE1),
            appBar: AppBar(
              backgroundColor: Color(0xffEDA276),
              title: Text('Question ${index + 1}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: -0.1,
                    color: Color(0xFFFAFAFA).withOpacity(0.9),
                  )),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topRight: Radius.circular(68.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xFF3A5160).withOpacity(0.2),
                              offset: Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ]),
                    child: Column(
                      children: [
                        progressBar(index: index),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text(
                            question1.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              letterSpacing: -0.1,
                              color: Color(0xFF253840).withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Expanded(
                  child: ListView.builder(
                    itemCount: question1.options.length,
                    itemBuilder: (context, index1) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buttonWidget(
                          nextQuestion: selectAns,
                          question: question1,
                          ans_ind: index1,
                          selected: selected,
                          selected_ind: selected_ind,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
    // );
  }
}

class progressBar extends StatefulWidget {
  const progressBar({super.key, required this.index});

  final int index;

  @override
  State<progressBar> createState() => _progressBarState();
}

class _progressBarState extends State<progressBar>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / 9) * 1, 1.0, curve: Curves.fastOutSlowIn)));
    animationController?.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                color: HexColor('#87A0E5').withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: (200 / questions.length * (widget.index)) +
                        ((200 / questions.length) * animation!.value),
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor('#EDA276'),
                        HexColor('#EDA276').withOpacity(0.5),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class buttonWidget extends StatefulWidget {
  const buttonWidget(
      {Key? key,
      required this.nextQuestion,
      required this.question,
      required this.ans_ind,
      required this.selected,
      required this.selected_ind})
      : super(key: key);
  final Function nextQuestion;
  final Question question;
  final bool selected;
  final int ans_ind;
  final int selected_ind;

  @override
  ___buttonWidgetState createState() => ___buttonWidgetState();
}

class ___buttonWidgetState extends State<buttonWidget>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(
            (1 / widget.question.options.length) * widget.ans_ind, 1.0,
            curve: Curves.fastOutSlowIn)));
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          int ind = widget.ans_ind;

          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0, 100 * (1.0 - animation!.value), 0.0),
              child: Container(
                // width: 400,
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ListTile(
                  title: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: widget.selected
                          ? (widget.question.options[ind].isCorrect
                              ? MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 73, 121, 113))
                              : (widget.selected_ind == ind
                                  ? MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 209, 85, 89))
                                  : MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 152, 149, 148))))
                          : MaterialStateProperty.all<Color>(Color(0xffEDA276)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        widget.question.options[ind].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: -0.1,
                          color: Color(0xFFFAFAFA).withOpacity(0.9),
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.nextQuestion(widget.ans_ind,
                          widget.question.options[ind].isCorrect);
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
