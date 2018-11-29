/*
 * Imports
 */

import "../../../../src/policies/write/composite" for CompositeWritePolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite
import "../../../policies/mockFilter" for MockFilterPolicy
import "../../../policies/mockWrite" for MockWritePolicy


/*
 * Test Suite
 */

var CompositeWritePolicyTest = Suite.new("CompositeWritePolicy") { |it|


  it.suite("new (writePolicyList)") { |it|


    it.should("accept a List of WritePolicy objects") {

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new([
          MockWritePolicy.new(),
          MockWritePolicy.new(),
          MockWritePolicy.new()
        ])
      }).not.toBeARuntimeError

    }


    it.should("throw if given anything other than a List for input") {

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new(42)
      }).toBeARuntimeError("Expected 'List' for 'writePolicyList' parameter; got Num.")

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new("fourty-two")
      }).toBeARuntimeError("Expected 'List' for 'writePolicyList' parameter; got String.")

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new(true)
      }).toBeARuntimeError("Expected 'List' for 'writePolicyList' parameter; got Bool.")

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new({})
      }).toBeARuntimeError("Expected 'List' for 'writePolicyList' parameter; got Map.")

    }


    it.should("throw if given an empty List") {

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new([])
      }).toBeARuntimeError("One or more write policy instances are required to create a composite write policy.")

    }


    it.should("throw if given a List which contains anything other than a WritePolicy") {

      Expect.call(Fiber.new {
        var policy = CompositeWritePolicy.new([
          MockWritePolicy.new(),
          MockWritePolicy.new(),
          MockFilterPolicy.new()
        ])
      }).toBeARuntimeError("Invalid type for WritePolicy: MockFilterPolicy")

    }


  }


  it.suite("write (options)") { |it|


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


    it.should("call policies in the write policy list with the given input") {

      var stub0 = Stub.new("stub0")
      var stub1 = Stub.new("stub1")
      var stub2 = Stub.new("stub2")

      var policy = CompositeWritePolicy.new([
        MockWritePolicy.new(stub0),
        MockWritePolicy.new(stub1),
        MockWritePolicy.new(stub2)
      ])

      var options = { "format": "" }

      policy.write(options)

      checkStubs.call([stub0, stub1, stub2], options)

    }


  }


}
