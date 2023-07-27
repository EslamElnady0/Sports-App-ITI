import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'star_state.dart';

class StarCubit extends Cubit<StarState> {
  StarCubit() : super(StarInitial());

  List<bool> isFavourited = [];
  bool isStarred = false;
  void changeStar(int index) {
    isFavourited[index] = !isFavourited[index];
    emit(StarChange());
  }
}
