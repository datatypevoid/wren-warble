/*
 * Imports
 */

import "../../src/logger" for Logger
import "../../src/policies/filter/noFilter" for NoFilterPolicy
import "../../src/policies/format/simple" for SimpleFormatPolicy
import "../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite
import "../policies/write/mockWrite" for MockWritePolicy


/*
 * Utilities
 */

var resolvePath = Fn.new { |o, path|

  var obj = o

  for (p in path) obj = obj[p]

  return obj

}


var compareExpectedArgVsStubArg = Fn.new { |expectedArg, stubArg|

  var expectedType = expectedArg[0]
  var expectedPath = expectedArg[1]
  var expectedValue = expectedArg[2]

  var o = resolvePath.call(stubArg, expectedPath)

  Expect.call(expectedPath).toBe(List)

  Expect.call(o).toBe(expectedType)
  Expect.call(o).toEqual(expectedValue)

}


var test = Fn.new { |input, expectedCalls|

  var writeStub = Stub.new("writeStub")

  var log = Logger.new(
    NoFilterPolicy.new(),
    SimpleFormatPolicy.new(),
    MockWritePolicy.new(writeStub)
  )

  log.log(input)

  var stubCalls = writeStub.calls
  var expectedCallsCount = expectedCalls.count

  var argsTests
  var argsTestsCount
  var argTest
  var expectedArgTestsCount
  var expectedCall
  var stubArg
  var stubArgsCount
  var stubCall

  for (expectedCallIndex in 0...expectedCallsCount) {

    expectedCall = expectedCalls[expectedCallIndex]
    stubCall = stubCalls[expectedCallIndex]

    expectedArgTestsCount = expectedCall.count
    stubArgsCount = stubCall.count

    for (expectedArgTestIndex in 0...expectedArgTestsCount) {

      argsTests = expectedCall[expectedArgTestIndex]
      stubArg = stubCall[expectedArgTestIndex]

      Expect.call(stubArg).toBe(Map)

      argsTestsCount = argsTests.count

      for (argTestIndex in 0...argsTestsCount) {

        argTest = argsTests[argTestIndex]

        compareExpectedArgVsStubArg.call(argTest, stubArg)

      }

    }

  }

}


/*
 * Test Suite
 */

var LoggerTest = Suite.new("Logger") { |it|


  it.suite("log ()") { |it|


    it.should("write a blank line when invoked") {

      var writeStub = Stub.new("MockWritePolicy")

      var log = Logger.new(
        NoFilterPolicy.new(),
        SimpleFormatPolicy.new(),
        MockWritePolicy.new(writeStub)
      )

      log.log()

      Expect.call(writeStub.called).toBeTrue
      Expect.call(writeStub.calls.count == 1).toBeTrue

    }


  }


  it.suite("log (options)") { |it|


    it.should("write 'String' input") {

      test.call("Hello world!", [
        [
          [
            [String, ["format"], "Hello world!"]
          ]
        ]
      ])

      test.call("\"Hello world!\"", [
        [
          [
            [String, ["format"], "\"Hello world!\""]
          ]
        ]
      ])

    }


    it.should("write 'Num' input") {

      test.call(42, [
        [
          [
            [String, ["format"], "42"]
          ]
        ]
      ])

      test.call(3.14159, [
        [
          [
            [String, ["format"], "3.14159"]
          ]
        ]
      ])

    }


    it.should("write 'Bool' input") {

      test.call(true, [
        [
          [
            [String, ["format"], "true"],
          ]
        ]
      ])

      test.call(false, [
        [
          [
            [String, ["format"], "false"]
          ]
        ]
      ])

    }


    it.should("write 'List' input") {

      test.call([1, 2, 3], [
        [
          [
            [String, ["format"], "[1, 2, 3]"],
          ]
        ]
      ])

    }


    it.should("write 'Map' input") {

      test.call({ "a": { "b": "value" }}, [
        [
          [
            [String, ["format"], "{a: {b: value}}"],
          ]
        ]
      ])

    }


    it.should("write 'Null' input") {

      test.call(null, [
        [
          [
            [String, ["format"], "null"],
          ]
        ]
      ])

    }


    it.should("write 'NaN' input") {

      test.call(0 / 0, [
        [
          [
            [String, ["format"], "nan"],
          ]
        ]
      ])


      test.call(-1 * (0 / 0), [
        [
          [
            [String, ["format"], "nan"],
          ]
        ]
      ])

    }


    it.should("write values representing infinity") {

      test.call(1 / 0, [
        [
          [
            [String, ["format"], "infinity"],
          ]
        ]
      ])


      test.call(-1 * (1 / 0), [
        [
          [
            [String, ["format"], "-infinity"],
          ]
        ]
      ])

    }


  }


}
