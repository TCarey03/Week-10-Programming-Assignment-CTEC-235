Future<String> fetchSensorMetadata() async {
  return await Future.delayed(
    const Duration(seconds: 2),
    () => 'Sensor ID: 402 | Location: Warehouse-A',
  );
}

Future<void> main() async {
  print('Connecting to sensor...');

  final metadata = await fetchSensorMetadata();

  print(metadata);
  print('Sensor initialization complete.');
}
