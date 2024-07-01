import 'package:fluent_design_app/home_provider.dart';
import 'package:fluent_design_app/second_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: ScaffoldPage(
        header: const PageHeader(
          title: Text("This is First Screen"),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    child: const Text('Normal Button'),
                    onPressed: () {},
                  ),
                  m.TextButton(
                    child: const Text('Text Button'),
                    onPressed: () {
                      print('pressed text button');
                    },
                  ),
                  FilledButton(
                    child: const Text('Filled Button'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomBar: Consumer(
          builder: (context, ref, child) {
            bool isNavigationMode = ref.watch(isNavigationModeProvider);
            return isNavigationMode ? const SizedBox.shrink() :  Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    child: const Text('Next Screen'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        FluentPageRoute(
                          builder: (context) => const SecondScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}