import 'package:equatable/equatable.dart';

class FontState extends Equatable {
  final String fontFamily;
  final double fontSize;
  const FontState({required this.fontFamily, required this.fontSize});
  @override
  List<Object?> get props => [fontFamily, fontSize];

  FontState copyWith({String? fontFamily, double? fontSize}) {
    return FontState(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
