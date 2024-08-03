import 'package:food_subs/view/auth/bloc/auth_bloc.dart';
import 'package:food_subs/view/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repo/kitchen_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/data/api/api_client.dart';
import 'package:food_subs/view/landing/bloc/kitchen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final ApiClient apiClient=ApiClient();
  final Repository repository =
      Repository(apiClient:apiClient, prefs: prefs);

  runApp(MyApp(repo: repository));
}

class MyApp extends StatelessWidget {
  final Repository repo;
  const MyApp({super.key, required this.repo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KitchenBloc>(
          create: (BuildContext context) =>
              KitchenBloc(ApiClient(), repository: repo)..add(FetchKitchens()),
        ),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(repository: repo)),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        home: SplashScreen(userId: repo.getUserId()),
      ),
    );
  }
}
