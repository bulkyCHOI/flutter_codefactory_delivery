import 'package:baemin/common/utils/data_utils.dart';
import 'package:baemin/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final String id;
  final UserModel user;
  final int rating;
  final String content;
  @JsonKey(
    fromJson: DataUtils.listPathsToUrls,
  )
  final List<String> imageUrls;

  RatingModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.content,
    required this.imageUrls,
  });
  
  factory RatingModel.fromJson(Map<String, dynamic> json)
  => _$RatingModelFromJson(json);
}
