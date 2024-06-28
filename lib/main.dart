import 'package:fluent_design_app/second_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(
        accentColor: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}