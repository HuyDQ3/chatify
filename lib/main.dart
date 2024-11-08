import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatify/utility/splash/spalsh.dart';
import 'package:chatify/utility/authentication/authentication.dart';
import 'package:chat_repository/chat_repository.dart' as chat_repository;

import 'utility/home/view/home_page.dart';
import 'utility/login/view/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final authentication_repository.AuthenticationRepository _authenticationRepository;
  late final user_repository.UserRepository _userRepository;
  late final chat_repository.ChatRepository _chatRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = authentication_repository.AuthenticationRepository();
    _userRepository = user_repository.UserRepository();
    _chatRepository = chat_repository.ChatRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    _chatRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // value: _authenticationRepository,
      providers: [
        RepositoryProvider<authentication_repository.AuthenticationRepository>.value(value: _authenticationRepository),
        RepositoryProvider<user_repository.UserRepository>.value(value: _userRepository),
        RepositoryProvider<chat_repository.ChatRepository>.value(value: _chatRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            )..add(AuthenticationSubscriptionRequested()),
          ),
        ],
        child: const MyAppView(),
      ),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case authentication_repository.AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case authentication_repository.AuthenticationStatus.unknown:
                break;
              case authentication_repository.AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (settings) {
        return SplashPage.route();
      },
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // TRY THIS: Try running your application with "flutter run". You'll see
    //     // the application has a blue toolbar. Then, without quitting the app,
    //     // try changing the seedColor in the colorScheme below to Colors.green
    //     // and then invoke "hot reload" (save your changes or press the "hot
    //     // reload" button in a Flutter-supported IDE, or press "r" if you used
    //     // the command line to start the app).
    //     //
    //     // Notice that the counter didn't reset back to zero; the application
    //     // state is not lost during the reload. To reset the state, use hot
    //     // restart instead.
    //     //
    //     // This works for code too, not just values: Most code changes can be
    //     // tested with just a hot reload.
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
