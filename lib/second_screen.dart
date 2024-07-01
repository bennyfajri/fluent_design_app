import 'package:fluent_design_app/third_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: ScaffoldPage(
        header: const PageHeader(
          title: Text("This is Second Screen"),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Item ${index + 1}"),
              );
            },
          ),
        ),
        bottomBar: Consumer(
          builder: (context, ref, child) {
            bool isNavigationMode = ref.watch(isNavigationModeProvider);
            return isNavigationMode
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          child: const Text('Back'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FilledButton(
                          child: const Text('Next Screen'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              FluentPageRoute(
                                builder: (context) => const ThirdScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
