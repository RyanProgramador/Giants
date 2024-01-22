// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PalestrasFavoritadasStruct extends BaseStruct {
  PalestrasFavoritadasStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static PalestrasFavoritadasStruct fromMap(Map<String, dynamic> data) =>
      PalestrasFavoritadasStruct(
        id: data['id'] as String?,
      );

  static PalestrasFavoritadasStruct? maybeFromMap(dynamic data) => data is Map
      ? PalestrasFavoritadasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static PalestrasFavoritadasStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PalestrasFavoritadasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PalestrasFavoritadasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PalestrasFavoritadasStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

PalestrasFavoritadasStruct createPalestrasFavoritadasStruct({
  String? id,
}) =>
    PalestrasFavoritadasStruct(
      id: id,
    );
