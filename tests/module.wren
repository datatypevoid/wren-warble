/*
 * Imports
 */

import "../wren_modules/wren-test/dist/module" for ConsoleReporter

// Test suites.
import "./e2e/logger" for LoggerTest


/*
 * Structures
 */

// Store test suites in List.
var tests = [
  LoggerTest
]


var reporter = ConsoleReporter.new()


// Execute tests.
for (test in tests) { test.run(reporter) }
