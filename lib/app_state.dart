import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _UsrEmail = prefs.getString('ff_UsrEmail') ?? _UsrEmail;
    });
    _safeInit(() {
      _UsrNome = prefs.getString('ff_UsrNome') ?? _UsrNome;
    });
    _safeInit(() {
      _UsrPicture = prefs.getString('ff_UsrPicture') ?? _UsrPicture;
    });
    _safeInit(() {
      _UsrClass = prefs.getString('ff_UsrClass') ?? _UsrClass;
    });
    _safeInit(() {
      _coutryPickerCelularCadastro =
          prefs.getString('ff_coutryPickerCelularCadastro') ??
              _coutryPickerCelularCadastro;
    });
    _safeInit(() {
      _CadTermosDeUso = prefs.getBool('ff_CadTermosDeUso') ?? _CadTermosDeUso;
    });
    _safeInit(() {
      _diaDoUltimoAcesso = prefs.containsKey('ff_diaDoUltimoAcesso')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_diaDoUltimoAcesso')!)
          : _diaDoUltimoAcesso;
    });
    _safeInit(() {
      _EmailDeSessao = prefs.getString('ff_EmailDeSessao') ?? _EmailDeSessao;
    });
    _safeInit(() {
      _SenhaSessao = prefs.getString('ff_SenhaSessao') ?? _SenhaSessao;
    });
    _safeInit(() {
      _dataEventosLista =
          prefs.getStringList('ff_dataEventosLista') ?? _dataEventosLista;
    });
    _safeInit(() {
      _usrID = prefs.getString('ff_usrID') ?? _usrID;
    });
    _safeInit(() {
      _EventosFavoritos = prefs
              .getStringList('ff_EventosFavoritos')
              ?.map((x) {
                try {
                  return EventosFavoritadosStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _EventosFavoritos;
    });
    _safeInit(() {
      _PalestrasFavoritas = prefs
              .getStringList('ff_PalestrasFavoritas')
              ?.map((x) {
                try {
                  return PalestrasFavoritadasStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _PalestrasFavoritas;
    });
    _safeInit(() {
      _visualizouVideo =
          prefs.getBool('ff_visualizouVideo') ?? _visualizouVideo;
    });
    _safeInit(() {
      _eventosLitados = prefs.getStringList('ff_eventosLitados')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _eventosLitados;
    });
    _safeInit(() {
      _eventosListadosDestaqueDois =
          prefs.getStringList('ff_eventosListadosDestaqueDois')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _eventosListadosDestaqueDois;
    });
    _safeInit(() {
      _pesLogin = prefs.getString('ff_pesLogin') ?? _pesLogin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _UsrEmail = '';
  String get UsrEmail => _UsrEmail;
  set UsrEmail(String _value) {
    _UsrEmail = _value;
    prefs.setString('ff_UsrEmail', _value);
  }

  String _UsrNome = '';
  String get UsrNome => _UsrNome;
  set UsrNome(String _value) {
    _UsrNome = _value;
    prefs.setString('ff_UsrNome', _value);
  }

  String _UsrPicture = '';
  String get UsrPicture => _UsrPicture;
  set UsrPicture(String _value) {
    _UsrPicture = _value;
    prefs.setString('ff_UsrPicture', _value);
  }

  String _UsrClass = '';
  String get UsrClass => _UsrClass;
  set UsrClass(String _value) {
    _UsrClass = _value;
    prefs.setString('ff_UsrClass', _value);
  }

  String _coutryPickerCelularCadastro = '+55';
  String get coutryPickerCelularCadastro => _coutryPickerCelularCadastro;
  set coutryPickerCelularCadastro(String _value) {
    _coutryPickerCelularCadastro = _value;
    prefs.setString('ff_coutryPickerCelularCadastro', _value);
  }

  bool _CadTermosDeUso = false;
  bool get CadTermosDeUso => _CadTermosDeUso;
  set CadTermosDeUso(bool _value) {
    _CadTermosDeUso = _value;
    prefs.setBool('ff_CadTermosDeUso', _value);
  }

  DateTime? _diaDoUltimoAcesso;
  DateTime? get diaDoUltimoAcesso => _diaDoUltimoAcesso;
  set diaDoUltimoAcesso(DateTime? _value) {
    _diaDoUltimoAcesso = _value;
    _value != null
        ? prefs.setInt('ff_diaDoUltimoAcesso', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_diaDoUltimoAcesso');
  }

  String _EmailDeSessao = '';
  String get EmailDeSessao => _EmailDeSessao;
  set EmailDeSessao(String _value) {
    _EmailDeSessao = _value;
    prefs.setString('ff_EmailDeSessao', _value);
  }

  String _SenhaSessao = '';
  String get SenhaSessao => _SenhaSessao;
  set SenhaSessao(String _value) {
    _SenhaSessao = _value;
    prefs.setString('ff_SenhaSessao', _value);
  }

  List<String> _dataEventosLista = [];
  List<String> get dataEventosLista => _dataEventosLista;
  set dataEventosLista(List<String> _value) {
    _dataEventosLista = _value;
    prefs.setStringList('ff_dataEventosLista', _value);
  }

  void addToDataEventosLista(String _value) {
    _dataEventosLista.add(_value);
    prefs.setStringList('ff_dataEventosLista', _dataEventosLista);
  }

  void removeFromDataEventosLista(String _value) {
    _dataEventosLista.remove(_value);
    prefs.setStringList('ff_dataEventosLista', _dataEventosLista);
  }

  void removeAtIndexFromDataEventosLista(int _index) {
    _dataEventosLista.removeAt(_index);
    prefs.setStringList('ff_dataEventosLista', _dataEventosLista);
  }

  void updateDataEventosListaAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _dataEventosLista[_index] = updateFn(_dataEventosLista[_index]);
    prefs.setStringList('ff_dataEventosLista', _dataEventosLista);
  }

  void insertAtIndexInDataEventosLista(int _index, String _value) {
    _dataEventosLista.insert(_index, _value);
    prefs.setStringList('ff_dataEventosLista', _dataEventosLista);
  }

  double _PorcentagemCFG = 0.0;
  double get PorcentagemCFG => _PorcentagemCFG;
  set PorcentagemCFG(double _value) {
    _PorcentagemCFG = _value;
  }

  String _usrID = '';
  String get usrID => _usrID;
  set usrID(String _value) {
    _usrID = _value;
    prefs.setString('ff_usrID', _value);
  }

  String _base64lmage = '';
  String get base64lmage => _base64lmage;
  set base64lmage(String _value) {
    _base64lmage = _value;
  }

  List<EventosFavoritadosStruct> _EventosFavoritos = [
    EventosFavoritadosStruct.fromSerializableMap(
        jsonDecode('{\"eventoImersID\":\"1\",\"eventoOuImersao\":\"evento\"}'))
  ];
  List<EventosFavoritadosStruct> get EventosFavoritos => _EventosFavoritos;
  set EventosFavoritos(List<EventosFavoritadosStruct> _value) {
    _EventosFavoritos = _value;
    prefs.setStringList(
        'ff_EventosFavoritos', _value.map((x) => x.serialize()).toList());
  }

  void addToEventosFavoritos(EventosFavoritadosStruct _value) {
    _EventosFavoritos.add(_value);
    prefs.setStringList('ff_EventosFavoritos',
        _EventosFavoritos.map((x) => x.serialize()).toList());
  }

  void removeFromEventosFavoritos(EventosFavoritadosStruct _value) {
    _EventosFavoritos.remove(_value);
    prefs.setStringList('ff_EventosFavoritos',
        _EventosFavoritos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromEventosFavoritos(int _index) {
    _EventosFavoritos.removeAt(_index);
    prefs.setStringList('ff_EventosFavoritos',
        _EventosFavoritos.map((x) => x.serialize()).toList());
  }

  void updateEventosFavoritosAtIndex(
    int _index,
    EventosFavoritadosStruct Function(EventosFavoritadosStruct) updateFn,
  ) {
    _EventosFavoritos[_index] = updateFn(_EventosFavoritos[_index]);
    prefs.setStringList('ff_EventosFavoritos',
        _EventosFavoritos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInEventosFavoritos(
      int _index, EventosFavoritadosStruct _value) {
    _EventosFavoritos.insert(_index, _value);
    prefs.setStringList('ff_EventosFavoritos',
        _EventosFavoritos.map((x) => x.serialize()).toList());
  }

  List<PalestrasFavoritadasStruct> _PalestrasFavoritas = [];
  List<PalestrasFavoritadasStruct> get PalestrasFavoritas =>
      _PalestrasFavoritas;
  set PalestrasFavoritas(List<PalestrasFavoritadasStruct> _value) {
    _PalestrasFavoritas = _value;
    prefs.setStringList(
        'ff_PalestrasFavoritas', _value.map((x) => x.serialize()).toList());
  }

  void addToPalestrasFavoritas(PalestrasFavoritadasStruct _value) {
    _PalestrasFavoritas.add(_value);
    prefs.setStringList('ff_PalestrasFavoritas',
        _PalestrasFavoritas.map((x) => x.serialize()).toList());
  }

  void removeFromPalestrasFavoritas(PalestrasFavoritadasStruct _value) {
    _PalestrasFavoritas.remove(_value);
    prefs.setStringList('ff_PalestrasFavoritas',
        _PalestrasFavoritas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPalestrasFavoritas(int _index) {
    _PalestrasFavoritas.removeAt(_index);
    prefs.setStringList('ff_PalestrasFavoritas',
        _PalestrasFavoritas.map((x) => x.serialize()).toList());
  }

  void updatePalestrasFavoritasAtIndex(
    int _index,
    PalestrasFavoritadasStruct Function(PalestrasFavoritadasStruct) updateFn,
  ) {
    _PalestrasFavoritas[_index] = updateFn(_PalestrasFavoritas[_index]);
    prefs.setStringList('ff_PalestrasFavoritas',
        _PalestrasFavoritas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPalestrasFavoritas(
      int _index, PalestrasFavoritadasStruct _value) {
    _PalestrasFavoritas.insert(_index, _value);
    prefs.setStringList('ff_PalestrasFavoritas',
        _PalestrasFavoritas.map((x) => x.serialize()).toList());
  }

  bool _visualizouVideo = false;
  bool get visualizouVideo => _visualizouVideo;
  set visualizouVideo(bool _value) {
    _visualizouVideo = _value;
    prefs.setBool('ff_visualizouVideo', _value);
  }

  List<dynamic> _eventosLitados = [];
  List<dynamic> get eventosLitados => _eventosLitados;
  set eventosLitados(List<dynamic> _value) {
    _eventosLitados = _value;
    prefs.setStringList(
        'ff_eventosLitados', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToEventosLitados(dynamic _value) {
    _eventosLitados.add(_value);
    prefs.setStringList('ff_eventosLitados',
        _eventosLitados.map((x) => jsonEncode(x)).toList());
  }

  void removeFromEventosLitados(dynamic _value) {
    _eventosLitados.remove(_value);
    prefs.setStringList('ff_eventosLitados',
        _eventosLitados.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromEventosLitados(int _index) {
    _eventosLitados.removeAt(_index);
    prefs.setStringList('ff_eventosLitados',
        _eventosLitados.map((x) => jsonEncode(x)).toList());
  }

  void updateEventosLitadosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _eventosLitados[_index] = updateFn(_eventosLitados[_index]);
    prefs.setStringList('ff_eventosLitados',
        _eventosLitados.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInEventosLitados(int _index, dynamic _value) {
    _eventosLitados.insert(_index, _value);
    prefs.setStringList('ff_eventosLitados',
        _eventosLitados.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _eventosListadosDestaqueDois = [];
  List<dynamic> get eventosListadosDestaqueDois => _eventosListadosDestaqueDois;
  set eventosListadosDestaqueDois(List<dynamic> _value) {
    _eventosListadosDestaqueDois = _value;
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _value.map((x) => jsonEncode(x)).toList());
  }

  void addToEventosListadosDestaqueDois(dynamic _value) {
    _eventosListadosDestaqueDois.add(_value);
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _eventosListadosDestaqueDois.map((x) => jsonEncode(x)).toList());
  }

  void removeFromEventosListadosDestaqueDois(dynamic _value) {
    _eventosListadosDestaqueDois.remove(_value);
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _eventosListadosDestaqueDois.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromEventosListadosDestaqueDois(int _index) {
    _eventosListadosDestaqueDois.removeAt(_index);
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _eventosListadosDestaqueDois.map((x) => jsonEncode(x)).toList());
  }

  void updateEventosListadosDestaqueDoisAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _eventosListadosDestaqueDois[_index] =
        updateFn(_eventosListadosDestaqueDois[_index]);
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _eventosListadosDestaqueDois.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInEventosListadosDestaqueDois(int _index, dynamic _value) {
    _eventosListadosDestaqueDois.insert(_index, _value);
    prefs.setStringList('ff_eventosListadosDestaqueDois',
        _eventosListadosDestaqueDois.map((x) => jsonEncode(x)).toList());
  }

  String _pesLogin = '';
  String get pesLogin => _pesLogin;
  set pesLogin(String _value) {
    _pesLogin = _value;
    prefs.setString('ff_pesLogin', _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
