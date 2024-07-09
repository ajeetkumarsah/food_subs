import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_subs/data/models/kitchen_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:food_subs/view/kitchen_details/kitchen_details_screen.dart';

class NearbyKitchensView extends StatefulWidget {
  final KitchenModel kitchen;
  const NearbyKitchensView({super.key, required this.kitchen});

  @override
  State<NearbyKitchensView> createState() => _NearbyKitchensViewState();
}

class _NearbyKitchensViewState extends State<NearbyKitchensView> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  int _activeIndex = 0;
  void onChangePage(int value) {
    _activeIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: controller.initialPage,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: .1,
                onPageChanged: (v, _) => onChangePage(v),
                scrollDirection: Axis.horizontal,
              ),
              items: widget.kitchen.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () => Get.to(const KitchenDetailsScreen()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(.6),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Veg_symbol.svg/1200px-Veg_symbol.svg.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 12,
              right: 12,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: widget.kitchen.images.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12.0,
                    dotHeight: 4.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                  ),
                  onDotClicked: (index) {},
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: Text(
            widget.kitchen.name ?? '',
            style: GoogleFonts.ptSansCaption(
              // color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.checkmark_shield,
                color: AppColors.green,
              ),
              Flexible(
                child: Text(
                  'best safety',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.star_fill,
                color: Colors.black,
                size: 20,
              ),
              Flexible(
                child: Text(
                  ' ${widget.kitchen.rating} (${widget.kitchen.totalRating})',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ptSansCaption(
                    // color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              dotWidget(),
              const Flexible(
                child: Text(
                  'Open',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              dotWidget(),
              const Expanded(
                child: Text(
                  'Closes at 10pm',
                  style: TextStyle(
                    // color: ,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  'North India, Continental, Punjabi',
                  style: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            const Flexible(
              child: Text(
                '1.5 km',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            dotWidget(),
            const Flexible(
              child: Text(
                'Free Delivery',
                style: TextStyle(
                  // color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            dotWidget(),
            const Icon(
              Icons.people_alt_outlined,
              color: Colors.deepPurpleAccent,
              size: 20,
            ),
            const Expanded(
              child: Text(
                ' 20+ Subscribers',
                style: TextStyle(
                  // color: ,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget dotWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 4,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
