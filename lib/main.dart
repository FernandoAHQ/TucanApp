import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tucan_app/providers/articlesData.dart';
import 'package:tucan_app/providers/locationsData.dart';
import 'package:tucan_app/providers/userData.dart';
import 'package:tucan_app/utils/route_generator.dart';
import 'config/palette.dart';
import 'package:flutter/services.dart';


void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderUserData>( create: (context) => ProviderUserData()),
        ChangeNotifierProvider<ProviderArticles>( create: (context) => ProviderArticles()),
        ChangeNotifierProvider<ProviderLocations>( create: (context) => ProviderLocations()),
     
      ],
      child: MaterialApp(
        title: 'TucanApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Palette.scaffold
        ),
        
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
