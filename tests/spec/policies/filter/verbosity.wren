/*
 * Imports
 */

import "../../../../src/policies/filter/verbosity" for VerbosityFilterPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var VerbosityPolicyTest = Suite.new("VerbosityFilterPolicy") { |it|


  it.suite("new (level)") { |it|


    it.should("throw when given input that is not an integer") {

      Expect.call(
        Fiber.new {
          var policy = VerbosityFilterPolicy.new("fourty-two")
        }
      ).toBeARuntimeError("Expected 'integer' for 'level' parameter; got String.")

      Expect.call(
        Fiber.new {
          var policy = VerbosityFilterPolicy.new(true)
        }
      ).toBeARuntimeError("Expected 'integer' for 'level' parameter; got Bool.")

      Expect.call(
        Fiber.new {
          var policy = VerbosityFilterPolicy.new({})
        }
      ).toBeARuntimeError("Expected 'integer' for 'level' parameter; got Map.")

      Expect.call(
        Fiber.new {
          var policy = VerbosityFilterPolicy.new([])
        }
      ).toBeARuntimeError("Expected 'integer' for 'level' parameter; got List.")

    }


  }


  it.suite("filter (options)") { |it|


    it.should("return true when verbosity of the message is less than the defined threshold") {

      var policy = VerbosityFilterPolicy.new(3)

      Expect.call(policy.filter({ "verbosity": 2 })).toBeTrue

    }


    it.should("return false when verbosity of the message is equal to the defined threshold") {

      var policy = VerbosityFilterPolicy.new(3)

      Expect.call(policy.filter({ "verbosity": 3 })).toBeFalse

    }


    it.should("return true when verbosity of the message is not defined") {

      var policy = VerbosityFilterPolicy.new(3)

      Expect.call(policy.filter({})).toBeTrue

    }


    it.should("return false when verbosity of the message is greater than the defined threshold") {

      var policy = VerbosityFilterPolicy.new(3)

      Expect.call(policy.filter({ "verbosity": 5 })).toBeFalse

    }


  }


}
