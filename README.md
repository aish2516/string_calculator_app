String Calculator

A simple Ruby on Rails web application that implements a String
Calculator. This app allows users to input a string of numbers,
optionally with custom delimiters and calculate their sum. It also
provides a basic UI for interaction and supports JSON API requests.

Features

Handles numbers separated by default delimiters (commas and newlines).
Supports custom delimiters in the format //[delimiter]\n[numbers...].
Validates input to prevent negative numbers and raises appropriate errors.
It provides a web-based UI and an API for interacting with the calculator.

Getting Started

Prerequisites

Ruby 2.6.1 or higher
Rails 5.2.8 or higher
A working installation of Bundler
SQLite3 (or any preferred database)

Installation

Clone the repository:

git clone https://github.com/your-username/string-calculator.git
cd string-calculator

Install dependencies:

bundle install

Set up the database:

rails db:setup

Start the Rails server:

rails server

Visit the app in your browser:

http://localhost:3000/calculate

Usage

Web-Based Interaction

Navigate to /calculate in your browser.
Enter a string of numbers in the input field (e.g., 1,2,3 or //;\n1;2;3).
Submit the form to see the calculated sum.

API Usage

You can also interact with the application via the API using tools
like Postman or cURL.

Endpoint: POST /calculate
Request Body (JSON):

json
{
  "numbers": "//;\n1;2;3"
}

Response:

json

{
  "result": 6
}

If negative numbers are included, the response will return an error:

json

{
  "error": "negative numbers not allowed -1,-2"
}

Examples

Input: 1,2,3

Output: 6

Input: //;\n1;2;3

Output: 6

Input: //;\n1;-2

Output: Error: negative numbers not allowed -2

Input: Empty string

Output: 0

Application Structure

Controllers: Contains the CalculatorsController for handling input and
calculating results.
Models: The StringCalculator class encapsulates the logic for parsing
and summing the numbers.
Views: Includes a simple form-based UI for user interaction.

Tests

To run tests, use the following command:

bundle exec rspec

The app includes unit tests for the StringCalculator class and
integration tests for the API.

Contributing

Feel free to fork this repository and submit pull requests to improve
the app. Contributions are always welcome!

Fork the repository.
Create a new branch:

git checkout -b feature/your-feature-name

Commit your changes:


git commit -m "Add your feature"

Push to the branch:


git push origin feature/your-feature-name

Open a pull request.

License

This project is licensed under the MIT License. See the LICENSE file
for details.

Acknowledgments

Inspired by the String Calculator Kata.
Built with Ruby on Rails.


