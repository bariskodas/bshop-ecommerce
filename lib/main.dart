import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'riverpod/riverpods.dart';
import 'utils/constants.dart';
import 'views/base_view/base_view.dart';
import 'views/splash/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await Hive.openBox("cartList");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(getProductsRiverpod).getProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testcase app',
      debugShowCheckedModeBanner: false,
scaffoldMessengerKey: Constants.scaffoldKey,
      home: ref.watch(getProductsRiverpod).isLoad
          ? const Splash()
          : const BaseView(),
      theme: ThemeData(
          primaryColor: Constants.orangeColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
              color: Colors.white12,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: GoogleFonts.poppins(
                color: Constants.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              foregroundColor: Constants.blackColor,
              iconTheme: IconThemeData(color: Constants.blackColor))),
    );
  }
}
