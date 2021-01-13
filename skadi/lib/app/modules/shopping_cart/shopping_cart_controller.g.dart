// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCartController on _ShoppingCartControllerBase, Store {
  Computed<int> _$getTotalQuantityComputed;

  @override
  int get getTotalQuantity => (_$getTotalQuantityComputed ??= Computed<int>(
          () => super.getTotalQuantity,
          name: '_ShoppingCartControllerBase.getTotalQuantity'))
      .value;
  Computed<int> _$getTotalValueComputed;

  @override
  int get getTotalValue =>
      (_$getTotalValueComputed ??= Computed<int>(() => super.getTotalValue,
              name: '_ShoppingCartControllerBase.getTotalValue'))
          .value;

  final _$itemsAtom = Atom(name: '_ShoppingCartControllerBase.items');

  @override
  ObservableMap<int, ShoppingCartItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableMap<int, ShoppingCartItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$addAsyncAction = AsyncAction('_ShoppingCartControllerBase.add');

  @override
  Future<void> add(ProductModel product, {int quantity = 1}) {
    return _$addAsyncAction.run(() => super.add(product, quantity: quantity));
  }

  final _$removeItemAsyncAction =
      AsyncAction('_ShoppingCartControllerBase.removeItem');

  @override
  Future<void> removeItem(ProductModel product) {
    return _$removeItemAsyncAction.run(() => super.removeItem(product));
  }

  final _$fetchAsyncAction = AsyncAction('_ShoppingCartControllerBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
items: ${items},
getTotalQuantity: ${getTotalQuantity},
getTotalValue: ${getTotalValue}
    ''';
  }
}
