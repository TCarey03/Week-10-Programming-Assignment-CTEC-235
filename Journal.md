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

---------------------

Phase 4: Fault Tolerance (Error Handling)

In this phase, I added error handling to simulate a sensor malfunction during the fourth reading. I used a counter to determine when the error should occur and controller.addError() to send the error through the stream. I added an onError callback to display an alert without crashing the program. I also added an onDone callback to confirm that the stream closed successfully.

A try-catch block handles exceptions thrown during code execution, while a stream's onError callback handles errors delivered as asynchronous stream events. Using onError allowed the listener to continue processing the fifth reading after the simulated malfunction.

---------------------

Phase 5: Validation & Reflection

During final testing, I verified that the sensor handshake waited two seconds before displaying the sensor metadata. I checked that the temperature stream generated five readings with one-second delays and that temperatures above 35°C were converted to Fahrenheit. I also tested the simulated sensor malfunction to confirm that the error was reported and the program continued processing the remaining readings without crashing.

One important detail I verified was that the fourth reading was replaced by an error event, while the fifth reading was still processed. The onError callback handled the stream error, and the onDone callback confirmed that the pipeline closed. This assignment helped me understand Futures, asynchronous generators, StreamControllers, and stream error handling. I also learned the importance of testing each phase and committing my work as I progressed.
