/*
 * Imports
 */

import "../../../../src/logger" for Logger
import "../../../../src/policies/filter/composite" for CompositeFilterPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite
import "../../../policies/mockFilter" for MockFilterPolicy
import "../../../policies/mockWrite" for MockWritePolicy


/*
 * Test Suite
 */

var CompositeFilterPolicyTest = Suite.new("CompositeFilterPolicy") { |it|


  it.suite("new (filterPolicyList)") { |it|


    it.should("accept a List of FilterPolicy objects") {

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new([
          MockFilterPolicy.new(),
          MockFilterPolicy.new(),
          MockFilterPolicy.new()
        ])
      }).not.toBeARuntimeError

    }


    it.should("throw if given anything other than a List for input") {

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new(42)
      }).toBeARuntimeError("Expected 'List' for 'filterPolicyList' parameter; got Num.")

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new("fourty-two")
      }).toBeARuntimeError("Expected 'List' for 'filterPolicyList' parameter; got String.")

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new(true)
      }).toBeARuntimeError("Expected 'List' for 'filterPolicyList' parameter; got Bool.")

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new({})
      }).toBeARuntimeError("Expected 'List' for 'filterPolicyList' parameter; got Map.")

    }


    it.should("throw if given an empty List") {

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new([])
      }).toBeARuntimeError("One or more filter policy instances are required to create a composite filter policy.")

    }


    it.should("throw if given a List which contains anything other than a FilterPolicy") {

      Expect.call(Fiber.new {
        var policy = CompositeFilterPolicy.new([
          MockFilterPolicy.new(),
          MockFilterPolicy.new(),
          MockWritePolicy.new()
        ])
      }).toBeARuntimeError("Invalid type for FilterPolicy: MockWritePolicy")

    }


  }


  it.suite("filter (options)") { |it|


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


    it.should("call filters in the filter policy list with the given input") {

      var stub0 = Stub.andReturnValue("stub0", false)
      var stub1 = Stub.andReturnValue("stub1", false)
      var stub2 = Stub.andReturnValue("stub2", false)

      var policy = CompositeFilterPolicy.new([
        MockFilterPolicy.new(stub0),
        MockFilterPolicy.new(stub1),
        MockFilterPolicy.new(stub2)
      ])

      var options = { "format": "" }

      var filtered = policy.filter(options)

      checkStubs.call([stub0, stub1, stub2], options)

      Expect.call(filtered).toBeFalse

    }


    it.should("short-circuit the check if a policy filters a message") {

      var stub0 = Stub.andReturnValue("stub0", false)
      var stub1 = Stub.andReturnValue("stub1", true)
      var stub2 = Stub.andReturnValue("stub2", false)

      var policy = CompositeFilterPolicy.new([
        MockFilterPolicy.new(stub0),
        MockFilterPolicy.new(stub1),
        MockFilterPolicy.new(stub2)
      ])

      var options = { "format": "" }

      var filtered = policy.filter(options)

      checkStubs.call([stub0, stub1], options)

      Expect.call(stub2.called).toBeFalse

      Expect.call(filtered).toBeTrue

    }


  }


}
