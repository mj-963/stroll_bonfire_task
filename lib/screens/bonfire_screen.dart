import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll_bonfire_task/models/question_option.dart';
import 'package:stroll_bonfire_task/widgets/app_bar.dart';
import 'package:stroll_bonfire_task/widgets/footer.dart';
import 'package:stroll_bonfire_task/widgets/question_section.dart';

class BonfireScreen extends ConsumerStatefulWidget {
  const BonfireScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BonfireScreenState();
}

class _BonfireScreenState extends ConsumerState<BonfireScreen> {
  List<QuestionOption> options = const [
    QuestionOption(
      id: 'A',
      label: 'A',
      text: 'The peace in the early mornings',
    ),
    QuestionOption(
      id: 'B',
      label: 'B',
      text: 'The magical golden hours',
    ),
    QuestionOption(
      id: 'C',
      label: 'C',
      text: 'Wind-down time after dinners',
    ),
    QuestionOption(
      id: 'D',
      label: 'D',
      text: 'The serenity past midnight',
    ),
  ];

  String? selectedOptionId;

  void _handleOptionSelected(String optionId) {
    setState(() {
      selectedOptionId = optionId;
      options = options
          .map((option) => option.copyWith(isSelected: option.id == optionId))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Background image
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Image.asset(
              'assets/images/background_video.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.5, // Transparent at the top
                    1.0, // Full black at the bottom
                  ],
                ),
              ),
            ),
          ),
          // Foreground Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // custom app bar
                  const CustomAppBar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                  ),

                  // Question section
                  Expanded(
                    child: QuestionSection(
                      profileImage: 'assets/images/profile_photo.jpg',
                      name: 'Angelina',
                      age: 28,
                      question: 'What is your favorite time of the day?',
                      userAnswer:
                          'Mine is definitely the peace in the morning.',
                      options: options,
                      onOptionSelected: _handleOptionSelected,
                    ),
                  ),
                  //Footer
                  const BonfireFooter(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
