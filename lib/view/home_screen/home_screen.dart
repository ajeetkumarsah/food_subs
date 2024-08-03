import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/view/home_screen/widgets/category_widget.dart';
import 'package:food_subs/view/landing/bloc/kitchen_bloc.dart';
import 'package:food_subs/view/landing/widgets/landing_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: BlocBuilder<KitchenBloc, KitchenState>(
        builder: (context, state) {
          if (state is KitchenLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is KitchenLoaded) {
            return Column(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 145,
                              child: BlocBuilder<KitchenBloc, KitchenState>(
                                builder: (context, state) {
                                  if (state is KitchenLoaded) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: state.topKitchens.length,
                                      itemBuilder: (context, index) {
                                        return TopKitchenCard(
                                          kitchen: state.topKitchens[index],
                                        );
                                      },
                                    );
                                  } else if (state is KitchenError) {
                                    return Center(
                                        child: Text('Error: ${state.message}'));
                                  } else {
                                    return const Center(
                                        child: Text('Unknown state'));
                                  }
                                },
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
            );
          } else if (state is KitchenError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
