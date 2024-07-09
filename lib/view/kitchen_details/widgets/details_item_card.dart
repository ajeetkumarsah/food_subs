import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_subs/utils/png_files.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/view/kitchen_details/widgets/item_bottomsheet.dart';

class DetailsItemCardWidget extends StatelessWidget {
  final bool freeDessert;
  const DetailsItemCardWidget({super.key, this.freeDessert = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: .5,
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Halka Fulka Tiffin',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Handi chaap curry + Dal +3 Roti/ Rice',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: '  (Any one)',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: freeDessert
                  ? AppColors.maroon.withOpacity(.1)
                  : AppColors.green.withOpacity(.1),
            ),
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  freeDessert ? PngFiles.dessert : PngFiles.heartPulse,
                  height: 26,
                  width: 26,
                  color: freeDessert ? AppColors.maroon : AppColors.deepGreen,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    freeDessert ? 'Free dessert' : 'Diabetes Special',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color:
                          freeDessert ? AppColors.maroon : AppColors.deepGreen,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '\u{20B9} 200',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.bottomSheet(
                  const ItemBottomsheet(),
                  isScrollControlled: true,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: AppColors.green,
                        size: 24,
                      ),
                      Text(
                        'Add',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
