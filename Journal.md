Phase 1: Sensor Handshake (Futures)

In this phase, I created the fetchSensorMetadata() function to simulate connecting to a sensor. I used Future.delayed to create a two-second delay and return the sensor ID and location. I also used async and await so the program waits for the sensor information before continuing.

If I omit await, the program receives a Future instead of waiting for the completed metadata. This means the program may continue before the sensor information is ready. A Future represents a value that will become available later, while its completed value is the actual result returned by the asynchronous operation.
