import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/landing/bloc/kitchen_bloc.dart';
import 'package:food_subs/landing/widgets/nearby_kitches.dart';

class LandingViewWidget extends StatelessWidget {
  const LandingViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KitchenBloc, KitchenState>(
      builder: (context, state) {
        if (state is KitchenLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is KitchenLoaded) {
          return Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.line_horizontal_3_decrease,
                          size: 20,
                        ),
                        Flexible(child: Text(' Popularity')),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey[300]!,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Arriving Next...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Handi Chaap Gravy + Daal tadka + Butter Naan + Jalebi',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    state.banner.body ?? '',
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey[300]!,
                  ),
                  color: AppColors.lightGreen,
                ),
                child: const Row(
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_shield_fill,
                      color: AppColors.green,
                    ),
                    Expanded(
                      child: Text(
                        ' 100% safe and best quality meals',
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
              ListView.builder(
                itemCount: state.kitchens.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) =>
                    NearbyKitchensView(kitchen: state.kitchens[i]),
              ),
            ],
          );
        } else if (state is KitchenError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
