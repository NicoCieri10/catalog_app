import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/home/home_cubit/home_cubit.dart';
import 'package:form_validation/loading/loading.dart';
import 'package:form_validation/product/product_page.dart';
import 'package:form_validation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
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
    BlocProvider.of<HomeCubit>(context).loadProducts();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == HomeStatus.attempting) return const LoadingPage();

        final products = state.products;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Productos'),
          ),
          body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => context.pushNamed(ProductPage.name),
              child: ProductCard(product: products[index]),
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
