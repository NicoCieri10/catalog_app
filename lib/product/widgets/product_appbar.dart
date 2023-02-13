import 'package:appsize/appsize.dart';
import 'package:catalog_app/product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_client/product_client.dart';

class ProductAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.select<ProductCubit, Product?>(
      (value) => value.state.product,
    );
    final cubit = context.read<ProductCubit>();

    return AppBar(
      title: Text(product?.name ?? 'Producto'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(
              source: ImageSource.camera,
              imageQuality: 100,
            );
            if (pickedFile == null) {
              return;
            }
            cubit.updateProductImage(pickedFile.path);
          },
          icon: Icon(
            Icons.camera_alt_outlined,
            size: 25.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
