import 'package:akilah/data/repositories/user_repository_impl.dart';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:akilah/presentation/journeys/auth/register.dart';
import 'package:akilah/presentation/journeys/main/home.dart';
import 'package:akilah/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/blocs/authentication/auth.dart';
import 'presentation/journeys/auth/login.dart';
import 'presentation/journeys/main/course/course_overview.dart';
import 'presentation/journeys/main/course/take_course.dart';
import 'package:pedantic/pedantic.dart';
import 'package:akilah/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  // runApp(AkilahApp());
  runApp(
    RepositoryProvider<UserRepository>(
      create: (context) => UserRepositoryImpl(dataSource: getIt.getItInstance()),
      child: BlocProvider<AuthenticationBloc>(
        create: (_){
          final userRepo = RepositoryProvider.of<UserRepository>(_);
          return AuthenticationBloc(userRepo)..add(AppStarted());
        },
        child: AkilahApp(),
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
      // home: CourseOverview(),
      onGenerateRoute: AkilahRouter.generateRoute,
    );
  }
}