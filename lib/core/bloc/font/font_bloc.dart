import 'package:bloc/bloc.dart';
import 'package:droosy_app/core/bloc/font/font_event.dart';
import 'package:droosy_app/core/bloc/font/font_state.dart';
import 'package:droosy_app/core/services/font_service.dart';
import 'package:get_storage/get_storage.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final GetStorage _storage = GetStorage();
  FontBloc()
    : super(
        FontState(
          fontFamily: FontService.currentFontFamily,
          fontSize: FontService.currentFontScale,
        ),
      ) {
    on<ChangeFontFamilyEvent>(_changeFontFamilyEvent);
    on<ChangeFontScaleEvent>(_changeFontScaleEvent);
  }

  void _changeFontFamilyEvent(
    ChangeFontFamilyEvent event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontFamily(event.fontFamily);
    emit(state.copyWith(fontFamily: event.fontFamily));
  }

  void _changeFontScaleEvent(
    ChangeFontScaleEvent event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontScale(event.fontScale);
    emit(state.copyWith(fontSize: event.fontScale));
  }
}
