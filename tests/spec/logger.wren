/*
 * Imports
 */

import "../../src/logger" for Logger
import "../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite
import "../policies/mockFilter" for MockFilterPolicy
import "../policies/mockFormat" for MockFormatPolicy
import "../policies/mockWrite" for MockWritePolicy


/*
 * Test Suite
 */

var LoggerTest = Suite.new("Logger") { |it|


  it.suite("log (options)") { |it|


    it.should("invoke the filter policy for the Logger instance") {

      var filterStub = Stub.andReturnValue("filterStub", false)
      var formatStub = Stub.new("formatStub")
      var writeStub = Stub.new("writeStub")

      var mockFilterPolicy = MockFilterPolicy.new(filterStub)
      var mockFormatPolicy = MockFormatPolicy.new(formatStub)
      var mockWritePolicy = MockWritePolicy.new(writeStub)

      var log = Logger.new(
        mockFilterPolicy,
        mockFormatPolicy,
        mockWritePolicy
      )

      log.log("Hello world!")

      Expect.call(filterStub.called).toBeTrue
      Expect.call(filterStub.calls.count == 1).toBeTrue

      var first = filterStub.firstCall
      var firstArg = first[0]

      Expect.call(firstArg).toBe(Map)
      Expect.call(firstArg["format"]).toBe(String)

    }


    it.should("invoke the format policy for the Logger instance") {

      var filterStub = Stub.andReturnValue("filterStub", false)
      var formatStub = Stub.new("formatStub")
      var writeStub = Stub.new("writeStub")

      var mockFilterPolicy = MockFilterPolicy.new(filterStub)
      var mockFormatPolicy = MockFormatPolicy.new(formatStub)
      var mockWritePolicy = MockWritePolicy.new(writeStub)

      var log = Logger.new(
        mockFilterPolicy,
        mockFormatPolicy,
        mockWritePolicy
      )

      log.log("Hello world!")

      Expect.call(formatStub.called).toBeTrue
      Expect.call(formatStub.calls.count == 1).toBeTrue

      var first = formatStub.firstCall
      var firstArg = first[0]

      Expect.call(firstArg).toBe(Map)
      Expect.call(firstArg["format"]).toBe(String)

    }


    it.should("invoke the write policy for the Logger instance") {

      var filterStub = Stub.andReturnValue("filterStub", false)
      var formatStub = Stub.new("formatStub")
      var writeStub = Stub.new("writeStub")

      var mockFilterPolicy = MockFilterPolicy.new(filterStub)
      var mockFormatPolicy = MockFormatPolicy.new(formatStub)
      var mockWritePolicy = MockWritePolicy.new(writeStub)

      var log = Logger.new(
        mockFilterPolicy,
        mockFormatPolicy,
        mockWritePolicy
      )

      log.log("Hello world!")

      Expect.call(writeStub.called).toBeTrue
      Expect.call(writeStub.calls.count == 1).toBeTrue

      var first = writeStub.firstCall
      var firstArg = first[0]

      Expect.call(firstArg).toBe(Map)
      Expect.call(firstArg["format"]).toBe(String)

    }


  }


}
