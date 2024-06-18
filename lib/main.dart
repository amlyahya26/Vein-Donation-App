import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/cubit.dart';
import 'package:donation_app/modules/splash/splash_screen.dart';
import 'package:donation_app/shared/cubit/bloc_observer.dart';
import 'package:donation_app/shared/cubit/cubit.dart';
import 'package:donation_app/shared/cubit/states.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyDy5sDwpe9PffCaGjILGTuXXH3h3hjyoH0",
    //   appId: "1:219228861745:web:504ae9efae5ef345c62c10",
    //   messagingSenderId: "219228861745",
    //   projectId: "student-attendance-73d01",
    // ),
  );
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  int themeId = await CacheHelper.getData(key: 'theme')?? 0;

  BlocOverrides.runZoned(
        () async{
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('ar', 'EG'),
            Locale('en', 'US'),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          child: MyApp(themeId: themeId),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  int themeId;
  MyApp({Key? key, required this.themeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext contextBuild) => AppCubit()..startAppSetup(context, themeId),
        ),
        BlocProvider(
          create: (BuildContext contextBuild) => SignUpCubit(),
        ),
        BlocProvider(
          create: (BuildContext contextBuild) => AdminLayoutCubit()..getAllUsers()..getAcceptedRequestData(),
        ),
        BlocProvider(
          create: (BuildContext contextBuild) => UserLayoutCubit()..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext contextBuild) => DonorLayoutCubit()..getDonorData()..getAllUsers()..getMyRequests(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppCubit.get(context).themeData,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

