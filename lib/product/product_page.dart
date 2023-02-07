import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/home/home_cubit/home_cubit.dart';
import 'package:form_validation/ui/ui.dart';
import 'package:form_validation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(
    this.product, {
    super.key,
  });

  static const name = 'product';

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        productRepository: context.read<ProductRepository>(),
      ),
      child: ProductView(product: product),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ProductImage(
                      product: product,
                    ),
                    Positioned(
                      top: 60.sp,
                      left: 20.sp,
                      child: IconButton(
                        onPressed: context.pop,
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.sp,
                      right: 20.sp,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const _ProductForm(),
                SizedBox(
                  height: 100.sp,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.save_outlined,
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'name',
                    labelText: 'Nombre: ',
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: r'$111.11',
                    labelText: 'Precio: ',
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                SwitchListTile.adaptive(
                  value: true,
                  title: const Text('Disponible'),
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 30.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.sp),
          bottomLeft: Radius.circular(25.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      );
}
