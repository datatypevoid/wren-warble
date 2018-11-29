/*
 * Imports
 */

import "../../../../src/policies/format/extended" for ExtendedFormatPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var ExtendedFormatPolicyTest = Suite.new("ExtendedFormatPolicy") { |it|


  it.suite("format (options)") { |it|

    var policy

    it.beforeEach {
      policy = ExtendedFormatPolicy.new()
    }


    it.should("parse the simple form") {

      var options = {
        "format": "Hello world!"
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("Hello world!")

    }


    it.should("parse the form '[channel] format'") {

      var options = {
        "channel": "spec",
        "format": "Hello world!"
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("[spec] Hello world!")

    }


    it.should("parse the form '[channel:subchannel] format'") {

      var options = {
        "channel": "spec",
        "subchannel": "ExtendedFormatPolicy",
        "format": "Hello world!"
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("[spec:ExtendedFormatPolicy] Hello world!")

    }


    it.should("parse the form '[subchannel] format'") {

      var options = {
        "subchannel": "ExtendedFormatPolicy",
        "format": "Hello world!"
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("[ExtendedFormatPolicy] Hello world!")

    }


    it.should("format Bool values") {

      var options = {
        "format": true
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("true")

    }


    it.should("format Num values") {

      var options = {
        "format": 42
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("42")

    }


    it.should("format Map values") {

      var options = {
        "format": {
          "a": {
            "b": {
              "c": "value"
            }
          }
        }
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("{a: {b: {c: value}}}")

    }


    it.should("format List values") {

      var options = {
        "format": [1, 2, 3, 4]
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("[1, 2, 3, 4]")

    }


    it.should("handle cases where there is no format property specified with the given options") {

      var options = {}

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("")

    }


  }


}
