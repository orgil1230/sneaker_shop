import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/src/pages/home/widgets/newest_shoes.dart';
import 'package:sneakers_shop/src/pages/list/list.dart';
import 'package:sneakers_shop/src/theme/my_colors.dart';
import 'package:sneakers_shop/src/theme/my_textstyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.fromLTRB(18, 58, 0, 0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 18, 25),
                padding: const EdgeInsets.only(left: 25),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.homeShoesBg,
                  borderRadius: BorderRadius.circular(16.0),
                  //border: Border.all(width: 0, color: Colors.red),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 27,
                            color: Color(0xff949393),
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Just do it \n with'),
                            TextSpan(
                                text: ' Nike',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Explore now',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ]),
              ),
              Positioned(
                right: 10,
                top: -20,
                child: Container(
                  width: 230,
                  height: 340,
                  child: Image.asset('assets/images/shoe_home.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(ListScreen.routeName, arguments: 'popular');
                  Get.toNamed(ListScreen.routeName);
                },
                // print('snackbar');
                // Get.defaultDialog(title: 'haha');

                child: Container(
                  margin: const EdgeInsets.only(right: 18),
                  child: const Text(
                    'See more',
                    style: MyTextStyles.seeMoreStyle,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      padding: const EdgeInsets.only(left: 16),
                      height: width * 0.35,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                        color: MyColors.homePopularBg,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Nike'),
                                TextSpan(
                                    text: '\nFree Metcon',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.29),
                                        fontSize: 21)),
                                const TextSpan(
                                    text: '\n\$ 120.99',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -35,
                      top: -45,
                      child: Container(
                        height: width * 0.6,
                        child: Image.asset('assets/images/shoe_yellow.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 18),
                Container(
                  height: width * 0.35,
                  width: width * 0.7,
                  color: MyColors.homePopularBg,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Newest shoes',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 18),
                child: const Text(
                  'See more',
                  style: MyTextStyles.seeMoreStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewestShoes(),
                NewestShoes(),
                NewestShoes(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
