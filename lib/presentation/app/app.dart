import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/app_bloc.dart';
import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';
import 'package:calendz_app/presentation/app/bloc/user_bloc.dart';
import 'package:calendz_app/theme/dark_theme.dart';
import 'package:calendz_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late AuthBloc _authBloc;
  late AppBloc _appBloc;
  late UserBloc _userBloc;
  GoRouter? _router;
  AppStatus? oldAppStatus;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
    _userBloc = UserBloc();
    _appBloc = AppBloc(authBloc: _authBloc)..add(UserLogInState());

    _router = _goRouter(_appBloc);
  }

  GoRouter _goRouter(AppBloc appBloc) {
    return GoRouter(
        refreshListenable: GoRouterRefreshStream(appBloc.stream),
        initialLocation: AppRoute.onbording.path,
        routes: AppRoute.getRoutes(),
        errorBuilder: (context, state) {
          return const Center(
            child: Text("404"),
          );
        },
        redirect: (state) {
          if (appBloc.state.status != oldAppStatus) {
            oldAppStatus = appBloc.state.status;

            final goingFromLogin = state.subloc == AppRoute.login.path;
            final goingFromRegister = state.subloc == AppRoute.signup.path;
            final goingFromHome = state.subloc == AppRoute.home.path;
            final goingFromSplashScreen =
                state.subloc == AppRoute.onbording.path;

            switch (appBloc.state.status) {
              case AppStatus.logout:
                if (!goingFromLogin) {
                  return state.namedLocation(AppRoute.login.name);
                } else if (!goingFromRegister) {
                  return state.namedLocation(AppRoute.signup.name);
                } else {
                  return state.namedLocation(AppRoute.login.name);
                }
              case AppStatus.login:
                if ((!goingFromHome && !goingFromRegister) || goingFromLogin) {
                  _userBloc.add(
                      UserFetchOne(id: appBloc.state.authUser!.uid ?? "0"));
                  return state.namedLocation(AppRoute.home.name,
                      params: {"index": "0"});
                } else {
                  return null;
                }

              default:
                return (!goingFromSplashScreen)
                    ? state.namedLocation(AppRoute.onbording.name)
                    : null;
            }
          } else {
            return null;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _authBloc,
        ),
        BlocProvider.value(
          value: _appBloc,
        ),
        BlocProvider.value(
          value: _userBloc,
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: _router!.routeInformationProvider,
        routeInformationParser: _router!.routeInformationParser,
        routerDelegate: _router!.routerDelegate,
        title: "Calendz App",
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
      ),
    );
  }
}
