# CBLightSidePanelViewController
CBLightSidePanelViewController is a very lightweight implementation of a side panel view controller paradigm.

## Todo
* Rudimentary functionality
* Tests
* Multiple directions for revelation

## Example
When fully functional, an instance of CBLightSidePanelViewController would be called in your applicationDidFinishLaunchingWithOptions
and be set as the window's root view controller.

```objc
CBLightSidePanelViewController *sp = [CBLightSidePanelViewController sharedInstance];
[sp setSidePanelViewController:menuVC forDirection:CBLightSidePanelDirectionLeft];
self.window.rootViewController = sp;
```
