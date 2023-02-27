import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmobosco/bloc/inmuebles/inmuebles_event.dart';
import 'package:inmobosco/bloc/inmuebles/inmuebles_state.dart';
import 'package:inmobosco/repositories/inmbueble_repository.dart';
import 'package:inmobosco/services/inmueble_service.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);
int page = -1;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class InmuebleBloc extends Bloc<InmuebleEvent, InmuebleState> {
  InmuebleBloc  (this.inmuebleService) : super(const InmuebleState()) {
    on<InmuebleFetched>(
      _onInmuebleFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final InmuebleService inmuebleService;

  Future<void> _onInmuebleFetched(
      InmuebleFetched event, Emitter<InmuebleState> emitter) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == InmuebleStatus.initial) {
        page = 0;
        final response = await inmuebleService.getAllInmuebles(page);
        return emitter(state.copyWith(
          status: InmuebleStatus.success,
          inmuebles: response.content,
          hasReachedMax: response.totalPages - 1 <= page,
        ));
      }
      page += 1;
      final response = await inmuebleService.getAllInmuebles(page);

      emitter(state.copyWith(
          status: InmuebleStatus.success,
          inmuebles: List.of(state.inmubleList)..addAll(response.content),
          hasReachedMax: response.totalPages - 1 <= page));
    } catch (_) {
      emitter(state.copyWith(status: InmuebleStatus.failure));
    }
  }
}