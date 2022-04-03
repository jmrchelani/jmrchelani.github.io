import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height / 4,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.rocket_fill,
                        color: kRedColor,
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text(
                        'Personal Portfolio',
                        style: TextStyle(
                          fontSize: 16,
                          color: kRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Created with ', style: TextStyle(fontSize: 16)),
                      Icon(
                        CupertinoIcons.heart_fill,
                        color: kRedColor,
                      ),
                      Text(' by Milton Chelani.',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        SizedBox(
          width: kMaxWidth,
          child: Divider(
            color: kRedColor,
            height: 1,
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Copyright © 2020 All rights reserved.',
              style: TextStyle(
                fontSize: 16,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
