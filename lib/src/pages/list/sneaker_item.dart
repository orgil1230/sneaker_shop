import 'package:flutter/material.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';

import '../../theme/my_colors.dart';

class SneakerItem extends StatefulWidget {
  Sneaker sneaker;

  SneakerItem({super.key, required this.sneaker});

  @override
  State<SneakerItem> createState() => _SneakerItemState();
}

class _SneakerItemState extends State<SneakerItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.homePopularBg,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.sneaker.isFav = !widget.sneaker.isFav;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(widget.sneaker.isFav
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
              ),
              SizedBox(
                width: 149,
                height: 116,
                child: Image.asset('assets/images/${widget.sneaker.image}'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(text: widget.sneaker.name),
                TextSpan(
                    text: '\n\$ ${widget.sneaker.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
