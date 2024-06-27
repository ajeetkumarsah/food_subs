import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';

class KitchenDetailsScreen extends StatelessWidget {
  const KitchenDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            minVerticalPadding: 0,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
            title: Text(
              'Lunch Box',
              style: GoogleFonts.ptMono(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'North Indian, Punjabi, Continental',
              style: GoogleFonts.cabin(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Open',
                            style: GoogleFonts.cabin(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Text(
                            'Closes at 10pm',
                            style: GoogleFonts.cabin(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ],
                      ),
                      Text(
                        '1 km • Free delivery',
                        style: GoogleFonts.cabin(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Subscribe',
                        style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              topWidget(Icons.star_border),
              topWidget(Icons.dinner_dining_outlined, title: 'B/F, L, D'),
              topWidget(Icons.verified_user_outlined,
                  title: 'Best safety', subtitle: '(Read more)'),
              topWidget(Icons.people_alt_outlined, title: '200+ Subscribers'),
              topWidget(Icons.heart_broken_outlined, title: 'Healthy'),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (_, i) => i == 5
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: 110,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          color: AppColors.green,
                          strokeWidth: 1,
                          dashPattern: const [6, 4],
                          radius: const Radius.circular(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera_alt,
                                color: AppColors.green,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Add photo',
                                      style: GoogleFonts.cabin(
                                        color: AppColors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(
                                i == 0
                                    ? 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/6/12/3/FNM070116_Penne-with-Vodka-Sauce-and-Mini-Meatballs-recipe_s4x3.jpg.rend.hgtvcom.1280.1280.suffix/1465939620872.jpeg'
                                    : 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?resize=768,574',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (i == 0)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 110,
                            height: 110,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(.7),
                            ),
                            child: Center(
                              child: Text(
                                'See menu this week',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cabin(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        if (i == 4)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 110,
                            height: 110,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(.7),
                            ),
                            child: Center(
                              child: Text(
                                'View all (18)',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cabin(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topWidget(IconData? icon, {String? title, String? subtitle}) {
    return Column(
      children: [
        Icon(icon ?? Icons.star_border),
        Text(
          title ?? '4.5',
          style: GoogleFonts.cabin(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subtitle ?? '(94)',
          style: GoogleFonts.cabin(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
