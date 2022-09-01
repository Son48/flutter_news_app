import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/theme_data.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider=ThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }
  void getCurrentAppTheme() async{
    themeProvider.setDarkTheme=await themeProvider.darkThemePreferences.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return themeProvider;
      }),
    ],
    child:
    Consumer<ThemeProvider>(builder: (context,themeProvider,ch){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog',
        theme: Style.themeData(themeProvider.getDarkTheme, context),
        home: const HomeScreen(),
        routes: {},
      );
    })
    );
  }
}
