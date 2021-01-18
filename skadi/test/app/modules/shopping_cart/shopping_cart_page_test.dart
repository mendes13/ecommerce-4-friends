import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skadi/app/app_module.dart';
import 'package:mobx/mobx.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_page.dart';
import 'package:skadi/app/modules/shopping_cart/widgets/shopping_cart_item_widget.dart';

void main() {
  ShoppingCartController shoppingCartController;

  initModules([AppModule()]);

  setUp(() {
    shoppingCartController = AppModule.to.get<ShoppingCartController>();
  });

  testWidgets('ShoppingCartPage has title', (tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ShoppingCartPage(title: 'ShoppingCart')));
    expect(find.text('ShoppingCart'), findsOneWidget);
  });

  testWidgets(('ShoppingCartPage has title of empty product'),
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ShoppingCartPage()));

    expect(find.text("Empty products!"), findsOneWidget);
  });

  testWidgets(('ShoppingCartPage has ShoppingCartItem'),
      (WidgetTester tester) async {
    final ProductModel tProduct = ProductModel(
      id: 1,
      title: 'Test',
      price: 1000,
      image: 'test.png',
    );

    shoppingCartController.items = <int, ShoppingCartItemModel>{
      1: ShoppingCartItemModel(tProduct)
    }.asObservable();

    await tester.pumpWidget(buildTestableWidget(ShoppingCartPage()));

    expect(find.byType(ShoppingCartItemWidget), findsOneWidget);
  });
}
