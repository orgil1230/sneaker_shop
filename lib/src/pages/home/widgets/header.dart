import 'package:flutter/material.dart';
import 'package:sneakers_shop/src/theme/my_colors.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                          text: ' Nike', style: TextStyle(color: Colors.white)),
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
          child: SizedBox(
            width: 230,
            height: 340,
            child: Image.asset('assets/images/shoe_home.png'),
          ),
        ),
      ],
    );
  }
}
