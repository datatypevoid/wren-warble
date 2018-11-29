/*
 * Imports
 */

import "../../../formatPolicy" for FormatPolicy
import "./color" for ANSIStyle


/*
 * Structures
 */

class ANSIFormatPolicy is FormatPolicy {


  /*
   * Methods
   */

  construct new (foreground) {
    _modifiers = [foreground]
  }


  construct new (foreground, background) {
    _modifiers = [foreground, background]
  }


  construct new (foreground, background, style) {
    _modifiers = [foreground, background, style]
  }


  format (options) {

    var setModifiers = _modifiers.where { |mod|
      return mod
    }

    var modifierCodes = setModifiers.map { |mod|
      return mod[2..(mod.count - 2)]
    }

    var result = []

    result.add("\u001b[%(modifierCodes.join(";"))m")
    result.add(options["format"] || "")
    result.add(ANSIStyle.Reset)

    options["format"] = result.join("")

  }


}
