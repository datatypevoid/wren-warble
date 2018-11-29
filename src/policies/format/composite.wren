/*
 * Imports
 */

import "../../formatPolicy" for FormatPolicy


/*
 * Structures
 */

class CompositeFormatPolicy is FormatPolicy {


  /*
   * Methods
   */

  construct new (formatPolicyList) {

    if (formatPolicyList is List == false) {
      Fiber.abort("Expected 'List' for 'formatPolicyList' parameter; got %(formatPolicyList.type).")
    }

    if (formatPolicyList.count == 0) {
      Fiber.abort("One or more format policy instances are required to create a composite format policy.")
    }

    for (policy in formatPolicyList) {
      if (policy is FormatPolicy == false) {
        Fiber.abort("Invalid type for FormatPolicy: %(policy.type)")
      }
    }

    _formatPolicies = formatPolicyList

  }


  format (options) {

    for (policy in _formatPolicies) {
      policy.format(options)
    }

  }


}
