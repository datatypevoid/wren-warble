/*
 * Imports
 */

import "../../../../src/policies/format/ansi/module" for ANSIFormatPolicy
import "../../../../src/policies/format/ansi/color" for ANSIBackgroundColor, ANSIForegroundColor, ANSIStyle
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var ANSIFormatPolicyTest = Suite.new("ANSIFormatPolicy") { |it|


  it.suite("new (foreground)") { |it|



    it.suite("format (options)") { |it|


      var policy

      it.beforeEach {
        policy = ANSIFormatPolicy.new(ANSIForegroundColor.Red)
      }


      it.should("format input text using background color codes when provided") {

        var options = {
          "format": "Hello world!"
        }

        policy.format(options)

        Expect.call(options["format"]).toBe(String)
        Expect.call(options["format"]).toEqual("\u001b[31mHello world!\u001b[0m")

      }


    }


  }


}
