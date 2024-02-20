import 'package:backfeed/common/data/entities/thought/thought.dart';
import 'package:ulid4d/ulid4d.dart';

/// Abstract class representing a repository for managing thoughts.
/// See [LocalThoughtRepository] for appdata
abstract class ThoughtRepository {
  /// Adds a new thought to the repository.
  ///
  /// Parameters:
  ///   - thought: The thought object to be added.
  ///
  /// Returns a Future that completes once the thought is added.
  Future<void> add(Thought thought);

  /// Deletes a thought from the repository by its unique identifier.
  ///
  /// Parameters:
  ///   - id: The unique identifier (ULID) of the thought to be deleted.
  ///
  /// Returns a Future that completes once the thought is deleted.
  Future<void> delete(ULID id);

  /// Updates an existing thought in the repository.
  ///
  /// Parameters:
  ///   - thought: The updated thought object.
  ///
  /// Returns a Future that completes once the thought is updated.
  Future<void> update(Thought thought);

  /// Retrieves all thoughts from the repository.
  ///
  /// Returns a Future that completes with a list of all thoughts.
  Future<List<Thought>> getAll();
}
