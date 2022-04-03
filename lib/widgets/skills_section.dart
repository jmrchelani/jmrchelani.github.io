import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: kMaxWidth / 2.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillCard(
                      image: Image.asset('assets/images/mobile.png'),
                      title: 'Mobile App Development',
                      style: 1,
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    SkillCard(
                      image: Image.asset('assets/images/computer.png'),
                      title: 'Backend Development',
                      style: 2,
                    ),
                  ],
                ),
                SkillCard(
                  image: Image.asset(
                    'assets/images/gamer.png',
                  ),
                  title: 'Gamer',
                  style: 3,
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
              width: kMaxWidth / 2.4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '— What I Do',
                    style: TextStyle(
                      fontSize: 16,
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    'Better design,\nBetter experiences!',
                    style: TextStyle(
                      fontSize: 22,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          'Long-hold the hyphen for access to the en dash and em dash with Gboard on Android or the default keyboard on iOS. The long-hold on the hyphen gives you access to four characters: A hyphen, an en dash, an em dash, and a bullet (Figure B).',
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreyColor,
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
