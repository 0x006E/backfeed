import 'package:auto_route/auto_route.dart';
import 'package:backfeed/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThoughtsPage extends StatelessWidget {
  const ThoughtsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        GestureDetector(
          onTap: () => context.router.push(const ZenModeRoute()),
          child: Hero(
            tag: 'note1',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFFCFCFE),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(99, 99, 99, 0.4),
                      offset: Offset(0, 2),
                      blurRadius: 8,
                      spreadRadius: 0,
                    )
                  ]),
              constraints: const BoxConstraints(minHeight: 150),
              child: const Text(
                "Ajay has lost focus.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
