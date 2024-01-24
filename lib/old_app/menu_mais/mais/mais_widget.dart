import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/modal/termos_de_uso_cad/termos_de_uso_cad_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'mais_model.dart';
export 'mais_model.dart';

class MaisWidget extends StatefulWidget {
  const MaisWidget({Key? key}) : super(key: key);

  @override
  _MaisWidgetState createState() => _MaisWidgetState();
}

class _MaisWidgetState extends State<MaisWidget> {
  late MaisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaisModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/padro_giants-1-removebg_1_(Traced).png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Menu mais',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Giantas Denton',
                                  fontSize: 20.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().UsrClass == '5') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Sinto muito!'),
                                      content: Text(
                                          'Para atualizar suas informações de Staff acesse o portal'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }

                              context.pushNamed(
                                'MeuPerfil',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 500),
                                  ),
                                },
                              );

                              setState(() {
                                FFAppState().PorcentagemCFG = 0.0;
                              });
                            },
                            child: ClipOval(
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: custom_widgets.HtmlImageCopyCopy(
                                    width: 50.0,
                                    height: 50.0,
                                    base64Image: valueOrDefault<String>(
                                      FFAppState().UsrPicture != null &&
                                              FFAppState().UsrPicture != ''
                                          ? FFAppState().UsrPicture
                                          : 'UklGRqoLAABXRUJQVlA4IJ4LAABQlACdASpYAlgCPlEokUajoqGhIxtYUHAKCWlu/CoZqMq+GbRkpLfROwPyr1mF6Nnb2U4lV7P6n+x81/5vW1/sPRP+FMLihR6Vvjy3Q2SLj/St8eW6GyRcf6Vvjy3Q2SLj/St8eW6GyRcf6Vvjy3Q2SLj/St8eW6GyRcf6Vvjy3Q2SLj/St8eW6GyRcf6VvjyucBXkiMjfHzy1wRMSqFHpW+PLdDZIuP6h/kSf//HK+VOGmbjhih0iQ+UjOIS/MiJiVQo9K3x5bobJD6SyMbLYDApHrG9h/ifai8+mVGHv2PSt8eW6GyRcfB3RroweH+lb5Q1/DlPsIv/pW+PLdDZIuP89kzxToW+PLdDYkx6+cgRMSqFHpW+PLZ6vdSHju1UMdh7ZYQeYmzZ56JaDgQcpn1f//BLTac45C6YTQXH+lb48t0NkXgNw1drwe4iFIz18FviGA0hofzIvFK8IcbWDErq9vSoIikIyBExKoUelb42nfboqBHx/ybKKInkIDx8uPdffHluhskXH+lbqd7qoRe0RZrQALj/PUG2lGu9FPeMeM2SLj/St8eVsGGnKoCTQz0rfHifpBKu9lYBPIb+AuP9K3x5bobIwvryeEw8+qb7QluRGyRcf56emype0L7laze8HK9DZIuP9K3x5bS2mv5Kdm11yWClUKPSsiYn5DiTLKKHAnotUKPSt8eW6GxVcCDhZRRvN5boaSUq+c9kRMSqFHpW+PLaGlV4f0kCJiVQo6y2fGBaFlSoUelb48t0Nkids8jjKhR6VvjyuLdf9/sETEqhR6Vvjy2kgtKz/St8eZJZt0TN3luhskXH+lb43fy1WqJrskXH+gTluV9ZaSZj0rfHluhskXHwQjUiRenI9qJiVQof97J9nSt8eW6GyRcf6Vuu+bMrkyLj/SsuzmCWRmPSt8eW6GyRcf5+OyZkUHRd5boRV7XhugZmJVCj0rfHluhskQUpPO7YmJVCNMnmb0YfGbJFx/pW+PLdDZIhWiu3sIRvAuPf69X6l1kAiYlUKPSt8eW6GyRaTpoCBNuffG7A3lNkMji4Bcf6Vvjy3Q2SLj/Swe9uM0nNPiIeU3R7ZQ2GIlUY9kCj0rfHluhskXH+lbsPFSTi4X2FcqAU7nZfkdjjgpStLwVz6l6km1Cj0rfHluhskXHwfKd9qF+p/QLTXN4CbIp8ufQ01MSqFHpW+PLdDTAJec5c3uaxXdQ5fi6BPgpujAQTZQA2eFQRMSqFHpW9+3LYffIhVPArk9jYJ5obLWTFTw3W3zlSgYwtZe/ZGSBdaE5GghmGEkVg7exONVqhR5+J4RX/wCQGJv0vvggYHyxVbTgaA8nK0cc6hx/wO5mQ3O5kvAMJ7PGwZOLxpIMD2WvJFmy/hnvEQqBGZ0TxovqNkYBoPji3Ig5bjut1I9H/06tXXdXeMelb421EXBx7T7qnMAuRb48t0NKVzIaJP6dzxIijlMpkNb9QSPiQbAeCH4eaHkKPSt8eI7AgzVX8mQ5LEAC4/0rfHlulLSLj/St78jB9/tDQB+tAAuP9K3x5bobJFx/pW66Nn0sTTuSOfY9K3x5bobJFx/pW+PLaRcjiAAP770YAAAAAFhV0hSP7TPzETz7MtelNXMS/6zcFnPb3QkdP0UfdU2tomnoGD8RJDn2npyRZnoX4mv6tFimPnful4POybvs5c9DiAVtW902so/7/jKitNEtklTG0FTh7+K/rlMnJEvkUdtl2xFKJCFgETAX6bn3XS4k+QbWJc1ZXMUx1PDP7bB1zKrMOogWJwGai9BJOg9gSg0RdrV2CQXqGcrUICNWsTvZjKVdGzSagUvoKh55nGQGJldMkufiPbrLp45QnnVGe2SemS1XzAYaVjG9tzi+sbVoFdoV3OcHq2D93pJ/urDggDSgwd1EPsuMX36oEdHodJcHZCLkD2JIui92X83O1xjw+WmFHJUMfMJ1CA26EGbTu7SvYXmcO2+L9AZhM9Nkkhb5koAMpaTPrfotJeF1ZahqXdQ2HQ+75oI/WW/paDB5kIbw2VEA9draSEWGbCHablhLfJWtCT3TYPwoIlfn3RftLZfQsyY9Xee2wM0kxgq0aSOmKA9wfI6D5kGtWyAtKQ3iGpKPnWLYJlHsN8WFQqibW2EVpHHzEXANsxWEe4j41H2G3dMf9ACnF02m30McZG4TUhv3artJlXJs34ShlLnpvWSv3qqJZnlzxO01ky2wKRPAHv3BwZo+ETd3EPK54J/cHvgQb7B73SJbsbHgtQlPy/avhQJ42UGvsgh4YaBKwgORCYV0XgbSQh1KmrDqGv26oHA18P6v1ZtOJARtunTadGM/RJtBNPt4+WJy1KxwKjsIoTcVKHdv0wYrT7SjxU0riRwVFJjDbKH5kf0MCtteCArv3es0emQKSaYxoX2UMP1/twt171rMA3/9A+VR2MHidBcLjdF5MHbTfl4AkFpw8wERkWLIkEmr1FBkCTsZqVo+FyziNqX7bY1P5ad5Msx5LM/K9q3eAcdoaUJTdWH9ANQMA4HtbjmCtdkDXBcgSy0ClJF+z/frTJyGC16is7OEtuAtQD6Y1eKMzbO8jmdOFYpz0KaTfZeg8Qu2jUuNVc5dfRiSoLRChYDz+51Hl29y18rtZpjANt60VcosmIdoluUBdY2QUXp26a7DtY2zhcSvIYHGkjZTe/wPIKdmO3zRz+KUay5uNwVK7ALHhvt6aVH/uztg4aewO4NNe0/81WBFzYQVni1klaB9f6oRpWIe8PgBKYkK0iJgZqaK0oeFVMXzm2fkmM9jY6e1McY6H1uNdzXIsDrbe2WY78nxWmWflcHACKy73YLmeKoB8qMGbabM1svtm/j+8If0rK3oJB8c6YWYrGlyvvJRRuTwIGWPFoEMVEhcLdkUa2LtYjLscADI5UaWvarFGJKMynNqelfQOMUkfj0YjN+4gVFk8Vpu0FuKzFlZI5Ah9gU3vjXkx+6nuZykK/n+Vte4JnFLAvHCKvE42KMUFU4K2Qikyh39W2dprzEW1C7jESfBy/747jp4nUQc6NUXrzGAGf5h5/DJqvAfFNATRhfPSy/DJTiTmxtYdFgIK4pYS0/38TQWHddGWFy15wibWZLOOOOGVOPRpFPtmkLnxTHgD337STkdtJpY16Scb9v9EGL8LwAzJqAkgGK3R0dhsmDWvIpaqEeaswcwkwHTPz99ESVAtkhA3xPAuHzIAgfw9WVoT52L6GiWDvbIqQikWz6sqTsXjXNe1//GE/R8zXvGu2biaHDJx6XvBvjeWbz7nyc1sBtseL5P1QaotuR3SeRe7DY7c/w9t50UNo0h4yuBSF2aEmqD5ABRvu522yNYH5hlcEzc8aTPsiACuyQAaWVV6fjVOXTXCeyE8AV8FgKehkpjVYvFrb6bmu5x3bT37R8FyXeOfln6Eu4LAaHA81dykZHOWIFACVQMPGH6XLeBOcNzE+CCLInblsk5BlZQub8HFggjeEw5aZkGrzswADauYcXDlfCWsSCcsuJcmCzqwExQLCmjA+eU6vXd4qXaY/BzFuf/p+m9J0ae2iz+fx+OmHxO4AEpSsM47fFx7/8mCVviHag2uWkV922RwFS25hqukT1BO4kJoXee10D266jFztEQYoEIRJwtWq+QnN9Nd8YiUQYV/uPuGvi/8qZ3uGMO1kEhPAlo75wnNSiXCyaIkrlwU5wkMk54uv3vXTD3ZtQ6K3/tPaTvZiC8n7/vYPj/XDITmfdJfk2vk7YePzq6CQEJDIXmEONilmE6yBY1cufexkEBwH2ZY9qCoT2HUQT/aXCG0X3mPeXABLzdtvmIBZYE3Ex8zUBsxFE6SgEJwAuZ/BDsK1giBVSd8dKXfs6OC6T6gJiAPIAoaATcKNgVu+hH859mfiJngswoNlRgQ6ZreSxFeMIG3wQ+PRXoplWpf+II3gu6onyrhy0Ubd25G7BuDzcxdBi1SxCAAA',
                                      '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',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (true == false)
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SelecionarNotificacao',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                Icons.notifications_active,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Notificações',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Share.share(
                                        'https://play.google.com/store/apps/details?id=br.com.involve.giants',
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                Icons.compare_arrows_rounded,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Compartilhar aplicativo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().UsrClass != '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('EventosParticipados');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                Icons.event_available_rounded,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Eventos participados',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (true == false)
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'messages',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.whatsapp,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Menssagens diretas!',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().UsrClass != '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'privacidadeDados',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.userLock,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Privacidade de dados',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: TermosDeUsoCadWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2B2B2B),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.shieldAlt,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Política de privacidade',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().UsrClass != '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'AlterarSenha',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.key,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Troca de senha',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().UsrClass != '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'AlteraEmail',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.mailBulk,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Troca de E-mail',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().UsrClass == '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      _model.retornoScanQrCode =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        'Cancel', // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.QR,
                                      );

                                      _shouldSetState = true;
                                      _model.confirmapresenca =
                                          await ConfirmaPresencaCall.call(
                                        eventoId: functions
                                            .qRcodeList(
                                                _model.retornoScanQrCode)
                                            ?.first,
                                        pesId: functions.qRcodeList(
                                            _model.retornoScanQrCode)?[1],
                                        evenOuImer: functions
                                            .qRcodeList(
                                                _model.retornoScanQrCode)
                                            ?.last,
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                        (_model.confirmapresenca?.jsonBody ??
                                            ''),
                                        r'''$.status''',
                                      )) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(getJsonField(
                                                (_model.confirmapresenca
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Ops!'),
                                              content: Text(getJsonField(
                                                (_model.confirmapresenca
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                Icons.qr_code,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Confirmar presença do membro',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().UsrClass == '5')
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Entregaveis',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2B2B2B),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.gifts,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Entregáveis',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().EmailDeSessao = '';
                                      FFAppState().SenhaSessao = '';
                                      FFAppState().UsrEmail = '';
                                      FFAppState().UsrNome = '';
                                      FFAppState().UsrPicture = '';
                                      FFAppState().UsrClass = '';
                                      FFAppState().usrID = '';
                                      FFAppState().PorcentagemCFG = 0.0;
                                    });

                                    context.goNamed(
                                      'TelaLogin',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2B2B2B),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.signOutAlt,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Sair',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Desenvolvimento');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2B2B2B),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              Icons.logo_dev,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'DEV',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
