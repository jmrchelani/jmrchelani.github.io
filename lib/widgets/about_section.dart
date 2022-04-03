import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/data.dart';
import 'package:personal_portfolio/widgets/skill_tickmark.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
    required this.onPressedPortfolio,
  }) : super(key: key);

  final Function onPressedPortfolio;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < kMaxWidth
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
            child: SizedBox(
              width: kMaxWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '— About',
                        style: TextStyle(
                          fontSize: 16,
                          color: kRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const Text(
                        'Multidisciplinary Developer,\njmrchelani everywhere!',
                        style: TextStyle(
                          fontSize: 22,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const Text.rich(
                        TextSpan(
                          text:
                              '(he/him) - Passionate, eloquent and avid software engineering student with aim to become fervent developer.',
                          style: TextStyle(
                            fontSize: 16,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      MediaQuery.of(context).size.width < kMaxWidth / 2
                          ? Column(
                              children: const [
                                SkillTickMark(
                                  text: 'Problem Solver',
                                ),
                                SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                SkillTickMark(
                                  text: 'Effective Communicator',
                                ),
                                SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                SkillTickMark(
                                  text: 'Broad-minded',
                                ),
                                SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                SkillTickMark(
                                  text: 'Creative',
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SkillTickMark(
                                      text: 'Problem Solver',
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding * 2,
                                    ),
                                    SkillTickMark(
                                      text: 'Effective Communicator',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SkillTickMark(
                                      text: 'Broad-minded',
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding * 2,
                                    ),
                                    SkillTickMark(
                                      text: 'Creative',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  MediaQuery.of(context).size.width < kMaxWidth / 2
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: ,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: kRedColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              onPressed: () => onPressedPortfolio(),
                              child: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Text(
                                  'My Portfolio',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kRedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding * 2,
                            ),
                            InkWell(
                              onTap: () async {
                                if (await canLaunch(kCVUrl)) {
                                  await launch(kCVUrl);
                                } else {
                                  throw 'Could not launch $kCVUrl';
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: kRedColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Download CV',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kRedColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Icon(
                                      CupertinoIcons.arrow_down_to_line_alt,
                                      color: kRedColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: kRedColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              onPressed: () => onPressedPortfolio(),
                              child: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Text(
                                  'My Portfolio',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kRedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultPadding * 2,
                            ),
                            InkWell(
                              onTap: () async {
                                if (await canLaunch(kCVUrl)) {
                                  await launch(kCVUrl);
                                } else {
                                  throw 'Could not launch $kCVUrl';
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: kRedColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Download CV',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kRedColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Icon(
                                      CupertinoIcons.arrow_down_to_line_alt,
                                      color: kRedColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    width: kMaxWidth / 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '— About',
                          style: TextStyle(
                            fontSize: 16,
                            color: kRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                          'Multidisciplinary Developer,\njmrchelani everywhere!',
                          style: TextStyle(
                            fontSize: 22,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text.rich(
                          TextSpan(
                            text:
                                '(he/him) - Passionate, eloquent and avid software engineering student with aim to become fervent developer.',
                            style: TextStyle(
                              fontSize: 16,
                              color: kGreyColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        Column(
                          children: [
                            Row(
                              children: const [
                                SkillTickMark(
                                  text: 'Problem Solver',
                                ),
                                SizedBox(
                                  width: kDefaultPadding * 2,
                                ),
                                SkillTickMark(
                                  text: 'Effective Communicator',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            Row(
                              children: const [
                                SkillTickMark(
                                  text: 'Broad-minded',
                                ),
                                SizedBox(
                                  width: kDefaultPadding * 2,
                                ),
                                SkillTickMark(
                                  text: 'Creative',
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: kRedColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              onPressed: () => onPressedPortfolio(),
                              child: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Text(
                                  'My Portfolio',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kRedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultPadding * 2,
                            ),
                            InkWell(
                              onTap: () async {
                                if (await canLaunch(kCVUrl)) {
                                  await launch(kCVUrl);
                                } else {
                                  throw 'Could not launch $kCVUrl';
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: kRedColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Download CV',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kRedColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Icon(
                                      CupertinoIcons.arrow_down_to_line_alt,
                                      color: kRedColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.25),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      width: kMaxWidth / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/pic2.jpg',
                          opacity: const AlwaysStoppedAnimation(0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
