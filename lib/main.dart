import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/main_cubit.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/repositories/api_impl.dart';
import 'package:offers/repositories/log.dart';
import 'package:offers/repositories/log_impl.dart';
import 'package:offers/routes.dart';
import 'package:offers/widgets/screens/list_offer/list_offer_screen.dart';

void main() {
  runApp(
    RepositoryProvider<Log>(
      create: (context) => LogImpl(),
      child: const Repository(),
    ),
  );
}

class Repository extends StatelessWidget {
  const Repository({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Api>(
      create: (context) => ApiImpl(context.read<Log>()),
      child: const Provider(),
    );
  }
}

class Provider extends StatelessWidget {
  const Provider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.primaryColor,
        ),
        onGenerateRoute: mainRoute,
        initialRoute: RouteList.home,
      ),
    );
  }
}
