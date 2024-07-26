/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Todo implements _i1.SerializableModel {
  Todo._({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Todo({
    int? id,
    required String title,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TodoImpl;

  factory Todo.fromJson(Map<String, dynamic> jsonSerialization) {
    return Todo(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String content;

  DateTime createdAt;

  DateTime updatedAt;

  Todo copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TodoImpl extends Todo {
  _TodoImpl({
    int? id,
    required String title,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          title: title,
          content: content,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Todo copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Todo(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
