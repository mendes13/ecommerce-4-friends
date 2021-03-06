import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:skadi/app/app_module.dart';
import 'package:skadi/app/modules/product/product_controller.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/product_module.dart';
import 'package:skadi/app/modules/product/product_page.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

class MockProductRepository extends Mock implements IProductRepository {}

class MockShoppingCartController extends Mock
    implements ShoppingCartController {}

void main() {
  final repository = MockProductRepository();
  final shoppingCartController = MockShoppingCartController();

  setUp(() {
    initModules([
      AppModule(),
      ProductModule()
    ], changeBinds: [
      Bind(
        (i) => ProductController(repository, shoppingCartController),
      ),
    ]);
  });

  testWidgets('ProductPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ProductPage(title: 'Product')));

    expect(find.text('Product'), findsOneWidget);
  });

  testWidgets('ProductPage with empty products', (WidgetTester tester) async {
    when(repository.fetch()).thenAnswer((_) async => <ProductModel>[]);

    await tester.pumpWidget(buildTestableWidget(ProductPage()));
    await tester.pump();

    expect(find.text('Sem produtos!'), findsOneWidget);
  });

  testWidgets('ProductPage has products', (WidgetTester tester) async {
    HttpOverrides.global = null;

    when(repository.fetch()).thenAnswer((_) async => <ProductModel>[
          ProductModel(
            id: 1,
            title: "Test product",
            image:
                "https://apartamento21.com.br/wp-content/uploads/2016/05/placeholder.png",
            price: 1000,
          ),
        ]);

    await tester.pumpWidget(buildTestableWidget(ProductPage()));
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('ProductPage check if has loading', (WidgetTester tester) async {
    when(repository.fetch()).thenAnswer((_) async => <ProductModel>[]);

    await tester.pumpWidget(buildTestableWidget(ProductPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
