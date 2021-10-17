import "package:flutter/foundation.dart";
import "package:style_on_app/exports.dart";

part 'freezed_collection.freezed.dart';

@freezed
class Union with _$Union {
  const factory Union([int? value]) = Data;
  const factory Union.loading() = Loading;
  const factory Union.error(String name) = ErrorDetails;
  //@Implements(GeographicArea)
  const factory Union.city(String name, int population) = City;
}

