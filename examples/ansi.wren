/*
 * Imports
 */

import "../src/logger" for Logger
import "../src/policies/filter/noFilter" for NoFilterPolicy
import "../src/policies/format/ansi/color" for ANSIBackgroundColor, ANSIForegroundColor, ANSIStyle
import "../src/policies/format/ansi/module" for ANSIFormatPolicy
import "../src/policies/format/composite" for CompositeFormatPolicy
import "../src/policies/format/extended" for ExtendedFormatPolicy
import "../src/policies/format/simple" for SimpleFormatPolicy
import "../src/policies/write/console" for ConsoleWritePolicy


/*
 * Script
 */

var debug = Logger.new(
  NoFilterPolicy.new(),
  CompositeFormatPolicy.new([
    SimpleFormatPolicy.new(),
    ANSIFormatPolicy.new(ANSIForegroundColor.Red)
  ]),
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

debug = Logger.new(
  NoFilterPolicy.new(),
  CompositeFormatPolicy.new([
    SimpleFormatPolicy.new(),
    ANSIFormatPolicy.new(ANSIForegroundColor.Blue, ANSIBackgroundColor.Black)
  ]),
  ConsoleWritePolicy.new()
)

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

debug = Logger.new(
  NoFilterPolicy.new(),
  CompositeFormatPolicy.new([
    ExtendedFormatPolicy.new(),
    ANSIFormatPolicy.new(ANSIForegroundColor.Blue, ANSIBackgroundColor.Black, ANSIStyle.Underline)
  ]),
  ConsoleWritePolicy.new()
)

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
