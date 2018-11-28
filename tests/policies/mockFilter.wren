/*
 * Imports
 */

import "../../src/filterPolicy" for FilterPolicy


/*
 * Structures
 */

class MockFilterPolicy is FilterPolicy {


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


  filter (options) {
    return _stubFn.call(options)
  }


}
