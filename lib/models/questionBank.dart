library globals;

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

int gtotal_score = 0;

final questions = [
  Question(
    text: "What should you do when approaching a yellow traffic light?",
    options: [
      Option(
          text: "Speed up and cross the intersection quickly",
          isCorrect: false),
      Option(text: "Come to a complete stop", isCorrect: false),
      Option(text: "Slow down and prepare to stop", isCorrect: true),
      Option(text: "Ignore the light and continue driving", isCorrect: false),
    ],
  ),
  Question(
    text: "What does a red octagonal sign indicate?",
    options: [
      Option(text: "Yield right of way", isCorrect: false),
      Option(text: "Stop and proceed when safe", isCorrect: true),
      Option(text: "Merge with traffic", isCorrect: false),
      Option(text: "No left turn allowed", isCorrect: false),
    ],
  ),
  Question(
    text: "What is the purpose of a crosswalk?",
    options: [
      Option(text: "A designated area for parking", isCorrect: false),
      Option(text: "A place to stop and rest", isCorrect: false),
      Option(text: "A path for pedestrians to cross the road", isCorrect: true),
      Option(text: "A location for U-turns", isCorrect: false),
    ],
  ),
  // Question(
  //   text: "When are you allowed to pass another vehicle on the right?",
  //   options: [
  //     Option(text: "When the vehicle ahead is turning left", isCorrect: true),
  //     Option(text: "When the vehicle ahead is moving slowly", isCorrect: false),
  //     Option(text: "Only in residential areas", isCorrect: false),
  //     Option(text: "During rush hour traffic", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text: "What does a solid white line on the road indicate?",
  //   options: [
  //     Option(text: "A lane change is allowed", isCorrect: false),
  //     Option(text: "No passing allowed", isCorrect: true),
  //     Option(text: "Highway exit ahead", isCorrect: false),
  //     Option(text: "One-way road ahead", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text: "What is the purpose of an acceleration lane?",
  //   options: [
  //     Option(text: "To exit the highway", isCorrect: false),
  //     Option(text: "To merge with highway traffic", isCorrect: true),
  //     Option(text: "To park vehicles", isCorrect: false),
  //     Option(text: "To make a U-turn", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text:
  //       "What should you do when approaching a railroad crossing with flashing lights?",
  //   options: [
  //     Option(text: "Stop and proceed when safe", isCorrect: true),
  //     Option(text: "Increase your speed to cross quickly", isCorrect: false),
  //     Option(text: "Honk your horn to alert others", isCorrect: false),
  //     Option(text: "Proceed without stopping", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text: "What does a green arrow signal mean?",
  //   options: [
  //     Option(text: "Stop and yield to oncoming traffic", isCorrect: false),
  //     Option(text: "Proceed in the direction of the arrow", isCorrect: true),
  //     Option(text: "Prepare to make a U-turn", isCorrect: false),
  //     Option(text: "Follow the flow of traffic", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text:
  //       "What should you do when a school bus with flashing red lights is stopped ahead?",
  //   options: [
  //     Option(text: "Pass the bus with caution", isCorrect: false),
  //     Option(text: "Slow down and proceed with caution", isCorrect: false),
  //     Option(text: "Come to a complete stop", isCorrect: true),
  //     Option(text: "Change lanes and continue driving", isCorrect: false),
  //   ],
  // ),
  // Question(
  //   text: "What does a yellow diamond-shaped sign indicate?",
  //   options: [
  //     Option(text: "Pedestrian crossing ahead", isCorrect: false),
  //     Option(text: "Construction zone ahead", isCorrect: true),
  //     Option(text: "No parking allowed", isCorrect: false),
  //     Option(text: "Two-way traffic ahead", isCorrect: false),
  //   ],
  // ),
];
