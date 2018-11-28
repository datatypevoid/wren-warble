/*
 * Imports
 */

import "../../src/writePolicy" for WritePolicy


/*
 * Structures
 */

class MockWritePolicy is WritePolicy {


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


  write (options) {
    _stubFn.call(options)
  }


}
