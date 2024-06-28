import 'package:fluent_design_app/third_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: ScaffoldPage(
        header: const PageHeader(
          title: Text("This is Third Screen"),
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
        bottomBar: Padding(
          padding: const EdgeInsets.all(24.0),
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
                    m.MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}