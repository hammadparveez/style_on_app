import 'package:style_on_app/domain/repository/products/product_repo.dart';
import 'package:style_on_app/domain/shared/product_factory_type.dart';
import 'package:style_on_app/exports/domain_exports.dart';

class ProductRepoFactory {
  static ProductRepo  create(ProductRepoFactoryType type) {
    switch (type) {
      case ProductRepoFactoryType.initialProducts:
        return ProductRepoImpl();
    }
  }
}
