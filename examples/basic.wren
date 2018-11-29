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
debug.log(42)
debug.log(3.14159)
debug.log(true)
debug.log(false)
debug.log(0 / 0)
debug.log(-1 * (0 / 0))
debug.log(1 / 0)
debug.log(-1 * (1 / 0))

debug.log([
  1,
  2,
  3,
  4,
  [
    "a",
    "b",
    "c",
    {
      "d": "value"
    }
  ]
])

debug.log({
  "a": {
    "b": {
      "c": "value"
    },
    "d": {
      "e": "value"
    }
  },
  "f": {
    "g": {
      "h": "value"
    },
    "i": {
      "j": "value"
    }
  }
})

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
