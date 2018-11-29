/*
 * Imports
 */

import "../../../../src/policies/write/console" for ConsoleWritePolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var ConsoleWritePolicyTest = Suite.new("ConsoleWritePolicy") { |it|


  it.suite("new (writeFn)") { |it|


    it.should("accept a Function parameter") {

      Expect.call(
        Fiber.new {
          var policy = ConsoleWritePolicy.new(Fn.new {})
        }
      ).not.toBeARuntimeError

    }


  }


  it.suite("write (options)") { |it|


    it.should("call the writer when invoked") {

      var stub = Stub.new("consoleWriterStub")

      var policy = ConsoleWritePolicy.new(stub)

      var options = { "format": "Hello world!" }

      policy.write(options)

      Expect.call(stub.called).toBeTrue
      Expect.call(stub.calls.count).toEqual(1)
      Expect.call(stub.calls[0][0]).toEqual(options["format"])

    }


  }


}
