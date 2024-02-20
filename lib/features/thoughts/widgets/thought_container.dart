import 'package:auto_route/auto_route.dart';
import 'package:backfeed/common/data/entities/thought/thought.dart';
import 'package:backfeed/router/app_router.dart';
import 'package:flutter/material.dart';

class ThoughtContainer extends StatelessWidget {
  const ThoughtContainer({
    required this.thought,
    super.key,
  });

  final Thought thought;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(const ZenModeRoute()),
      child: Hero(
        tag: thought.id.toString(),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          constraints: const BoxConstraints(minHeight: 150),
          child: Text(
            thought.thought,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
