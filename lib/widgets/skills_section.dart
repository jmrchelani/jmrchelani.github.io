import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < kMaxWidth
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
            child: SizedBox(
              width: kMaxWidth / 2,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  SizedBox(
                    width: kMaxWidth / 2,
                    child: MediaQuery.of(context).size.width < kMaxWidth / 2
                        ? Column(
                            children: [
                              SkillCard(
                                image: Image.asset('assets/images/mobile.png'),
                                title: 'Mobile App Development',
                                style: 1,
                              ),
                              const SizedBox(
                                height: kDefaultPadding * 2,
                              ),
                              SkillCard(
                                image:
                                    Image.asset('assets/images/computer.png'),
                                title: 'Backend Development',
                                style: 2,
                              ),
                              const SizedBox(
                                height: kDefaultPadding * 2,
                              ),
                              SkillCard(
                                image: Image.asset(
                                  'assets/images/gamer.png',
                                ),
                                title: 'Gamer',
                                style: 3,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SkillCard(
                                    image:
                                        Image.asset('assets/images/mobile.png'),
                                    title: 'Mobile App Development',
                                    style: 1,
                                  ),
                                  const SizedBox(
                                    height: kDefaultPadding * 2,
                                  ),
                                  SkillCard(
                                    image: Image.asset(
                                        'assets/images/computer.png'),
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
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  SizedBox(
                    width: kMaxWidth / 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                                'I am a full time App Developer, working mostly on the Flutter framework. I have developed numerous apps using Flutter which work almost everywhere regardless of the platform. Thanks to my quick logic, I am also a part time Backend Developer. I think it is all the results of my all-day Gaming, which made me a better programmer!',
                            style: TextStyle(
                              fontSize: 16,
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].reversed.toList(),
              ),
            ),
          )
        : SizedBox(
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
                          const SizedBox(
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
                      children: const [
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
                                'I am a full time App Developer, working mostly on the Flutter framework. I have developed numerous apps using Flutter which work almost everywhere regardless of the platform. Thanks to my quick logic, I am also a part time Backend Developer. I think it is all the results of my all-day Gaming, which made me a better programmer!',
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
