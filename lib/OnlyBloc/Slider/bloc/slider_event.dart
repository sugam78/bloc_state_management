part of 'slider_bloc.dart';

sealed class SliderEvent {}

final class OnChange extends SliderEvent{
  final value;
  OnChange(this.value);
}
