import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/nav_button.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.navItems,
    required this.currentIndex,
  }) : super(key: key);

  final List<Map<String, dynamic>> navItems;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Milton.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...navItems
                    .map(
                      (e) => NavButton(
                        text: e['text'],
                        onPressed: e['onPressed'],
                        isSelected: currentIndex == e['index'],
                      ),
                    )
                    .toList(),
                // NavButton(
                //   text: 'Home',
                //   onPressed: () {},
                //   isSelected: currentIndex == 0,
                // ),
                // Text(
                //   'About Us',
                //   style: TextStyle(
                //     color: kGreyColor,
                //     fontSize: 16,
                //   ),
                // ),
                // Text('Services'),
                // Text('Contact Us'),
                SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_phone,
                      color: kGreyColor,
                    ),
                    SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    Text(
                      '+92 330 2627870',
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
