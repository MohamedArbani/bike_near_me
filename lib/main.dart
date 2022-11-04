
import 'package:bike_near_me_app/src/pages/home_page.dart';
import 'package:bike_near_me_app/src/pages/locationBikePage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'src/pages/onBoarding.dart';
import 'src/utils/animations.dart';
import 'src/utils/theme.dart';
import 'src/utils/util.dart';
import 'src/utils/widgets.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();

  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  static final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 260.ms,
          duration: 480.ms,
          begin: Offset(0, 0),
          end: Offset(1, 1),
        ),
      ],
      initialState: AnimationState(scale: 0),
      finalState: AnimationState(scale: 1),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 340.ms,
          duration: 440.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 340.ms,
          duration: 380.ms,
          begin: 0,
          end: 1,
        ),
      ],
      initialState: AnimationState(opacity: 0),
      finalState: AnimationState(opacity: 1),
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 420.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
        ),
      ],
      initialState: AnimationState(opacity: 0),
      finalState: AnimationState(opacity: 1),
    ),
  };
  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bike Me App',
      home: MyHome(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        /* '/': (context) => const MainPage(), */
        // When navigating to the "/home" route, build the SecondScreen widget.
        '/home': (context) => const HomePage(),
        '/onBoard': (context) => const OnBoardingWidget(),
        '/locate' : (context) => const LocateBikePageWidget(),
      },
    ));
  }
}

class MyHome extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = _MainPageState.animationsMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0EFF79), Color(0xFF53FDE9)],
            stops: [0, 1],
            begin: AlignmentDirectional(-0.92, -1),
            end: AlignmentDirectional(0.92, 1),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(0, 0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/dash-logo.svg',
                  width: 202,
                  height: 172,
                  fit: BoxFit.fitHeight,
                ).animated([animationsMap['imageOnPageLoadAnimation']!]),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.92),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () /* async */ {
                      /* context.pushNamed(
                        'OnBoarding',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                          ),
                        },
                      ); */
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/onBoard');
                      print("pass to on board");
                    },
                    text: 'Get Started',
                    options: FFButtonOptions(
                      width: 350,
                      height: 70,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF3D003E),
                                fontSize: 21,
                                fontWeight: FontWeight.normal,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 35,
                    ),
                  ).animated([animationsMap['buttonOnPageLoadAnimation']!]),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Text(
                          'Already have an account?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF3D003E),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            /* context.pushNamed(
                              'LoginPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 500),
                                ),
                              },
                            );
                           */
                          },
                          text: 'Log in',
                          options: FFButtonOptions(
                            width: 69,
                            height: 40,
                            color: Colors.transparent,
                            elevation: 0,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF3D003E),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation']!]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
