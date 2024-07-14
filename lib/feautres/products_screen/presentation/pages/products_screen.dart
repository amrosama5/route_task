import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_task/config.dart';
import 'package:route_task/core/enums/enums.dart';
import 'package:route_task/core/utils/app_colors.dart';
import 'package:route_task/feautres/products_screen/presentation/bloc/products_bloc.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>()..add(const getProductsEvennt()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 83.w,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset("assets/images/route.svg"),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.BackGround),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.BackGround),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon:  const Icon(
                            Icons.search,
                            color: AppColors.BackGround,
                          ),
                          hintText: 'what do you search for?',
                          hintStyle: TextStyle(
                            color: AppColors.BackGround,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 30.0.sp,
                    color: AppColors.BackGround,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
                child: BlocConsumer<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                      return BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (context, state) {
                          return GridView.builder(
                            itemCount: state.productsModel?.products?.length??0,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: (192 / 250),
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                            ),
                            itemBuilder: (context, index) {
                              return ProductItem(productModel: state
                                  .productsModel, index: index,
                              );
                            },
                          );
                        },
                      );
                  },
                  listener: (context, state) {
                    if (state.getProductsStatus == RequestStatus.failure) {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Center(
                              child: Text("error"),
                            ),
                          ));
                    }
                    if (state.getProductsStatus == RequestStatus.loading) {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    if(state.getProductsStatus == RequestStatus.success){
                      Navigator.pop(context);
                    }
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
