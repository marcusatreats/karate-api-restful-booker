Feature: Booking API

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * def authResult = call read('auth.feature')
    * def token = authResult.token

    Given path '/booking'
    And request
      """
      {
        "firstname": "Mark",
        "lastname": "Canning",
        "totalprice": 150,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "2026-07-01",
          "checkout": "2026-07-07"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200
    And match response.bookingid == '#number'
    And match response.booking.firstname == 'Mark'
    * def bookingId = response.bookingid
    * print 'Created booking: ' + bookingId


  Scenario: Update a booking
    Given path '/booking/' + bookingId
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + token
    And request
      """
      {
        "firstname": "Mark",
        "lastname": "Updated",
        "totalprice": 999,
        "depositpaid": false,
        "bookingdates": {
          "checkin": "2026-08-01",
          "checkout": "2026-08-07"
        },
        "additionalneeds": "Dinner"
      }
      """
    When method PUT
    Then status 200
    And match response.lastname == 'Updated'
    And match response.totalprice == 999

  Scenario: Get booking by ID
    Given path '/booking/' + bookingId
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response.firstname == 'Mark'
    And match response.lastname == '#string'
    And match response.totalprice == '#number'
    * print response

  Scenario: Partial update a booking
    Given path '/booking/' + bookingId
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + token
    And request
      """
      {
        "firstname": "Marcus",
        "totalprice": 500
      }
      """
    When method PATCH
    Then status 200
    And match response.firstname == 'Marcus'
    And match response.totalprice == 500
    * print response

  Scenario: Delete a booking
    Given path '/booking/' + bookingId
    And header Accept = 'application/json'
    And header Cookie = 'token=' + token
    When method DELETE
    Then status 201

    # Verify it's gone
    Given path '/booking/' + bookingId
    And header Accept = 'application/json'
    When method GET
    Then status 404