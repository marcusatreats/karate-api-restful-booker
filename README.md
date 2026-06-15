# Karate API - Restful Booker

[![CI](https://github.com/marcusatreats/karate-api-restful-booker/actions/workflows/ci.yml/badge.svg)](https://github.com/marcusatreats/karate-api-restful-booker/actions/workflows/ci.yml)

An API test automation framework built with Karate DSL targeting the [Restful Booker API](https://restful-booker.herokuapp.com).

## Tech Stack

- **Java 17**
- **Karate DSL** - API testing with Gherkin syntax
- **Maven** - Build and dependency management
- **JUnit 5** - Test runner
- **GitHub Actions** - CI/CD pipeline

## Project Structure

    src/test
    ├── java
    │   └── booker/
    │       └── BookingRunner.java    # JUnit test runner
    └── resources
        └── booker/
            ├── auth.feature          # Authentication tests
            ├── booking.feature       # Booking CRUD tests
            └── karate-config.js      # Global config

## Test Coverage

- ✅ Authentication - Generate and validate auth token
- ✅ GET all bookings
- ✅ POST create booking
- ✅ GET booking by ID
- ✅ PUT update booking
- ✅ DELETE booking

## Running Tests

### Run all tests
    mvn test

### Run specific feature
    mvn test -Dkarate.options="classpath:booker/booking.feature"

## CI/CD

GitHub Actions workflow runs on every push and pull request to `main`.

## Author

Mark Canning | [github.com/marcusatreats](https://github.com/marcusatreats)