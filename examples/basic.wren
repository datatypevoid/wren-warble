/*
 * Imports
 */

import "../src/logger" for Logger
import "../src/policies/filter/noFilter" for NoFilterPolicy
import "../src/policies/format/simple" for SimpleFormatPolicy
import "../src/policies/write/console" for ConsoleWritePolicy


/*
 * Script
 */

var debug = Logger.new(
  NoFilterPolicy.new(),
  SimpleFormatPolicy.new(),
  ConsoleWritePolicy.new()
)

debug.log("Hello world!")

debug.log({
  "format": "Hello all!",
  "channel": "main",
  "subchannel": "test",
  "verbosity": 0,
  "vargs": {
    "extra": "value"
  }
})

debug.log("Hello once more!", {
  "channel": "main",
  "subchannel": "test",
  "verbosity": 0,
  "vargs": {
    "extra": "value"
  }
})

debug.log("main", "Hello again!", {
  "subchannel": "test",
  "verbosity": 0,
  "vargs": {
    "extra": "value"
  }
})
