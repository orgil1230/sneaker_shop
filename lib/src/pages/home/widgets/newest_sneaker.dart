import 'package:flutter/material.dart';

import '../../../theme/my_colors.dart';

class NewestSneaker extends StatelessWidget {
  const NewestSneaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: MyColors.homePopularBg,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(Icons.favorite_outline_outlined),
          Image.asset(
            'assets/images/shoe_yeezy.png',
            fit: BoxFit.fitWidth,
            scale: 0.1,
            // color: Colors.red,
            // colorBlendMode: BlendMode.darken,
          ),
        ],
      ),
    );
  }
}
