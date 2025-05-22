import 'package:equatable/equatable.dart';

class FontEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeFontScaleEvent extends FontEvent {
  final double fontScale;
  ChangeFontScaleEvent({required this.fontScale});

  @override
  List<Object?> get props => [fontScale];
}

class ChangeFontFamilyEvent extends FontEvent {
  final String fontFamily;

  ChangeFontFamilyEvent({required this.fontFamily});

  @override
  List<Object?> get props => [fontFamily];
}
