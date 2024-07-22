import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository<T> {
  Future<String> create(T item, String userId);
  Future<T?> read(String id);
  Future<void> update(String id, T item);
  Future<void> delete(String id);
  Stream<List<T>> getAll();
}
