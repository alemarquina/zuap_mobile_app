import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_cubit.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_state.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_card.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_search_modal.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({super.key});

  void _showSearchModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: StationSearchModal(
          onSearch: (query, district, availability) {
            context.read<StationCubit>().searchStations(
                  query: query,
                  district: district,
                  availability: availability,
                );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Column(
                children: [
                  const HeaderTitle(titleText: 'Estaciones'),
                  const SizedBox(height: 30),
                  
                  // Search button (opens modal)
                  GestureDetector(
                    onTap: () => _showSearchModal(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[400]),
                          const SizedBox(width: 12),
                          Text(
                            'Buscar estación',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Nearby suggestions placeholder
                  BlocBuilder<StationCubit, StationState>(
                    builder: (context, state) {
                      if (state is StationLoaded && !state.isFiltered) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sugerencias cerca de ti',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Stations list
            Expanded(
              child: BlocBuilder<StationCubit, StationState>(
                builder: (context, state) {
                  if (state is StationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryColor,
                      ),
                    );
                  }

                  if (state is StationError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error al cargar estaciones',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is StationLoaded) {
                    final stations = state.displayStations;

                    if (stations.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              color: Colors.grey[400],
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No se encontraron estaciones',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                context.read<StationCubit>().clearFilters();
                              },
                              child: const Text('Limpiar filtros'),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 40),
                      itemCount: stations.length + 1,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        // Header
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.isFiltered
                                      ? 'RESULTADOS (${stations.length})'
                                      : 'ESTACIONES CERCANAS',
                                  style: const TextStyle(
                                    color: AppTheme.darkColor,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                if (state.isFiltered)
                                  TextButton(
                                    onPressed: () {
                                      context.read<StationCubit>().clearFilters();
                                    },
                                    child: const Text(
                                      'Limpiar',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }

                        // Station cards
                        final station = stations[index - 1];
                        return StationCard(
                          name: station.name,
                          availableBatteries: station.availableBatteries,
                          distance: '-- km', // TODO: Calculate distance
                          address: station.address,
                          status: station.status,
                          schedule: station.openHours,
                          imagePath: station.image,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
