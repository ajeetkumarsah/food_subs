import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/landing/widgets/landing_view.dart';
import 'package:food_subs/kitchen_details/kitchen_details_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            Flexible(
              child: Text(
                'Kolkata',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: const Text(
            '3 Subscriptions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: const [
          Icon(
            CupertinoIcons.search,
            color: Colors.white,
          ),
          Flexible(
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
        leadingWidth: 100,
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              color: AppColors.primary,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 145,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 6,
                          itemBuilder: (_, i) => Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 90,
                                width: 90,
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    i == 0
                                        ? 'https://www.vedantu.com/seo/content-images/0867b892-336b-456a-89e7-a6056614cc26.png'
                                        : i == 3
                                            ? 'https://static.vecteezy.com/system/resources/previews/011/474/680/non_2x/tree-heart-logo-design-love-nature-creative-logo-design-template-simple-green-leaf-and-heart-shape-symbol-free-vector.jpg'
                                            : i == 2
                                                ? 'https://vatans.com/wp-content/uploads/2024/01/unnamed-2024-01-02T114137.362.png'
                                                : 'https://media.istockphoto.com/id/1372205277/photo/traditional-indian-food-thali-served-in-plate-top-view.jpg?s=612x612&w=0&k=20&c=mufjX4i0bjmNB_9VSrbQ0zLOBH08FWZb5oFcOItclVc=',
                                    height: 88,
                                    width: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  i == 0
                                      ? 'All'
                                      : i == 2
                                          ? 'Pure Jain'
                                          : i == 3
                                              ? 'Healthy'
                                              : 'Navratra Thali',
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
                              if (i == 0)
                                Container(
                                  height: 2,
                                  width: 60,
                                  color: AppColors.primary,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const LandingViewWidget(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
