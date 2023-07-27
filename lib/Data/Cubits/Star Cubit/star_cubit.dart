import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'star_state.dart';

class StarCubit extends Cubit<StarState> {
  StarCubit() : super(StarInitial());

  bool isStarred = true;
  void changeStar() {
    isStarred = !isStarred;
    emit(StarChange());
  }
}
