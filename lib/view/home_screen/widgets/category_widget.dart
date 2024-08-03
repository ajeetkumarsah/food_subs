import 'package:flutter/material.dart';
import 'package:food_subs/data/models/top_kitchen_model.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/utils/png_files.dart';
import 'package:food_subs/view/widgets/custom_image.dart';

class TopKitchenCard extends StatelessWidget {
  final TopKitchenModel kitchen;
  const TopKitchenCard({super.key, required this.kitchen});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImage(
              image: kitchen.image ?? '',
              height: 88,
              width: 88,
              fit: BoxFit.cover,
              placeholder: PngFiles.categoryPH,
            ),
          ),
        ),
        SizedBox(
          width: 90,
          child: Text(
            kitchen.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              // color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // if (i == 0)
        //   Container(
        //     height: 2,
        //     width: 60,
        //     color: AppColors.primary,
        //     margin: const EdgeInsets.symmetric(
        //       vertical: 8,
        //     ),
        //   ),
      ],
    );
  }
}
