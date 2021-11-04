import 'package:flutter/material.dart';
import 'package:flutter_square_control_states/src/pages/home_page.dart';
import 'package:flutter_square_control_states/src/services_provider/animation_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => AnimationService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => const HomePage(),
        },
      ),
    );
  }
}
