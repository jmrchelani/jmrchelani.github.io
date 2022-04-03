import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/skill_tickmark.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  Text(
                    '— About',
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
                    'Multidisciplinary Developer,\njmrchelani everywhere!',
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
                          '(he/him) - Passionate, eloquent and avid software engineering student with aim to become fervent developer.',
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
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
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Row(
                        children: [
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
                  SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: kRedColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
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
                      SizedBox(
                        width: kDefaultPadding * 2,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: kRedColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
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
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.25),
                  borderRadius: BorderRadius.only(
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
