import 'package:appsize/appsize.dart';
import 'package:catalog_app/product/cubit/product_cubit.dart';
import 'package:catalog_app/product/widgets/widgets.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:catalog_app/ui/ui.dart';
import 'package:catalog_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      create: (context) => ProductCubit(
        productRepository: context.read<ProductRepository>(),
        product: product,
      ),
      child: const ProductView(),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const ProductAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                const ProductImage(),
                const ProductForm(),
                SizedBox(height: 100.sp),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(10.sp),
          child: FloatingActionButton(
            onPressed: () async {
              final isValidForm = cubit.state.formKey.currentState?.validate();
              if (!(isValidForm ?? false)) return;
              await cubit.editProduct();
            },
            child: const Icon(
              Icons.save_outlined,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: cubit.state.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  children: [
                    SizedBox(height: 10.sp),
                    TextFormField(
                      initialValue: state.product.name,
                      onChanged: (value) => cubit.updateProduct(name: value),
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
                    SizedBox(height: 30.sp),
                    TextFormField(
                      initialValue: (state.product.price).toString(),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'),
                        ),
                      ],
                      onChanged: (value) {
                        if (double.tryParse(value) == null) {
                          state.product.price = 0;
                        } else {
                          state.product.price = double.parse(value);
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: r'$111.11',
                        labelText: 'Precio: ',
                      ),
                    ),
                    SizedBox(height: 30.sp),
                    SwitchListTile.adaptive(
                      value: state.product.available,
                      title: const Text('Disponible:'),
                      activeColor: myThemeLight.primaryColor,
                      onChanged: (value) => cubit.updateAvailability(),
                    ),
                    SizedBox(height: 30.sp),
                  ],
                ),
              );
            },
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
