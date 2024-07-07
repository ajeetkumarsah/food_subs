import 'data/repo/kitchen_repo.dart';
import 'landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/data/api/api_client.dart';
import 'package:food_subs/landing/bloc/kitchen_bloc.dart';

void main() {
  final Repository repository = Repository(apiClient: ApiClient());
  runApp(MyApp(repo: repository));
}

class MyApp extends StatelessWidget {
  final Repository repo;
  const MyApp({super.key, required this.repo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<KitchenBloc>(
            create: (BuildContext context) =>
                KitchenBloc(ApiClient(), repository: repo)
                  ..add(FetchKitchens()),
          ),
        ],
        child: const LandingScreen(),
      ),
    );
  }
}
