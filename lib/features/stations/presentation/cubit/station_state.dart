import 'package:equatable/equatable.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';

/// Clase base para todos los estados de estaciones
abstract class StationState extends Equatable {
  const StationState();

  @override
  List<Object?> get props => [];
}

class StationInitial extends StationState {
  const StationInitial();
}

class StationLoading extends StationState {
  const StationLoading();
}

class StationLoaded extends StationState {
  final List<Station> allStations;
  final List<Station> filteredStations;
  final bool isFiltered;

  const StationLoaded({
    required this.allStations,
    List<Station>? filteredStations,
    this.isFiltered = false,
  }) : filteredStations = filteredStations ?? allStations;

  // Helper getter to get the stations to display
  List<Station> get displayStations => isFiltered ? filteredStations : allStations;

  @override
  List<Object?> get props => [allStations, filteredStations, isFiltered];

  StationLoaded copyWith({
    List<Station>? allStations,
    List<Station>? filteredStations,
    bool? isFiltered,
  }) {
    return StationLoaded(
      allStations: allStations ?? this.allStations,
      filteredStations: filteredStations ?? this.filteredStations,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }
}

class StationError extends StationState {
  final String message;

  const StationError(this.message);

  @override
  List<Object?> get props => [message];
}
