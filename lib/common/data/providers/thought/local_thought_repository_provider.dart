import 'package:backfeed/common/data/entities/thought/thought.dart';
import 'package:backfeed/common/data/repositories/thought/local_thought_repository.dart';
import 'package:backfeed/common/data/repositories/thought/thought_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_thought_repository_provider.g.dart';

@riverpod
ThoughtRepository thoughtRepository(ThoughtRepositoryRef ref) =>
    LocalThoughtRepository();

@riverpod
Future<List<Thought>> thoughts(ThoughtsRef ref) {
  return ref.watch(thoughtRepositoryProvider).getAll();
}
