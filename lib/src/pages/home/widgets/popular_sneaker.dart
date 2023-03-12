import 'package:flutter/material.dart';
import 'package:sneakers_shop/src/theme/my_colors.dart';

class PopularSneaker extends StatelessWidget {
  const PopularSneaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 20, 0),
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
          child: SizedBox(
            height: width * 0.6,
            child: Image.asset('assets/images/shoe_yellow.png'),
          ),
        ),
      ],
    );
  }
}
