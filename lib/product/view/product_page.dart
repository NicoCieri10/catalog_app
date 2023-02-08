import 'package:appsize/appsize.dart';
import 'package:catalog_app/home/cubit/home_cubit.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:catalog_app/ui/ui.dart';
import 'package:catalog_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(
            title: Text(product?.name ?? 'Producto'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 25.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  ProductImage(
                    product: product,
                  ),
                  const _ProductForm(),
                  SizedBox(
                    height: 100.sp,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.all(10.sp),
            child: FloatingActionButton(
              child: const Icon(
                Icons.save_outlined,
              ),
              onPressed: () {},
            ),
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
                  activeColor: myThemeLight.primaryColor,
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
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      );
}
