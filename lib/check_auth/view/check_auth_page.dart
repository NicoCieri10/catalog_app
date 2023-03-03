import 'package:catalog_app/check_auth/cubit/check_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:product_repository/product_repository.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({super.key});

  static const name = 'auth';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckAuthCubit(
        productRepository: context.read<ProductRepository>(),
      ),
      child: const CheckAuthView(),
    );
  }
}

class CheckAuthView extends StatelessWidget {
  const CheckAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckAuthCubit>();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: cubit.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) const Text('Espere...');

            if (snapshot.data == '') {
              Future.microtask(() {
                context.pushReplacementNamed('login');
              });
            } else {
              Future.microtask(() {
                context.pushReplacementNamed('home');
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
