abstract class ProductRepo extends ProductSnapshotRepo{
  Future<T?> getProducts<T>([int limit]);

}
abstract class ProductSnapshotRepo {
   itemSnapshot();
  
}
