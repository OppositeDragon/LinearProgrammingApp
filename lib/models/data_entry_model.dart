import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/enums.dart';

part 'data_entry_model.freezed.dart';
part 'data_entry_model.g.dart';

@freezed
class DataEntryModel with _$DataEntryModel {
  const factory DataEntryModel({
    required Objectives objective,
    required List<double> objectiveFunction,
    required List<Operators> operators,
    required List<List<double>> constraints,
  }) = _DataEntryModel;

  factory DataEntryModel.fromJson(Map<String, dynamic> json) => _$DataEntryModelFromJson(json);
}

@freezed
class DataModelForGraphic with _$DataModelForGraphic {
  const factory DataModelForGraphic({
    required List<Point> intersections,
    required Point max,
  }) = _DataModelForGraphic;
}
