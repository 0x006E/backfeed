import 'package:backfeed/common/data/entities/thought/thought.dart';
import 'package:backfeed/common/data/repositories/thought/thought_repository.dart';
import 'package:hive/hive.dart';
import 'package:ulid4d/ulid4d.dart';

part 'local_thought_repository.g.dart';

@HiveType(typeId: 0)
class LocalThought extends HiveObject {
  LocalThought({required this.id, required this.content}) : super();

  @HiveField(0)
  final String id;

  @HiveField(1)
  final Map<String, dynamic> content;
}

class LocalThoughtRepository implements ThoughtRepository {
  final localThoughtBox = Hive.openBox<LocalThought>('local_thought');

  @override
  Future<void> add(Thought thought) async {
    final box = await localThoughtBox;
    final localThought =
        LocalThought(id: ULID.nextULID().toString(), content: thought.toJson());
    box.add(localThought);
  }

  @override
  Future<void> delete(ULID id) async {
    final box = await localThoughtBox;
    box.delete(id.toString());
  }

  @override
  Future<List<Thought>> getAll() async {
    final box = await localThoughtBox;
    return box.values.map((e) => Thought.fromJson(e.content)).toList();
  }

  @override
  Future<void> update(Thought thought) async {
    assert(thought.id != null, "Thought Id should not be null on update");
    final box = await localThoughtBox;
    final localThought =
        LocalThought(id: thought.id.toString(), content: thought.toJson());
    box.put(localThought.id, localThought);
  }
}
