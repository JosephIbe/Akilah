import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';

import 'presentation/blocs/authentication/authentication_bloc.dart';
import 'presentation/journeys/main/home.dart';
import 'presentation/blocs/authentication/auth.dart';
import 'presentation/blocs/user/user.dart';
import 'presentation/journeys/auth/login.dart';

import 'package:akilah/utils/router.dart';

import 'package:pedantic/pedantic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:akilah/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) =>
    runApp(
      RepositoryProvider<UserRepository>(
              create: (context) => UserRepositoryImpl(dataSource: getIt.getItInstance()),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AuthenticationBloc>(
                    create: (_){
                      final userRepo = RepositoryProvider.of<UserRepository>(_);
                      return AuthenticationBloc(userRepo)..add(AppStarted());
                    },
                  ),
                  BlocProvider<UserBloc>(
                    create: (_){
                      final userRepo = RepositoryProvider.of<UserRepository>(_);
                      return UserBloc(userRepo)..add(GetUserProfileDetails());
                    },
                  ),
                ],
                child: AkilahApp(),
              )
          )
    )
  );

}

class AkilahApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akilah',
      theme: ThemeData(
        primaryColor: Color(0xffffc226),
        accentColor: Colors.blueAccent[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          // print(state);
          if(state is AuthenticationStateAuthenticated) {
            return Home();
          }
          return LoginPage();
        }
      ),
      onGenerateRoute: AkilahRouter.generateRoute,
    );
  }
}