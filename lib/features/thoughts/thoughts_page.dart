import 'package:auto_route/auto_route.dart';
import 'package:backfeed/common/utils/change_statusbar_color.dart';
import 'package:backfeed/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThoughtsPage extends StatefulWidget {
  const ThoughtsPage({super.key});

  @override
  State<ThoughtsPage> createState() => _ThoughtsPageState();
}

class _ThoughtsPageState extends State<ThoughtsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(Color(0xffEFEFEF));
    return Container(
      color: Color(0xffEFEFEF),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 35,
        ),
        GestureDetector(
          onTap: () => context.router.push(const ZenModeRoute()),
          child: Hero(
            tag: 'note1',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              constraints: const BoxConstraints(minHeight: 150),
              child: const Text(
                "Ajay has lost focus.",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
