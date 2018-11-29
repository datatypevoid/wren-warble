/*
 * Imports
 */

import "../../../../src/policies/filter/channelBlockList" for ChannelBlockListFilterPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var ChannelBlockListFilterPolicyTest = Suite.new("ChannelBlockListFilterPolicy") { |it|


  it.suite("new (blockList)") { |it|


    it.should("accept a List of Strings") {

      Expect.call(
        Fiber.new {
          var policy = ChannelBlockListFilterPolicy.new([])
        }
      ).not.toBeARuntimeError

    }


    it.should("throw if given anything other than a 'List' for input") {

      Expect.call(
        Fiber.new {
          var policy = ChannelBlockListFilterPolicy.new("fourty-two")
        }
      ).toBeARuntimeError("Expected 'List' for 'blockList' parameter; got String.")

      Expect.call(
        Fiber.new {
          var policy = ChannelBlockListFilterPolicy.new(true)
        }
      ).toBeARuntimeError("Expected 'List' for 'blockList' parameter; got Bool.")

      Expect.call(
        Fiber.new {
          var policy = ChannelBlockListFilterPolicy.new({})
        }
      ).toBeARuntimeError("Expected 'List' for 'blockList' parameter; got Map.")

      Expect.call(
        Fiber.new {
          var policy = ChannelBlockListFilterPolicy.new(42)
        }
      ).toBeARuntimeError("Expected 'List' for 'blockList' parameter; got Num.")

    }


  }


  it.suite("filter (options)") { |it|


    it.should("return 'true' if the internal block list contains the message channel property") {

      var policy = ChannelBlockListFilterPolicy.new(["oregano", "basil", "thyme", "rosemary"])

      Expect.call(policy.filter({ "channel": "thyme" })).toBeTrue

    }


    it.should("return 'false' if the internal block list dpes not contain the message channel property") {

      var policy = ChannelBlockListFilterPolicy.new(["red", "green", "blue", "orange"])

      Expect.call(policy.filter({ "channel": "magenta" })).toBeFalse

    }


  }


}
