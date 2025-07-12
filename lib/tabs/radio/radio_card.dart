import 'package:flutter/material.dart';
import 'package:islami_app/widgets/app_theme.dart';

class RadioCard extends StatelessWidget {
  final String name;
  final bool isSpecial;

  const RadioCard({required this.name, required this.isSpecial});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primay,
        image: DecorationImage(
          image: AssetImage(
            isSpecial
                ? 'assets/images/background_item_radio.png'
                : 'assets/images/hadeth_footer.png',
          ),
          fit: isSpecial ? BoxFit.fitWidth : BoxFit.fill,
          alignment: isSpecial ? Alignment.bottomCenter : Alignment.center,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSpecial ? Icons.pause_outlined : Icons.play_arrow,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(width: 10),
              Icon(
                isSpecial ? Icons.volume_off : Icons.volume_up,
                color: Colors.black,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
