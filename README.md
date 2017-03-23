# Elm and Rest

Assignment: 

 * Server Choise: Node.js (of course)

Write a server in a language of your choice with two HTTP REST
methods:


    1. GET /counter: increments and returns an integer counter
    2. PUT /counter/{value}: sets the counter to value

Write an Elm client using the model - view - update architecture.
Your client must have:

    1. A model containing one counter Model { counter: Int }
    2. A view with two HTML buttons (get and set) as well as the
    counter in an HTML H2 element
    3. An update part which can 1) get the counter value from your
    REST service and 2) set the counter to a xed value of 1
    Hand in before 27th March 23:59