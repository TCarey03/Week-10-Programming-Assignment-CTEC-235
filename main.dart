import 'dart:async';

Future<String> fetchSensorMetadata() async {
  return await Future.delayed(
    const Duration(seconds: 2),
    () => 'Sensor ID: 402 | Location: Warehouse-A',
  );
}

Stream<double> temperatureStream() async* {
  final temperatures = [24.5, 29.0, 36.5, 32.0, 40.0];

  for (final temperature in temperatures) {
    await Future.delayed(const Duration(seconds: 1));
    yield temperature;
  }
}

Future<void> main() async {
  print('Connecting to sensor...');

  final metadata = await fetchSensorMetadata();
  print(metadata);
  print('Sensor initialization complete.');

  print('\nStarting temperature monitoring...');

  // Create the central controller.
  final controller = StreamController<double>();

  // Listen for readings and process them.
  controller.stream.listen((reading) {
    if (reading > 35.0) {
      final fahrenheit = reading * 1.8 + 32;

      print(
        'HIGH TEMPERATURE WARNING: '
        '${reading.toStringAsFixed(1)}°C = '
        '${fahrenheit.toStringAsFixed(1)}°F',
      );
    } else {
      print('Normal temperature: ${reading.toStringAsFixed(1)}°C');
    }
  });

  // Send readings from the generator into the controller.
  await for (final reading in temperatureStream()) {
    controller.add(reading);
  }

  // Close the controller after all readings are dispatched.
  await controller.close();

  print('Temperature monitoring complete.');
}
