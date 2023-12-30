import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linearprogrammingapp/constants/enums.dart';

part 'simplex_data_model.freezed.dart';

@freezed
class SimplexDataModel with _$SimplexDataModel {
  const SimplexDataModel._();
  const factory SimplexDataModel({
    required SimplexStatus status,
    required List<List<List<String>>> tableaus,
    required List<Point<int>> pivotsCoordinates,
    @Default(null) List<List<List<String>>>? tableaus1st,
    @Default(null) List<Point<int>>? pivotsCoordinates1st,
    @Default(null) List<int>? artificialVariablesIndexes,
    AnswerPresentationModel? answerPresentation,
  }) = _SimplexDataModel;
}

@freezed
class TabularFormInformation with _$TabularFormInformation {
  const TabularFormInformation._();
  const factory TabularFormInformation({
    required List<List<double>> matrix,
    required List<int> basicVariables,
  }) = _TabularFormInformation;
}

typedef AnswerVariableData = ({String letter, double coefficient, double value});

@freezed
class AnswerPresentationModel with _$AnswerPresentationModel {
  const AnswerPresentationModel._();
  const factory AnswerPresentationModel({
    required List<AnswerVariableData> variablesData,
    required double z,
  }) = _AnswerPresentationModel;
}
