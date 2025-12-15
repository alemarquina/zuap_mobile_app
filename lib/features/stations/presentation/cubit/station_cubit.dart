import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/features/stations/domain/repositories/station_repository.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_state.dart';

/// Cubit que gestiona el estado global de las estaciones
class StationCubit extends Cubit<StationState> {
  final StationRepository _repository;

  StationCubit({required StationRepository repository})
      : _repository = repository,
        super(const StationInitial()) {
    loadStations();
  }

  Future<void> loadStations() async {
    emit(const StationLoading());

    try {
      final stations = await _repository.getStations();
      emit(StationLoaded(allStations: stations));
    } catch (error) {
      emit(StationError(error.toString()));
    }
  }

  void refresh() {
    loadStations();
  }

  /// Search and filter stations
  /// [query] - Search by station name (case-insensitive)
  /// [district] - Filter by district ("TODOS" or specific district)
  /// [availability] - Filter by availability ("TODOS", "Disponibles", "No disponibles")
  void searchStations({
    String? query,
    String? district,
    String? availability,
  }) {
    final currentState = state;
    if (currentState is! StationLoaded) return;

    List<Station> filtered = currentState.allStations;

    // Filter by name
    if (query != null && query.isNotEmpty) {
      filtered = filtered.where((station) {
        return station.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    // Filter by district
    if (district != null && district != 'TODOS') {
      filtered = filtered.where((station) {
        return station.district.toLowerCase() == district.toLowerCase();
      }).toList();
    }

    // Filter by availability
    if (availability != null && availability != 'TODOS') {
      if (availability == 'Disponibles') {
        filtered = filtered.where((station) {
          return station.availableBatteries > 0;
        }).toList();
      } else if (availability == 'No disponibles') {
        filtered = filtered.where((station) {
          return station.availableBatteries == 0;
        }).toList();
      }
    }

    // Check if any filters were applied
    final bool hasFilters = (query != null && query.isNotEmpty) ||
        (district != null && district != 'TODOS') ||
        (availability != null && availability != 'TODOS');

    emit(currentState.copyWith(
      filteredStations: filtered,
      isFiltered: hasFilters,
    ));
  }

  /// Clear all filters and show all stations
  void clearFilters() {
    final currentState = state;
    if (currentState is! StationLoaded) return;

    emit(currentState.copyWith(
      filteredStations: currentState.allStations,
      isFiltered: false,
    ));
  }
}
