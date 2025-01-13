class QuestionOption {
  final String id;
  final String label;
  final String text;
  final bool isSelected;

  const QuestionOption({
    required this.id,
    required this.label,
    required this.text,
    this.isSelected = false,
  });

  QuestionOption copyWith({bool? isSelected}) {
    return QuestionOption(
      id: id,
      label: label,
      text: text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
