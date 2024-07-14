import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_task/core/api/api_manager.dart';
import 'package:route_task/core/api/end_points.dart';
import 'package:route_task/feautres/products_screen/data/data_sources/products_ds_impl.dart';
import 'products_ds_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late ProductsDsImpl productsDsImpl;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    productsDsImpl = ProductsDsImpl(mockApiManager);
  });

  final mockProductJson = {
    "products": [
      {
        "id": 1,
        "title": "Product 1",
        "description": "Description 1",
        "category": "Category 1",
        "price": 100,
        "discountPercentage": 10,
        "rating": 4.5,
        "stock": 20,
        "tags": ["tag1", "tag2"],
        "brand": "Brand 1",
        "sku": "SKU1",
        "weight": 1.0,
        "dimensions": {"width": 10, "height": 20, "depth": 5},
        "warrantyInformation": "1 year",
        "shippingInformation": "Ships in 3 days",
        "availabilityStatus": "In Stock",
        "reviews": [
          {
            "rating": 5,
            "comment": "Great product!",
            "date": "2023-01-01",
            "reviewerName": "John Doe",
            "reviewerEmail": "john.doe@example.com"
          }
        ],
        "returnPolicy": "30 days",
        "minimumOrderQuantity": 1,
        "meta": {
          "createdAt": "2023-01-01",
          "updatedAt": "2023-01-02",
          "barcode": "123456",
          "qrCode": "654321"
        },
        "images": ["url1", "url2"],
        "thumbnail": "thumbnailUrl"
      }
    ],
    "total": 1,
    "skip": 0,
    "limit": 10
  };


  test('get products  productModel return', () async {
    /// Arrange
    when(mockApiManager.getData(EndPoints.getProducts)).thenAnswer((_) async =>Response(
      data: mockProductJson,
      statusCode: 200,
      requestOptions: RequestOptions(path: '/products'),
    ));

    /// Act
    final result = await productsDsImpl.getProducts();

    /// Assert
    expect(result.products?.first.id, 1);
    expect(result.total, 1);

    print("done");
  });

  test('error return in this test if api manager failed to get date', () async {
    // Arrange
    when(mockApiManager.getData(EndPoints.getProducts)).thenThrow(Exception('failed'));

    /// Act & Assert
    expect(() => productsDsImpl.getProducts(), throwsException);
  });
}
