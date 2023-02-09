import 'package:appsize/appsize.dart';
import 'package:catalog_app/product/cubit/product_cubit.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:catalog_app/ui/ui.dart';
import 'package:catalog_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_client/product_client.dart';

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
      create: (context) => ProductCubit(),
      child: _ProductView(product: product),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView({
    this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context)
      ..product = product;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: AppBar(
              title: Text(productCubit.product?.name ?? 'Producto'),
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
                    ProductImage(productCubit.product),
                    _ProductForm(productCubit.product),
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
          ),
        );
      },
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm(
    this.product,
  );

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    //   ..product = product;
    //   ..updateAvailability(value: product?.available ?? false);
    // final productUpdate = productCubit.product;

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
                  initialValue: product?.name,
                  onChanged: (value) => product?.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es inválido';
                    }
                    return null;
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'name',
                    labelText: 'Nombre: ',
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                TextFormField(
                  initialValue: (product?.price).toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'),
                    ),
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product?.price = 0;
                    } else {
                      product?.price = double.parse(value);
                    }
                  },
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
                  value: product?.available ?? false,
                  title: const Text('Disponible:'),
                  activeColor: myThemeLight.primaryColor,
                  onChanged: (value) => productCubit.updateAvailability(
                    value: value,
                  ),
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
