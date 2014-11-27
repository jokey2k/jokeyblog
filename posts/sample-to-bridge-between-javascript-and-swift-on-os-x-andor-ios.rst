.. title: Sample to Bridge between JavaScript and Swift on OS X and/or iOS
.. slug: sample-to-bridge-between-javascript-and-swift-on-os-x-andor-ios
.. date: 2014-11-10 00:02:36 UTC+01:00
.. tags: osx,ios,tips
.. link:
.. description:
.. type: text

It took me half a day of experimenting with it as I could not find some useful information on the web. So here is an example playground on how to play with JavaScript from Swift.

.. code-block:: swift

	import Cocoa
	import WebKit

	// Create class which we later hook into the javascript side of the world
	class ScriptBridge : NSObject {

	    // Sample function with single parameter
	    func doubleNumber(number: Float) -> Float {
	        return number*2
	    }

	    // Sample function with multiple parameters
	    func getColorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> NSColor {
	        return NSColor(red: red, green: green, blue: blue, alpha: alpha)
	    }

	    // Create alias in javascript env so that one can call bridge.getColor(...)
	    // instead of bridge.getColorWith_green_blue_alpha_(...)
	    override class func webScriptNameForSelector(aSelector: Selector) -> String!  {
	        switch aSelector {
	        case Selector("getColorWith:green:blue:alpha:"):
	            return "getColor"
	        default:
	            return nil
	        }
	    }

	    // Only allow the two defined functions to be called from JavaScript
	    // Same applies to variable access, all blocked by default
	    override class func isSelectorExcludedFromWebScript(aSelector: Selector) -> Bool {
	        switch aSelector {
	        case Selector("getColorWith:green:blue:alpha:"):
	            return false
	        case Selector("doubleNumber:"):
	            return false
	        default:
	            return true
	        }
	    }
	}

	// Init a WebView and hook up our bridge
	let webView = WebView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
	let scriptObject = webView.windowScriptObject
	let bridge = ScriptBridge()
	scriptObject.setValue(bridge, forKey: "bridge")

	// Function returns native Object
	let color = scriptObject.evaluateWebScript("bridge.getColor(1.0,0.8,0.6,1.0)")

	// Function returns JSON, so convert back to something we can use
	var error: NSError?
	let jsonContent = scriptObject.evaluateWebScript("JSON.stringify([1,2,3,4,5])")
	let jsonData = NSString(string: jsonContent as String).dataUsingEncoding(NSUTF8StringEncoding)!
	let jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error)
