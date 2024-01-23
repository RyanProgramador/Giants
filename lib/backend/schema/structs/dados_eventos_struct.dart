// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DadosEventosStruct extends BaseStruct {
  DadosEventosStruct({
    bool? status,
    List<String>? dados,
    List<String>? data,
  })  : _status = status,
        _dados = dados,
        _data = data;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;
  bool hasStatus() => _status != null;

  // "dados" field.
  List<String>? _dados;
  List<String> get dados => _dados ?? const [];
  set dados(List<String>? val) => _dados = val;
  void updateDados(Function(List<String>) updateFn) => updateFn(_dados ??= []);
  bool hasDados() => _dados != null;

  // "data" field.
  List<String>? _data;
  List<String> get data => _data ?? const [];
  set data(List<String>? val) => _data = val;
  void updateData(Function(List<String>) updateFn) => updateFn(_data ??= []);
  bool hasData() => _data != null;

  static DadosEventosStruct fromMap(Map<String, dynamic> data) =>
      DadosEventosStruct(
        status: data['status'] as bool?,
        dados: getDataList(data['dados']),
        data: getDataList(data['data']),
      );

  static DadosEventosStruct? maybeFromMap(dynamic data) => data is Map
      ? DadosEventosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'dados': _dados,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'dados': serializeParam(
          _dados,
          ParamType.String,
          true,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static DadosEventosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DadosEventosStruct(
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        dados: deserializeParam<String>(
          data['dados'],
          ParamType.String,
          true,
        ),
        data: deserializeParam<String>(
          data['data'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DadosEventosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DadosEventosStruct &&
        status == other.status &&
        listEquality.equals(dados, other.dados) &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([status, dados, data]);
}

DadosEventosStruct createDadosEventosStruct({
  bool? status,
}) =>
    DadosEventosStruct(
      status: status,
    );
