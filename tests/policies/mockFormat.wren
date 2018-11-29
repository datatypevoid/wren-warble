/*
 * Imports
 */

import "../../src/formatPolicy" for FormatPolicy


/*
 * Structures
 */

class MockFormatPolicy is FormatPolicy {


  /*
   * Getters and Setters
   */

  stubFn { _stubFn }


  /*
   * Methods
   */

  construct new (stubFn) {
    _stubFn = stubFn
  }


  construct new () {}


  format (options) {
    _stubFn.call(options)
  }


}
