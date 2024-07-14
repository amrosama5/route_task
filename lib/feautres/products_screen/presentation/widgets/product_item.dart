import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/utils/app_colors.dart';
import '../../data/models/ProductsModel.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel? productModel;
  const ProductItem(
      {required this.index, required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    var product = productModel?.products?[index];
    return Padding(
      padding: EdgeInsets.only(
          left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 2.w, color: Colors.blueGrey)),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: CachedNetworkImage(
                        imageUrl: product?.images?[0] ?? "",
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 191.h,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline, size: 40,),),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(2.h.w),
                        margin: EdgeInsets.only(left: 6.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(
                          Icons.favorite_outline,
                          color: AppColors.BackGround,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      product?.brand ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.BackGround),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      product?.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.BackGround,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SizedBox(width: 8.w),
                      Text(
                        "EGP ${product?.price.toString() ?? ""}",
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.BackGround),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "EGP ${(product!.price! / (1 - (product.discountPercentage! / 100))).toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  const Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                    child: Row(
                      children: [
                        Text(
                          "Review",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.BackGround,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "(${product.rating})",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.BackGround,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(5.w.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: AppColors.colorBlue,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            weight: 26,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
