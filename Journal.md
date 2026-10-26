Phase 1: Sensor Handshake (Futures)

In this phase, I created the fetchSensorMetadata() function to simulate connecting to a sensor. I used Future.delayed to create a two-second delay and return the sensor ID and location. I also used async and await so the program waits for the sensor information before continuing.

If I omit await, the program receives a Future instead of waiting for the completed metadata. This means the program may continue before the sensor information is ready. A Future represents a value that will become available later, while its completed value is the actual result returned by the asynchronous operation.

---------------------

Phase 2: Live Temperature Stream (Async Generators)

In this phase, I created a temperatureStream() function that generates five temperature readings with a one-second delay between each reading. I used async and yield to send each temperature through the stream. In main(), I used await for to process each reading and check whether it was above 35°C. If it was, the program displayed a warning and converted the temperature to Fahrenheit.

The yield keyword sends values one at a time and allows the generator to continue producing more values. The return keyword finishes a function and returns its result. A Future-returning function produces one eventual result, while an asynchronous generator can produce multiple values over time.

---------------------

Phase 3: Central Dispatcher (StreamController)

In this phase, I added a StreamController to create a central pipeline for the temperature readings. I registered a listener using controller.stream.listen() and moved the temperature checking and Fahrenheit conversion into the listener callback. I then used an await for loop to get readings from temperatureStream() and send them into the controller using controller.add(reading).

A StreamController allows the program to manage and distribute events through a central stream instead of processing the generator directly. Setting up the listener before sending readings ensures that it is ready to receive and process the events. I also closed the controller after dispatching all readings to release its resources cleanly.
