
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_event.dart';

class SliderBloc extends Bloc<SliderEvent, double> {
  SliderBloc() : super(0) {
    on<OnChange>((OnChange event, emit) {
      final value = event.value;
      emit(value);
    });
  }
}
