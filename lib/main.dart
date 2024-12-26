import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'package:hotelsbooking/presentation/from_details_screen/bloc/from_details_bloc.dart';
import 'package:hotelsbooking/presentation/from_details_screen/models/from_details_model.dart';
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((value) {
    PrefUtils().init();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // return BlocProvider(
        //   create: (context) => ThemeBloc(
        //     ThemeState(
        //       themeType: PrefUtils().getThemeData(),
        //     ),
        //   ),
        //   child: BlocBuilder<ThemeBloc, ThemeState>(
        //     builder: (context, state) {
        //       return MaterialApp(
        //         theme: theme,
        //         title: 'hotelsbooking',
        //         navigatorKey: NavigatorService.navigatorKey,
        //         debugShowCheckedModeBanner: false,
        //         localizationsDelegates: [
        //           AppLocalizationDelegate(),
        //           GlobalMaterialLocalizations.delegate,
        //           GlobalWidgetsLocalizations.delegate,
        //           GlobalCupertinoLocalizations.delegate
        //         ],
        //         supportedLocales: [
        //           Locale(
        //             'en',
        //             '',
        //           )
        //         ],
        //         initialRoute: AppRoutes.initialRoute,
        //         routes: AppRoutes.routes,
        //       );
        //     },
        //   ),
        // );
        return MultiBlocProvider(
          providers: [
            // Provide your ThemeBloc globally (already there)
            BlocProvider(
              create: (context) => ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
            ),
            // Provide FromDetailsBloc globally (if needed across the app)
            BlocProvider<FromDetailsBloc>(
              create: (context) => FromDetailsBloc(FromDetailsState(
                fromDetailsModelObj: FromDetailsModel(),
              )),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return MaterialApp(
              theme: theme,
              title: 'hotelsbooking',
              navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: [Locale('en', '')],
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.routes,
            );
          }),
        );
      },
    );
  }
}
