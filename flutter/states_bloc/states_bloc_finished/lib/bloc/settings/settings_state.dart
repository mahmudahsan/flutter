part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {
  final double sliderFontSize;
  final bool isBold;
  final bool isItalic;

  SettingsState({this.sliderFontSize, this.isBold, this.isItalic});

  double get fontSize => sliderFontSize * 30;
}

class InitialSettingsState extends SettingsState {
  InitialSettingsState()
      : super(sliderFontSize: 0.5, isBold: false, isItalic: false);
}

class NewSettingState extends SettingsState {
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double sliderFontSize, bool isBold, bool isItalic})
      : super(
          sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
          isBold: isBold ?? oldState.isBold,
          isItalic: isItalic ?? oldState.isItalic,
        );
}
