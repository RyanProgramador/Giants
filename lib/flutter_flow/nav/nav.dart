import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    'assets/images/Prancheta_4_cpia@4x.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : entryPage ?? TelaLoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.black,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Prancheta_4_cpia@4x.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : entryPage ?? TelaLoginWidget(),
        ),
        FFRoute(
          name: 'TelaLogin',
          path: '/telaLogin',
          builder: (context, params) => TelaLoginWidget(),
        ),
        FFRoute(
          name: 'EsqueciSenha',
          path: '/esqueciSenha',
          builder: (context, params) => EsqueciSenhaWidget(),
        ),
        FFRoute(
          name: 'CadastroUsuarios',
          path: '/cadastroUsuarios',
          builder: (context, params) => CadastroUsuariosWidget(),
        ),
        FFRoute(
          name: 'Defoult',
          path: '/defoult',
          builder: (context, params) => DefoultWidget(),
        ),
        FFRoute(
          name: 'Palestras',
          path: '/palestras',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Palestras')
              : PalestrasWidget(),
        ),
        FFRoute(
          name: 'Eventos',
          path: '/eventos',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Eventos')
              : EventosWidget(),
        ),
        FFRoute(
          name: 'Mais',
          path: '/mais',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Mais') : MaisWidget(),
        ),
        FFRoute(
          name: 'Inicio',
          path: '/inicio',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Inicio')
              : InicioWidget(),
        ),
        FFRoute(
          name: 'Menu',
          path: '/menu',
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: 'EventosMes',
          path: '/eventosMes',
          builder: (context, params) => EventosMesWidget(),
        ),
        FFRoute(
          name: 'EventosInscrito',
          path: '/eventosInscrito',
          builder: (context, params) => EventosInscritoWidget(),
        ),
        FFRoute(
          name: 'AlteraEmail',
          path: '/alteraEmail',
          builder: (context, params) => AlteraEmailWidget(),
        ),
        FFRoute(
          name: 'PalestrasPesquisaNome',
          path: '/palestrasPesquisaNome',
          builder: (context, params) => PalestrasPesquisaNomeWidget(),
        ),
        FFRoute(
          name: 'AreaGiants',
          path: '/areaGiants',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'AreaGiants')
              : AreaGiantsWidget(),
        ),
        FFRoute(
          name: 'EventoPesquisaNome',
          path: '/eventoPesquisaNome',
          builder: (context, params) => EventoPesquisaNomeWidget(),
        ),
        FFRoute(
          name: 'EventosParticipados',
          path: '/eventosParticipados',
          builder: (context, params) => EventosParticipadosWidget(),
        ),
        FFRoute(
          name: 'MeuPerfil',
          path: '/meuPerfil',
          builder: (context, params) => MeuPerfilWidget(),
        ),
        FFRoute(
          name: 'SelecionarNotificacao',
          path: '/selecionarNotificacao',
          builder: (context, params) => SelecionarNotificacaoWidget(),
        ),
        FFRoute(
          name: 'AlterarSenha',
          path: '/alterarSenha',
          builder: (context, params) => AlterarSenhaWidget(),
        ),
        FFRoute(
          name: 'Entregaveis',
          path: '/entregaveis',
          builder: (context, params) => EntregaveisWidget(),
        ),
        FFRoute(
          name: 'ImersoesPesquisaNome',
          path: '/imersoesPesquisaNome',
          builder: (context, params) => ImersoesPesquisaNomeWidget(),
        ),
        FFRoute(
          name: 'Imersoes',
          path: '/imersoes',
          builder: (context, params) => ImersoesWidget(),
        ),
        FFRoute(
          name: 'ImersoesInscrito',
          path: '/imersoesInscrito',
          builder: (context, params) => ImersoesInscritoWidget(),
        ),
        FFRoute(
          name: 'privacidadeDados',
          path: '/privacidadeDados',
          builder: (context, params) => PrivacidadeDadosWidget(),
        ),
        FFRoute(
          name: 'messages',
          path: '/messages',
          builder: (context, params) => MessagesWidget(),
        ),
        FFRoute(
          name: 'Desenvolvimento',
          path: '/desenvolvimento',
          builder: (context, params) => DesenvolvimentoWidget(),
        ),
        FFRoute(
          name: 'GiantsFotos',
          path: '/giantsFotos',
          builder: (context, params) => GiantsFotosWidget(
            pesId: params.getParam('pesId', ParamType.String),
            pesNome: params.getParam('pesNome', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
