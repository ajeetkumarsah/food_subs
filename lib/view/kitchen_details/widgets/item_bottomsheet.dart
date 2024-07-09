import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_subs/utils/png_files.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/view/widgets/custom_radio_button.dart';

class ItemBottomsheet extends StatelessWidget {
  const ItemBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white54,
              ),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.close_rounded,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Handi chaap curry + Dal +3 Roti/ Rice',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.green.withOpacity(.1),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        PngFiles.heartPulse,
                        height: 26,
                        width: 26,
                        color: AppColors.deepGreen,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Diabetes Special',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: AppColors.deepGreen,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
                ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -3, vertical: -3),
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'Choose any one',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.red,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      '*Required',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Roti',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '\u{20B9} 0',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    CustomRadioButton(
                      margin: const EdgeInsets.only(left: 12),
                      selected: true,
                      onTap: (v) {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Rice',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '\u{20B9} 0',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    CustomRadioButton(
                      margin: const EdgeInsets.only(left: 12),
                      selected: false,
                      onTap: (v) {},
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                ),
                ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -3, vertical: -3),
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'Add Desserts',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Suji halwa (50g)',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '\u{20B9} 50',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Checkbox(
                      value: true,
                      onChanged: (v) {},
                      activeColor: AppColors.green,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Dairy milk (1pcs)',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '\u{20B9} 20',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (v) {},
                      activeColor: AppColors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.black38,
                                ),
                              ),
                              Text(
                                '1',
                                style: GoogleFonts.ptSansCaption(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Add \u{20B9} 160',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
