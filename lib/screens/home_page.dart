import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/about_section.dart';
import 'package:personal_portfolio/widgets/copyright_section.dart';
import 'package:personal_portfolio/widgets/intro_section.dart';
import 'package:personal_portfolio/widgets/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.onPressedPortfolio,
  }) : super(key: key);

  final void Function() onPressedPortfolio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IntroSection(),
        const SkillsSection(),
        AboutSection(
          onPressedPortfolio: onPressedPortfolio,
        ),
        const CopyrightSection(),
      ],
    );
  }
}
