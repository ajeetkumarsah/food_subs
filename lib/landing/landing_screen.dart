import 'bloc/kitchen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/data/models/kitchen_model.dart';
import 'package:food_subs/landing/widgets/landing_view.dart';
import 'package:food_subs/data/models/top_kitchen_model.dart';

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
                                            kitchen: state.topKitchens[index]);
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
    // return Scaffold(
    //   backgroundColor: Colors.white,

    // );
  }
}

class KitchenCard extends StatelessWidget {
  final KitchenModel kitchen;

  const KitchenCard({super.key, required this.kitchen});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(kitchen.avatar ?? '',
            width: 50, height: 50, fit: BoxFit.cover),
        title: Text(kitchen.name ?? ''),
        subtitle: Text(kitchen.address ?? ''),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}

class TopKitchenCard extends StatelessWidget {
  final TopKitchenModel kitchen;
  const TopKitchenCard({super.key, required this.kitchen});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
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
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              kitchen.image ?? '',
              height: 88,
              width: 88,
              fit: BoxFit.cover,
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
