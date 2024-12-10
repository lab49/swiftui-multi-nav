# MultiNav
A SwiftUI navigation scheme (iOS 17 only), providing an easy-to-use interface for presenting Views, and managing ViewModels.

## Features

- The Navigation stack is managed using **push()**, **pop()**, **popToRoot()**, and **jumpTo()**, from either the View, or ViewModel. 
- All Views belonging to a given Navigation stack are defined in one central location (**NavigationScreenDefinition** enum).
- Simplified, standardized modal presentation.
- All ViewModels are owned, and their lifetimes managed, by a central **NavigationCoordinator** (and not by other Views, or ViewModels).
- A single instance of a ViewModel can be shared between multiple Views.

## Limitations

- The **NavigationCoordinator** supports no more than one ViewModel per View.
- Each View/ViewModel combo must be uniquely identifiable by one or more **Hashable** elements.

## Modals

A parent View can easily present a child View as a sheet, or a fullScreenCover.  Alerts can be easily presented, and managed as well.  In order to do this:

 1. The parent ViewModel must inherit from **ModalPresenter**.
 2. The parent View must use the **.modalPresenting()** view modifier.
 3. The presented (child) View must be defined in the same **NavigationScreenDefinition** enum as its parent View.
 4. **ModalPresenter.presentModal()**, and **ModalPresenter.presentAlert()** can be used from either the View, or the ViewModel.

## Technical Notes

### NavigationRootView
Represents the root of a navigation stack.  An app can contain one or more of these.  Each one requires its own instance of **NavigationCoordinator**, which in turn requires a **NavigationScreenDefinition** enum.

### NavigationScreenDefinition
Protocol. Typically implemented by an enum, with associated values. Each instance (enum case) corresponds to a screen in the app.

### NavigationScreenDefinition.screenView()
This func must be implemented to return the actual View corresponding to each **NavigationScreenDefinition** instance.  This may also involve creating a corresponding ViewModel.

### NavigationCoordinator
The relevant instance of this is automatically available (via Environment) to every View under a given navigation stack (**NavigationRootView**).  It can also be provided to any ViewModel, upon creation.

### NavigationCoordinator.push(), pop(), popToRoot()
Can be called from View, or ViewModel, as needed.

### NavigationCoordinator.jumpTo()
Replaces the entire navigation stack with another one, in a single call.

### NavigationCoordinator.observable(for: default:)
Call this func to create and register a ViewModel, or simply return it, if it already exists.  *(ViewModels are automatically released when their corresponding Views are dismissed).*  Typically used within **NavigationScreenDefinition.screenView()**, during View creation.

### ModalPresentor
Make this the superclass of a ViewModel in order to facilitate modal presentation of Views from either it, or its corresponding View.  This also facilitates flexible presentation and handling of alerts.
- The corresponding View must apply the **.modalPresenting()** view modifier (wherever the .sheet(), or .fullScreenCover() modifiers would be used).
- A single **ModalPresentor** ViewModel cannot be shared across more than one View needing to present child Views modally.

### ModalPresentor.presentModal(_: isFullScreen:)
Can be called from View, or ViewModel, as needed.

### ModalPresentor.presentAlert()
Can be called from View, or ViewModel, as needed.

### ModalPresentor.handleAlertButton(id:)
Override this func in a ViewModel.  It is called whenever an alert button is tapped.
