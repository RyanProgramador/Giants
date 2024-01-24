import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? senha = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "login",
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusLogin(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? nomeLogin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
  static String? emailLogin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? pictureLogin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.picture''',
      ));
  static int? classificacaoLogin(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.classificacao''',
      ));
  static String? msgLogin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? iDLogin(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class EsqueciSenhaCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "esqueci_a_senha",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EsqueciSenha',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? msgEsqueciSenha(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static bool? statusEsqueciSenha(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CadastroUsuariosCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? nome = '',
    String? senha = '',
    String? celular = '',
    String? cpf = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "cadastro_de_usuario",
  "email": "${email}",
  "senha": "${senha}",
  "nome": "${nome}",
  "celular": "${celular}",
  "cpf": "${cpf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CadastroUsuarios',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusCadastroUsr(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? mensagemCadastroUsr(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ListarEventosCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "listar_eventos",
  "pes_id": "${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListarEventos',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusListarEventos(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? dadosListarEventos(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List<String>? dataListarEvento(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic? dadosJsonDestaqueUM(dynamic response) => getJsonField(
        response,
        r'''$.dados[?(@.destaque == 1)]''',
      );
  static dynamic? dadosJsonDestaqueDOIS(dynamic response) => getJsonField(
        response,
        r'''$.dados[?(@.destaque == 2)]''',
      );
  static List<String>? dadosDescricaoUm(dynamic response) => (getJsonField(
        response,
        r'''$.dados[?(@.destaque == 1)].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dadosDescricaoDois(dynamic response) => (getJsonField(
        response,
        r'''$.dados[?(@.destaque == 2)].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ListPlaylistCall {
  static Future<ApiCallResponse> call({
    String? listId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ListPlaylist',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=${listId}&key=AIzaSyCzfdwxPY8IToIjpWBKT1JURI5jpwocjkA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? titulosPlaylist(dynamic response) => (getJsonField(
        response,
        r'''$.items..snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imagensPlaylist(dynamic response) => (getJsonField(
        response,
        r'''$.items..snippet.thumbnails.high.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic itemsPlaylist(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
}

class PorcentagemCFGCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "tipo": "apk_verifica_porcentagem_cfg"

}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'PorcentagemCFG',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic porcentagemCFG(dynamic response) => getJsonField(
        response,
        r'''$.porcentagem''',
      );
  static dynamic statusPorcentagemCFG(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class ListaEventosMesCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "tipo": "apk_listar_mes_eventos"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListaEventosMes',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? eventoMes(dynamic response) => getJsonField(
        response,
        r'''$.eventos_por_mes''',
        true,
      ) as List?;
  static bool? eventoMesStatus(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? eventoMesResultados(dynamic response) => getJsonField(
        response,
        r'''$.eventos_por_mes[:][1]''',
        true,
      ) as List?;
  static List<String>? eventoMesMes(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesDescricao(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesDataInicio(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].data_inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesLocal(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].local''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesBanner(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].banner''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesSobre(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].sobre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventoMesEndereco(dynamic response) => (getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].endereco''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? eventoMesDataFim(dynamic response) => getJsonField(
        response,
        r'''$.eventos_por_mes[:][1][0].data_fim''',
        true,
      ) as List?;
}

class CadastraEventoPessoaCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
    String? eventId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_cadastro_evento",
  "pes_id": "${pesId}",
  "event_id": "${eventId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CadastraEventoPessoa',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusCadastroEventoPes(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class ListaEventosInscritosCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
  }) async {
    final ffApiRequestBody = '''
{
    "tipo": "apk_lista_eventos_inscritos",
    "pes_id":"${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListaEventosInscritos',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static List? dadosListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List? descricaoListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].descricao''',
        true,
      ) as List?;
  static List? dataListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].data''',
        true,
      ) as List?;
  static List? localListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].local''',
        true,
      ) as List?;
  static List? bannerListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].banner''',
        true,
      ) as List?;
  static List? sobreListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].sobre''',
        true,
      ) as List?;
  static List? enderecoListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].endereco''',
        true,
      ) as List?;
  static List? dataFimListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].dataFim''',
        true,
      ) as List?;
  static List? idListaEventosInscritos(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].id''',
        true,
      ) as List?;
}

class RedefinirSenhaCall {
  static Future<ApiCallResponse> call({
    String? emailAtual = '',
    String? novoEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_alteracao_email",
  "email": "${emailAtual}",
  "emailNovo": "${novoEmail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RedefinirSenha',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusRetornoRedefinirSenha(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic mensagemRetornoRedefinirSenha(dynamic response) =>
      getJsonField(
        response,
        r'''$.message''',
      );
}

class PesquisaPalestrasCall {
  static Future<ApiCallResponse> call({
    String? termoPesquisa = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_pesquisa_palestra_nome",
  "termo_pesquisa": "${termoPesquisa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PesquisaPalestras',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? tituloPalestraPesquisa(dynamic response) =>
      (getJsonField(
        response,
        r'''$..snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imagemPalestraPesquisa(dynamic response) =>
      (getJsonField(
        response,
        r'''$..snippet.thumbnails.high.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? itemPalestraPesquisa(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      ) as List?;
}

class ListaPalestrasBancoDeDadosCall {
  static Future<ApiCallResponse> call({
    String? categoriaId = '',
    String? termoPesquisa = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_lista_palestra",
  "categoria": "${categoriaId}",
  "termo_pesquisa": "${termoPesquisa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListaPalestrasBancoDeDados',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? dthrListaPalestraBD(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].dthr_palestra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeListaPalestraBD(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? dadosListaPalestraBD(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List<String>? linkListaPalestraBD(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imgListaPalestraBD(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].img''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static bool? statusListaPalestraBD(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? descricaoListaPalestraBD(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].descricao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? idDaPAlestraBD(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].id_palestra''',
        true,
      ) as List?;
}

class PesquisaEventoCall {
  static Future<ApiCallResponse> call({
    String? termoPesquisa = '',
    String? pesId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_pesquisa_evento_nome",
  "termo_pesquisa": "${termoPesquisa}",
  "pes_id": "${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PesquisaEvento',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? statusPesquisaEventoNome(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static dynamic dadosPesquisaEventoNome(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class OQueFaltaCadastrarCall {
  static Future<ApiCallResponse> call({
    int? pesId,
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_o_que_falta_cadastrar",
  "pes_id": ${pesId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'oQueFaltaCadastrar',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? numeroBermudaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_numero_bermuda''',
      ));
  static String? numeroSandaliaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_numero_sandalia''',
      ));
  static String? numeroCalcadoOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_numero_calcado''',
      ));
  static String? tamanhoCamisaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_tamanho_camisa''',
      ));
  static dynamic socioResponsavelOQFaltaCad(dynamic response) => getJsonField(
        response,
        r'''$.pes_socio_responsavel_aceite_evento''',
      );
  static String? deficienciaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_deficiencia''',
      ));
  static String? instagramOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_instagram''',
      ));
  static int? tempoRedeSocialOQFaltaCad(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.pes_tempo_rede_social''',
      ));
  static String? nomeContatoEmergenciaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_nome_contato_emergencia''',
      ));
  static String? contatoEmergenciaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_contato_emergencia''',
      ));
  static String? chocolatePreferidoOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_chocolate_preferido''',
      ));
  static String? fotoOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_foto''',
      ));
  static int? deficienteOQFaltaCad(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.pes_deficiente''',
      ));
  static String? rgOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_rg''',
      ));
  static String? nomeCrachaOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_nome_cracha''',
      ));
  static String? nomeCertificadoOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_nome_certificado''',
      ));
  static String? nascimentoOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_nascimento''',
      ));
  static String? emailOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_email''',
      ));
  static String? telefoneOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_telefone''',
      ));
  static String? nomeOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_nome''',
      ));
  static bool? statusOQFaltaCad(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? linkedinOQFaltaCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.pes_linkedin''',
      ));
}

class InserirOQueFaltaNoCadastroCall {
  static Future<ApiCallResponse> call({
    String? pesNome = '',
    String? pesTelefone = '',
    String? pesEmail = '',
    String? pesNascimento = '',
    String? pesNomeCertificado = '',
    String? pesNomeCracha = '',
    String? pesRg = '',
    String? pesDeficiente = '',
    String? pesFoto = '',
    String? pesChocolatePreferido = '',
    String? pesContatoEmergencia = '',
    String? pesNomeContatoEmergencia = '',
    String? pesTempoRedeSocial = '',
    String? pesInstagram = '',
    String? pesDeficiencia = '',
    String? pesTamanhoCamisa = '',
    String? pesNumeroCalcado = '',
    String? pesNumeroSandalia = '',
    String? pesNumeroBermuda = '',
    String? pesId = '',
    String? pesLinkedin = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_inserir_o_que_falta_cadastrar",
  "pes_nome": "${pesNome}",
  "pes_telefone": "${pesTelefone}",
  "pes_nascimento": "${pesNascimento}",
  "pes_nome_certificado": "${pesNomeCertificado}",
  "pes_nome_cracha": "${pesNomeCracha}",
  "pes_rg": "${pesRg}",
  "pes_deficiente": "${pesDeficiente}",
  "pes_chocolate_preferido": "${pesChocolatePreferido}",
  "pes_contato_emergencia": "${pesContatoEmergencia}",
  "pes_nome_contato_emergencia": "${pesNomeContatoEmergencia}",
  "pes_tempo_rede_social": "${pesTempoRedeSocial}",
  "pes_instagram": "${pesInstagram}",
  "pes_linkedin": "${pesLinkedin}",
  "pes_deficiencia": "${pesDeficiencia}",
  "pes_tamanho_camisa": "${pesTamanhoCamisa}",
  "pes_numero_calcado": "${pesNumeroCalcado}",
  "pes_numero_sandalia": "${pesNumeroSandalia}",
  "pes_numero_bermuda": "${pesNumeroBermuda}",
  "pes_id": "${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Inserir o que falta no cadastro',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AlterarSenhaCall {
  static Future<ApiCallResponse> call({
    String? senhaAtual = '',
    String? senhaNova = '',
    String? pesId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_alterar_senha",
  "senha_atual": "${senhaAtual}",
  "senha_nova": "${senhaNova}",
  "pes_id": "${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AlterarSenha',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusAlterarSenha(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic msgAlterarSenha(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class TrocarFotoPerfilCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
    String? imagem = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_alterar_imagem",
  "pes_id": "${pesId}",
  "img_base_64": "${imagem}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Trocar foto perfil',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListarEventosParticipadosCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_eventos_participados",
  "pes_id": "${pesId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Listar eventos participados',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusEvenParticipado(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static List? dadosEvenParticipado(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
}

class ConfirmaPresencaCall {
  static Future<ApiCallResponse> call({
    String? eventoId = '',
    String? pesId = '',
    String? evenOuImer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_confirma_presenca",
  "pes_id": "${pesId}",
  "evento_id": "${eventoId}",
  "even_ou_imer": "${evenOuImer}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConfirmaPresenca',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EntregaveisPorPessoaListaCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
    String? evenId = '',
    String? evenOuImer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_entregaveis_por_pessoa",
  "pes_id": "${pesId}",
  "even_id": "${evenId}",
  "even_ou_imer": "${evenOuImer}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Entregaveis Por pessoa Lista',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusEntregaveisLista(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? dadosEntregaveisLista(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List<int>? dadosEntreID(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].entre_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? dadosEntreNome(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].entre_nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? dadosEvenID(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].even_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ConfiurmaEntregaveisPorPessoasCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
    String? evenId = '',
    String? entregavelId = '',
    String? evenOuImer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_confirma_entrega",
  "pes_id": "${pesId}",
  "entregavel_id": "${entregavelId}",
  "even_id": "${evenId}",
  "even_ou_imer": "${evenOuImer}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Confiurma Entregaveis por pessoas',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? statusEntregaEntregaveis(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageEntregaEntregaveis(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? confirmadosEntregaEntregaveis(dynamic response) => getJsonField(
        response,
        r'''$.entregaveis_confirmados''',
        true,
      ) as List?;
  static List? naoConfirmadorsEntregaEntregaveis(dynamic response) =>
      getJsonField(
        response,
        r'''$.entregaveis_nao_confirmados''',
        true,
      ) as List?;
}

class ListarGIANTSCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "tipo": "apk_listar_GIANTS"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Listar GIANTS',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? instagramListaGiants(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].instagram''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empresaListaGiants(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].emrpesa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fotoPrincipalListaGiants(dynamic response) =>
      (getJsonField(
        response,
        r'''$.dados[:].foto_principal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? whatsappListaGiants(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].zap''',
        true,
      ) as List?;
  static List<int>? pesidListaGiants(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].pes_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeListaGiants(dynamic response) => (getJsonField(
        response,
        r'''$.dados[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static bool? statusListaGiants(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? dadosListaGiants(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
}

class ListarFotosGIANTSCall {
  static Future<ApiCallResponse> call({
    String? pesIdPesquisa = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_listar_fotos_GIANTS",
  "pes_id_pesquisa": "${pesIdPesquisa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listarFotosGIANTS',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusFotosGIANTS(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static List? dadosFotosGIANTS(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List? pesFotoFotosGIANTS(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].pes_foto''',
        true,
      ) as List?;
}

class ListarMembrosPresentesEmEventosOuImersoesCall {
  static Future<ApiCallResponse> call({
    String? idEventoOuImer = '',
    String? evenOuImer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_listar_membros_em_eventos",
  "id": "${idEventoOuImer}",
  "even_ou_imer": "${evenOuImer}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListarMembrosPresentesEmEventosOuImersoes',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? dadosListarMembrosPresentes(dynamic response) => getJsonField(
        response,
        r'''$.dados''',
        true,
      ) as List?;
  static List? nomeListarMembrosPresentes(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].nome_pessoa''',
        true,
      ) as List?;
  static List? presenteListarMembrosPresentes(dynamic response) => getJsonField(
        response,
        r'''$.dados[:].presente''',
        true,
      ) as List?;
  static dynamic statusListarMembrosPresentes(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class AtualizaPrivacidadeDeDadosCall {
  static Future<ApiCallResponse> call({
    String? pesId = '',
    bool? insta,
    bool? linkedin,
    bool? zap,
    bool? fotos,
  }) async {
    final ffApiRequestBody = '''
{
  "tipo": "apk_atualiza_compartilhamento",
  "pes_id": "${pesId}",
  "instagram": ${insta},
  "linkedin": ${linkedin},
  "fotos": ${fotos},
"whatsapp": ${zap}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizaPrivacidadeDeDados',
      apiUrl:
          'https://dev.conceittosistemas.com.br/scriptcase/app/GiantsRBI/ws_flutterflow/index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
