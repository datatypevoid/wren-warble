/*
 * Imports
 */

import "../../wren_modules/wren-test/dist/module" for ConsoleReporter

// Test suites.
import "./logger" for LoggerTest


/*
 * Constants
 */

// Store test suites in List.
var TESTS = [
  LoggerTest
]

var reporter = ConsoleReporter.new()


/*
 * Structures
 */

for (test in TESTS) test.run(reporter)
