/*
 * Imports
 */

import "../../../../src/logger" for Logger
import "../../../../src/policies/filter/noFilter" for NoFilterPolicy
import "../../../../wren_modules/wren-test/dist/module" for Expect, Stub, Suite


/*
 * Test Suite
 */

var NoFilterPolicyTest = Suite.new("NoFilterPolicy") { |it|


  it.suite("filter (options)") { |it|


    it.should("return false") {

      var policy = NoFilterPolicy.new()

      Expect.call(policy.filter({})).toBeFalse

    }


  }


}
