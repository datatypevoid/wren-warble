/*
 * Imports
 */

import "../../../../src/policies/format/simple" for SimpleFormatPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var SimpleFormatPolicyTest = Suite.new("SimpleFormatPolicy") { |it|


  it.suite("format (options)") { |it|

    var policy

    it.beforeEach {
      policy = SimpleFormatPolicy.new()
    }


    it.should("format input text") {

      var options = {
        "format": "Hello world!"
      }

      policy.format(options)

      Expect.call(options["format"]).toBe(String)
      Expect.call(options["format"]).toEqual("Hello world!")

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
