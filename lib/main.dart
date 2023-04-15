import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/downloads/downloads_bloc.dart';
import 'package:flutter_application_2/core/colors/colors.dart';
import 'package:flutter_application_2/presentation/main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'domain/core/di/injectable.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => getIt<DownloadsBloc>()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blue,
            backgroundColor: Colors.black,
            scaffoldBackgroundColor:backgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme:
                const TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white))),
        home:  ScreenMainPage(),
      ),
    );
  }
}
