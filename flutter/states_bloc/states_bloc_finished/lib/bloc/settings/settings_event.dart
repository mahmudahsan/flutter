part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {
  final dynamic payload;
  SettingsEvent(this.payload);
}

class FontSize extends SettingsEvent {
  FontSize(double payload) : super(payload);
}

class Bold extends SettingsEvent {
  Bold(bool payload) : super(payload);
}

class Italic extends SettingsEvent {
  Italic(bool payload) : super(payload);
}
