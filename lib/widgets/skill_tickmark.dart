import 'package:flutter/cupertino.dart';
import 'package:personal_portfolio/constants.dart';

class SkillTickMark extends StatelessWidget {
  const SkillTickMark({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.check_mark_circled,
          color: kRedColor,
        ),
        const SizedBox(width: kDefaultPadding / 2),
        Text(text),
      ],
    );
  }
}
