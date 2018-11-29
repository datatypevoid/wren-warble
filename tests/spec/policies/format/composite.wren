/*
 * Imports
 */

import "../../../../src/policies/format/composite" for CompositeFormatPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite
import "../../../policies/mockFilter" for MockFilterPolicy
import "../../../policies/mockFormat" for MockFormatPolicy


/*
 * Test Suite
 */

var CompositeFormatPolicyTest = Suite.new("CompositeFormatPolicy") { |it|


  it.suite("new (formatPolicyList)") { |it|


    it.should("accept a List of FormatPolicy objects") {

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new([
          MockFormatPolicy.new(),
          MockFormatPolicy.new(),
          MockFormatPolicy.new()
        ])
      }).not.toBeARuntimeError

    }


    it.should("throw if given anything other than a List for input") {

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new(42)
      }).toBeARuntimeError("Expected 'List' for 'formatPolicyList' parameter; got Num.")

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new("fourty-two")
      }).toBeARuntimeError("Expected 'List' for 'formatPolicyList' parameter; got String.")

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new(true)
      }).toBeARuntimeError("Expected 'List' for 'formatPolicyList' parameter; got Bool.")

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new({})
      }).toBeARuntimeError("Expected 'List' for 'formatPolicyList' parameter; got Map.")

    }


    it.should("throw if given an empty List") {

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new([])
      }).toBeARuntimeError("One or more format policy instances are required to create a composite format policy.")

    }


    it.should("throw if given a List which contains anything other than a FormatPolicy") {

      Expect.call(Fiber.new {
        var policy = CompositeFormatPolicy.new([
          MockFormatPolicy.new(),
          MockFormatPolicy.new(),
          MockFilterPolicy.new()
        ])
      }).toBeARuntimeError("Invalid type for FormatPolicy: MockFilterPolicy")

    }


  }


  it.suite("format (options)") { |it|


    var checkStub = Fn.new { |stub, options|
      Expect.call(stub.called).toBeTrue
      Expect.call(stub.calls.count == 1).toBeTrue
      Expect.call(stub.calls[0][0]).toEqual(options)
    }


    var checkStubs = Fn.new { |stubList, options|
      for (stub in stubList) {
        checkStub.call(stub, options)
      }
    }


    it.should("call policies in the format policy list with the given input") {

      var stub0 = Stub.new("stub0")
      var stub1 = Stub.new("stub1")
      var stub2 = Stub.new("stub2")

      var policy = CompositeFormatPolicy.new([
        MockFormatPolicy.new(stub0),
        MockFormatPolicy.new(stub1),
        MockFormatPolicy.new(stub2)
      ])

      var options = { "format": "" }

      policy.format(options)

      checkStubs.call([stub0, stub1, stub2], options)

    }


  }


}
