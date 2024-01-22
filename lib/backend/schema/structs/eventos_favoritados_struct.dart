// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventosFavoritadosStruct extends BaseStruct {
  EventosFavoritadosStruct({
    String? eventoImersID,
    String? eventoOuImersao,
  })  : _eventoImersID = eventoImersID,
        _eventoOuImersao = eventoOuImersao;

  // "eventoImersID" field.
  String? _eventoImersID;
  String get eventoImersID => _eventoImersID ?? '';
  set eventoImersID(String? val) => _eventoImersID = val;
  bool hasEventoImersID() => _eventoImersID != null;

  // "eventoOuImersao" field.
  String? _eventoOuImersao;
  String get eventoOuImersao => _eventoOuImersao ?? '';
  set eventoOuImersao(String? val) => _eventoOuImersao = val;
  bool hasEventoOuImersao() => _eventoOuImersao != null;

  static EventosFavoritadosStruct fromMap(Map<String, dynamic> data) =>
      EventosFavoritadosStruct(
        eventoImersID: data['eventoImersID'] as String?,
        eventoOuImersao: data['eventoOuImersao'] as String?,
      );

  static EventosFavoritadosStruct? maybeFromMap(dynamic data) => data is Map
      ? EventosFavoritadosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'eventoImersID': _eventoImersID,
        'eventoOuImersao': _eventoOuImersao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eventoImersID': serializeParam(
          _eventoImersID,
          ParamType.String,
        ),
        'eventoOuImersao': serializeParam(
          _eventoOuImersao,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventosFavoritadosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EventosFavoritadosStruct(
        eventoImersID: deserializeParam(
          data['eventoImersID'],
          ParamType.String,
          false,
        ),
        eventoOuImersao: deserializeParam(
          data['eventoOuImersao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventosFavoritadosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventosFavoritadosStruct &&
        eventoImersID == other.eventoImersID &&
        eventoOuImersao == other.eventoOuImersao;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([eventoImersID, eventoOuImersao]);
}

EventosFavoritadosStruct createEventosFavoritadosStruct({
  String? eventoImersID,
  String? eventoOuImersao,
}) =>
    EventosFavoritadosStruct(
      eventoImersID: eventoImersID,
      eventoOuImersao: eventoOuImersao,
    );
