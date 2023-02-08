import 'package:catalog_app/home/home_cubit/home_cubit.dart';
import 'package:catalog_app/loading/loading.dart';
import 'package:catalog_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        productRepository: context.read<ProductRepository>(),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context)..loadProducts();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == HomeStatus.attempting) return const LoadingPage();

        final products = state.products;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Productos'),
          ),
          body: RefreshIndicator(
            color: Colors.blue[800],
            onRefresh: homeCubit.loadProducts,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      'product',
                      extra: <String, Product>{
                        'product': products[index].copy(),
                      },
                    );
                  },
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
