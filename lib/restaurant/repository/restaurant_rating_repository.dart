import 'package:baemin/common/const/data.dart';
import 'package:baemin/common/dio/dio.dart';
import 'package:baemin/common/model/cursor_pagination_model.dart';
import 'package:baemin/common/model/pagination_params.dart';
import 'package:baemin/rating/model/rating_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_rating_repository.g.dart';

final restaurantRatingRepositioryProvider = Provider.family<
    RestaurantRatingRepository,
    String>((ref, id) {
      final Dio dio = ref.watch(dioProvider);

      return RestaurantRatingRepository(dio, baseUrl: 'http://$ip/restaurant/$id/rating');
});


// http://ip/restaurant/:rid/rating
@RestApi()
abstract class RestaurantRatingRepository {
  factory RestaurantRatingRepository(Dio dio, {String baseUrl}) =
  _RestaurantRatingRepository;

  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RatingModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(), //build time에 정해지게 하기 위해서 const
  });
}