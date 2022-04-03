import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width < kMaxWidth
          ? const EdgeInsets.symmetric(
              vertical: kDefaultPadding * 2,
              horizontal: kDefaultPadding,
            )
          : const EdgeInsets.all(0),
      child: Column(
        children: [
          Column(
            children: [
              MediaQuery.of(context).size.width < kMaxWidth / 2
                  ? Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.rocket_fill,
                              color: kRedColor,
                            ),
                            const SizedBox(
                              width: kDefaultPadding,
                            ),
                            InkWell(
                              onTap: () async {
                                if (!await launch(
                                    'https://www.github.com/jmrchelani/jmrchelani.github.io')) {
                                  throw 'Could not launch https://www.github.com/jmrchelani/jmrchelani.github.io';
                                }
                              },
                              child: const Text(
                                'Personal Portfolio',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Created with ',
                                style: TextStyle(fontSize: 16)),
                            const Icon(
                              CupertinoIcons.heart_fill,
                              color: kRedColor,
                            ),
                            const Text(' by', style: TextStyle(fontSize: 16)),
                            InkWell(
                              onTap: () async {
                                if (!await launch(
                                    'https://www.github.com/jmrchelani')) {
                                  throw 'Could not launch https://www.github.com/jmrchelani';
                                }
                              },
                              child: const Text(
                                ' Milton Chelani.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kRedColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.rocket_fill,
                              color: kRedColor,
                            ),
                            const SizedBox(
                              width: kDefaultPadding,
                            ),
                            InkWell(
                              onTap: () async {
                                if (!await launch(
                                    'https://www.github.com/jmrchelani/jmrchelani.github.io')) {
                                  throw 'Could not launch https://www.github.com/jmrchelani/jmrchelani.github.io';
                                }
                              },
                              child: const Text(
                                'Personal Portfolio',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Created with ',
                                style: TextStyle(fontSize: 16)),
                            const Icon(
                              CupertinoIcons.heart_fill,
                              color: kRedColor,
                            ),
                            const Text(' by', style: TextStyle(fontSize: 16)),
                            InkWell(
                              onTap: () async {
                                if (!await launch(
                                    'https://www.github.com/jmrchelani')) {
                                  throw 'Could not launch https://www.github.com/jmrchelani';
                                }
                              },
                              child: const Text(
                                ' Milton Chelani.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kRedColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          const SizedBox(
            width: kMaxWidth,
            child: Divider(
              color: kRedColor,
              height: 1,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediaQuery.of(context).size.width < 400
                  ? Column(
                      children: const [
                        Text(
                          'Copyright © 2022',
                          style: TextStyle(
                            fontSize: 16,
                            color: kGreyColor,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        Text(
                          'All Right Reserved.',
                          style: TextStyle(
                            fontSize: 16,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Copyright © 2022 All rights reserved.',
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreyColor,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
