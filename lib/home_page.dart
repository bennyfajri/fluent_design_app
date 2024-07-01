import 'package:fluent_design_app/second_screen.dart';
import 'package:fluent_design_app/third_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'first_screen.dart';
import 'home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);
    final isNavigationMode = ref.watch(isNavigationModeProvider);

    return NavigationView(
      appBar: NavigationAppBar(
        title: Row(
          children: [
            const Text("Fluent Design App"),
            const SizedBox(width: 24),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Consumer(builder: (context, ref, child) {
                    final checked = ref.watch(isNavigationModeProvider);
                    return ToggleSwitch(
                      checked: checked,
                      onChanged: (value) {
                        ref
                            .read(isNavigationModeProvider.notifier)
                            .update((state) => state = !state);
                      },
                    );
                  }),
                  const Text("Navigation Mode"),
                ],
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      // i want that navigation pane is enable or disable from isNavigationMode provider
      pane:isNavigationMode ? NavigationPane(
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.page),
            body: const FirstScreen(),
            title: const Text("First Screen"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.custom_list),
            body: const SecondScreen(),
            title: const Text("Second Screen"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.contact),
            body: const ThirdScreen(),
            title: const Text("Third Screen"),
          ),
        ],
        selected: index,
        onChanged: (value) {
          ref.read(indexProvider.notifier).update((state) => state = value);
        },
      ) : null,
      content: isNavigationMode ? null : const FirstScreen(),
    );
  }
}
