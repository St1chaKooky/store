
import 'package:dio/dio.dart';
import 'package:fake_store/core/router/router.dart';
import 'package:fake_store/feature/product/data/service/product_repo_mocked.dart';
import 'package:fake_store/feature/product/domain/filter_category/filter_bloc.dart';
import 'package:fake_store/theme/themes/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio();
  dio.options.headers['Demo-Header'] = 'demo header';
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiRepositoryProvider(
    providers: [
      BlocProvider(create: (context)=> FilterBloc(repo: ProductRepoMocked()) )
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: themeData,
       routerConfig: router,
    );
  }
}

