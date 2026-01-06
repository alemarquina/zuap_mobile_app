class Battery {
  final String serialNumber;      // Código #
  final int cycles;               // Ciclos de uso
  final double chargeLevel;       // Nivel de batería
  final double currentRangeKm;    // Recorrido
  final String timeLeft;          // Tiempo útil
  final double totalKm;           // Total recorrido
  final double estimatedSavings;  // Ahorro estimado vs gasolina
  final double maintenanceSavings; // Ahorro estimado vs mantenimiento
  
  Battery({
    required this.serialNumber,
    required this.cycles,
    required this.chargeLevel,
    required this.currentRangeKm,
    required this.timeLeft,
    required this.totalKm,
    required this.estimatedSavings,
    required this.maintenanceSavings
  });
}
