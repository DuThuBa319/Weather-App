import 'package:equatable/equatable.dart';

enum TemperatureUnit { celsius, fahrenheit }

class SettingStates extends Equatable {
  SettingStates({required this.tempUnit, required this.urlUnit})
      : assert(tempUnit != null),
        assert(urlUnit != null);
  final TemperatureUnit tempUnit;
  final String urlUnit;
  @override
  // TODO: implement props
  List<Object?> get props => [tempUnit, urlUnit];
}
