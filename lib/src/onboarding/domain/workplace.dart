import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace.freezed.dart';
part 'workplace.g.dart';

@freezed
class Workplace with _$Workplace {
  factory Workplace({
    required String creatorUid,
    required String managerUid,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    required String street,
    required String city,
    required String province,
    required String country,
    required String postalCode,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);
}
