import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ThemeState extends Equatable {
  final Color backgroundColor;
  final Color textColor;
  const ThemeState({required this.backgroundColor, required this.textColor})
      : assert(textColor != null && backgroundColor != null);
  @override
  // TODO: implement props
  List<Object?> get props => [backgroundColor, textColor];
}
