import 'package:flutter/material.dart';
import 'package:stroll_bonfire_task/models/question_option.dart';
import 'package:stroll_bonfire_task/utils/app_colors.dart';

class QuestionSection extends StatelessWidget {
  final String profileImage;
  final String name;
  final int age;
  final String question;
  final String? userAnswer;
  final List<QuestionOption> options;
  final Function(String) onOptionSelected;

  const QuestionSection({
    super.key,
    required this.profileImage,
    required this.name,
    required this.age,
    required this.question,
    this.userAnswer,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile card section
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name, $age',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  // Question
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 4.0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      question,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // User's answer
                  if (userAnswer != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                      ),
                      child: Text(
                        '"$userAnswer"',
                        style: const TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        // Options Grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2.8, // Adjust this value to match the design
          children:
              options.map((option) => _buildOptionButton(option)).toList(),
        ),
      ],
    );
  }

  Widget _buildOptionButton(QuestionOption option) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: option.isSelected
                ? AppColors.primaryDark
                : Colors.black.withOpacity(0.3),
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onOptionSelected(option.id),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: option.isSelected
                        ? AppColors.primaryDark
                        : Colors.black.withOpacity(0.3),
                    border: Border.all(
                      color: option.isSelected
                          ? AppColors.primaryDark
                          : Colors.white54,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      option.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    option.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
