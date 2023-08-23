import 'package:baemin/common/model/cursor_pagination_model.dart';
import 'package:baemin/restaurant/model/restaurant_model.dart';
import 'package:baemin/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider = StateNotifierProvider<RestaurantStateNotifier,
    List<RestaurantModel>>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);
  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPagination> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPagination(meta: meta, data: data)) {
    paginate(); //constructor에 추가하여 바로 실행되도록
  }

  paginate() async {
    final resp = await repository.paginate();

    state = resp.data;
  }
}