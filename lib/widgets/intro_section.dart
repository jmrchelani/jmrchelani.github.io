import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/data.dart';
import 'package:personal_portfolio/widgets/custom_clip_path.dart';
import 'package:personal_portfolio/widgets/social_row.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text2 = const Text(
      'I am also on Social Media',
      style: TextStyle(
        color: kGreyColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    return MediaQuery.of(context).size.width > kMaxWidth
        ? SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: kMaxWidth / 2 - kDefaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '— Hello',
                            style: TextStyle(
                              fontSize: 24,
                              color: kRedColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'I\'m Milton Chelani'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 64,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                            'Flutter Developer',
                            style: TextStyle(
                              fontSize: 28,
                              color: kGreyColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 2,
                          ),
                          Row(
                            children: [
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
                    SizedBox(
                      width: kMaxWidth / 2 - kDefaultPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        kDefaultPadding,
                                      ),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        // width: kMaxWidth / 2,
                                        child: Container(
                                          margin: const EdgeInsets.all(
                                            kDefaultPadding,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomRight: Radius.circular(50),
                                              bottomLeft: Radius.circular(50),
                                            ),
                                            child: Image.asset(
                                              'assets/images/pic.png',
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        // bottom: -1,
                                        // left: -1,
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          padding: const EdgeInsets.all(
                                              kDefaultPadding / 2),
                                          decoration: BoxDecoration(
                                            color: kRedColor.withOpacity(0.25),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            // padding: EdgeInsets.all(
                                            //     kDefaultPadding / 2),
                                            decoration: BoxDecoration(
                                              color: kRedColor.withOpacity(0.5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: TextButton(
                                                onPressed: () async {
                                                  if (!await launch(
                                                      kYoutubeUrl)) {
                                                    throw 'Could not launch $kYoutubeUrl';
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  size: 32,
                                                  color: kWhiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        // bottom: -1,
                                        // left: -1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: ClipPath(
                                            clipper: CustomClipPath(),
                                            child: Container(
                                              height: 80,
                                              width: 140,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding,
                                                vertical:
                                                    kDefaultPadding * 1.25,
                                              ),
                                              decoration: BoxDecoration(
                                                color: kBlueColor
                                                    .withOpacity(0.75),
                                                shape: BoxShape.rectangle,
                                                boxShadow:
                                                    kElevationToShadow[6],
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(
                                                    //   width:
                                                    //       kDefaultPadding / 2,
                                                    // ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: const [
                                                          Expanded(
                                                            child: Text(
                                                              'Experience',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    kWhiteColor,
                                                                // fontWeight:
                                                                //     FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: '4 ',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color:
                                                                          kWhiteColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        'Years',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          kWhiteColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Expanded(
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .laptopCode,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const RotatedBox(
                                quarterTurns: 1,
                                child: SocialRow(),
                              ),
                              const SizedBox(width: kDefaultPadding / 1.5),
                              const RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  'I am also on Social Media',
                                  style: TextStyle(
                                    color: kGreyColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
            child: SizedBox(
              width: kMaxWidth / 2,
              child: Column(
                children: [
                  SizedBox(
                    // width: kMaxWidth / 2 - kDefaultPadding,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '— Hello',
                          style: TextStyle(
                            fontSize: 24,
                            color: kRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          'I\'m < />\nMilton Chelani'.toUpperCase(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width <
                                    kMaxWidth / 2
                                ? 40
                                : 64,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                          'Flutter Developer',
                          style: TextStyle(
                            fontSize: 28,
                            color: kGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  SizedBox(
                    // width: kMaxWidth / 2 - kDefaultPadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                    kDefaultPadding,
                                  ),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    // width: kMaxWidth / 2,
                                    child: Container(
                                      margin: const EdgeInsets.all(
                                        kDefaultPadding,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                        child: Image.asset(
                                          'assets/images/pic.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    // bottom: -1,
                                    // left: -1,
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      padding: const EdgeInsets.all(
                                          kDefaultPadding / 2),
                                      decoration: BoxDecoration(
                                        color: kRedColor.withOpacity(0.25),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        // padding: EdgeInsets.all(
                                        //     kDefaultPadding / 2),
                                        decoration: BoxDecoration(
                                          color: kRedColor.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () async {
                                              if (!await launch(kYoutubeUrl)) {
                                                throw 'Could not launch $kYoutubeUrl';
                                              }
                                            },
                                            child: const Icon(
                                              Icons.play_arrow,
                                              size: 32,
                                              color: kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    // bottom: -1,
                                    // left: -1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: ClipPath(
                                        clipper: CustomClipPath(),
                                        child: Container(
                                          height: 80,
                                          width: 140,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding,
                                            vertical: kDefaultPadding * 1.25,
                                          ),
                                          decoration: BoxDecoration(
                                            color: kBlueColor.withOpacity(0.75),
                                            shape: BoxShape.rectangle,
                                            boxShadow: kElevationToShadow[6],
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // SizedBox(
                                                //   width:
                                                //       kDefaultPadding / 2,
                                                // ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const [
                                                      Expanded(
                                                        child: Text(
                                                          'Experience',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: kWhiteColor,
                                                            // fontWeight:
                                                            //     FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: '4 ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color:
                                                                      kWhiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'Years',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      kWhiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Expanded(
                                                  child: FaIcon(
                                                    FontAwesomeIcons.laptopCode,
                                                    size: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding * 2),
                            text2,
                            const SizedBox(height: kDefaultPadding / 2),
                            const SocialRow(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
