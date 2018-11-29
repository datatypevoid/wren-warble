/*
 * Imports
 */

import "../../../../src/policies/filter/channelSafeList" for ChannelSafeListFilterPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var ChannelSafeListFilterPolicyTest = Suite.new("ChannelSafeListFilterPolicy") { |it|


  it.suite("new (safeList)") { |it|


    it.should("accept a List of Strings") {

      Expect.call(
        Fiber.new {
          var policy = ChannelSafeListFilterPolicy.new([])
        }
      ).not.toBeARuntimeError

    }


    it.should("throw if given anything other than a 'List' for input") {

      Expect.call(
        Fiber.new {
          var policy = ChannelSafeListFilterPolicy.new("fourty-two")
        }
      ).toBeARuntimeError("Expected 'List' for 'safeList' parameter; got String.")

      Expect.call(
        Fiber.new {
          var policy = ChannelSafeListFilterPolicy.new(true)
        }
      ).toBeARuntimeError("Expected 'List' for 'safeList' parameter; got Bool.")

      Expect.call(
        Fiber.new {
          var policy = ChannelSafeListFilterPolicy.new({})
        }
      ).toBeARuntimeError("Expected 'List' for 'safeList' parameter; got Map.")

      Expect.call(
        Fiber.new {
          var policy = ChannelSafeListFilterPolicy.new(42)
        }
      ).toBeARuntimeError("Expected 'List' for 'safeList' parameter; got Num.")

    }


  }


  it.suite("filter (options)") { |it|


    it.should("return 'false' if the internal safe list contains the message channel property") {

      var policy = ChannelSafeListFilterPolicy.new(["oregano", "basil", "thyme", "rosemary"])

      Expect.call(policy.filter({ "channel": "thyme" })).toBeFalse

    }


    it.should("return 'true' if the internal safe list dpes not contain the message channel property") {

      var policy = ChannelSafeListFilterPolicy.new(["red", "green", "blue", "orange"])

      Expect.call(policy.filter({ "channel": "magenta" })).toBeTrue

    }


  }


}
