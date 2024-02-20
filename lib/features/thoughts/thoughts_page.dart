import 'package:auto_route/auto_route.dart';
import 'package:backfeed/common/data/providers/thought/local_thought_repository_provider.dart';
import 'package:backfeed/common/utils/change_statusbar_color.dart';
import 'package:backfeed/features/thoughts/widgets/thought_container.dart';
import 'package:backfeed/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ThoughtsPage extends ConsumerWidget {
  const ThoughtsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thoughtsAsync = ref.watch(thoughtsProvider);
    changeStatusBarColor(const Color(0xffEFEFEF));
    return Scaffold(
      body: Container(
        color: const Color(0xffEFEFEF),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 35,
            ),
            Wrap(
              
              direction: Axis.vertical,
              spacing: 8,
              children: thoughtsAsync.when(
                  data: (data) =>
                      data.map((e) => ThoughtContainer(thought: e)).toList(),
                  error: (_, __) => [const Text("Something went wrong")],
                  loading: () => [const Text("")]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.router.push(const ZenModeRoute()),
          label: const Text("Add")),
    );
  }
}
