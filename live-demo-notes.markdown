# Star Wars data demo:

- show objects in Data Manager
- view film object listing - grid fields cusomisation is already in place
- view "A New Hope". Doesn't look too good! Overflows etc.
- add @minimalGridFields to objects
- reload: looks much better now

## Custom admin renderer
- what about our poster art field? Links to asset record, but thumbnail not all that useful...
- Add a custom admin renderer: "PosterArt" (same as core, but larger image)
- Assign properties to adminViewGroups (show config in object properties). Base groups are "default" (left) and "system" (right)
- reload: Already looking a lot better

## Convention-based customisation
- Let's now look at a species: Wookiee
- This could be made to look a bit nicer too. First let's set films adminViewRenderer to "none" - will completely hide that field from the default data view
- Our first look at Data Manager customising by convention. Create handler in `handlers/admin/datamanager/object_name.cfc`
- Create a method `postRenderRecordRightCol()`. This will get args objectName, recordId and version (if versioned), and should return a string which will be renderer after the other right column items
- Documentation is your friend! Describes all the customisation methods, the arguments they receive, and what they should return
- Renders and returns a view. Demonstrate the data manager link building.
- Reload: ta-da!


# CCM League Tables demo

## First-class citizen
- add `@dataManagerEnabled true` in place of `@dataManagerGroup`, and object will exist outside the Data Manager page, but with all the functionality of the Data Manager
- can add a custom link to the admin sidebar menu (Config.cfc, views/admin/layout/sidebar/). Show buildAdminLink() again, with just objectName
- can customise the breadcrumb parts - `rootBreadcrumb()`, `objectBreadCrumb()`, `recordBreadCrumb()`.
- Default root is datamanager if a dataManagerGroup is specified, else empty. Can customise to reflect the hierarchy of your admin app.
- Default object is link to the object listing
- Default record is link to the record view page

## Overview
- Quick explanation: sports club, with various teams in different leagues. Define the leagues, but also include configuration for Preside to scrape external league tables using jSoup and import data to Preside
- jSoup is a Java library for parsing HTML, with a jQuery-like syntax for selecting elements

## Added validation on record save
- Enable pre[Add|Edit|Clone]RecordAction. Gets passed objectName, formData, validationResult (and existingRecord). Runs after main validation is run, but before the result of this is acted upon.
- Show the validateUrlAndSelector() method in the service.
- You can run logic that will modify the validation result - here we are checking if the URL and selector return valid results.
- Demonstrate validation failing.

## Refresh league table after add/edit/clone
- Enable post[Add|Edit|Clone]RecordAction. Gets passed objectName, formData, validationResult (and existingRecord). Runs after record is saved.
- Calls the updateLeagueTable() method in the service when the league record is saved. Doesn't return a value, so default action (redirect to listing/record) will follow.
- If desired, could do a custom redirect using setNextEvent()

## Use preRenderRecord() to add league table at top
- We should now have the scraped league table data in Preside - we could look at this in the Data Manager, but we can do better than this
- Previously saw `postRenderRecordRightCol()`. Here we'll use `preRenderRecord()`, which outputs content above both columns in the record view.
- Like before, we get objectName, recordId, version
- Like before, we return a rendered view

## Render record - replace complete record view
- To be honest, once the league is configured, we don't really need to see the configuration every time we view the record.
- By using `renderRecord()` we can customise the whole of the view record output, completely discarding Preside's default data view
- Title, breadcrumb, buttons and versioning are still provided; we just define the data view
- Edit handler to use renderRecord().
- Show that we still have the edit button, which still allows us to edit the configuration.

## Custom top right button + action
- Currently, the league tables are fetched automatically when we save the configuration.
- We would also likely add a scheduled task to do this hourly/daily/whatever
- Would be nice though to create a custom action in the data manager that would let us manually fetch the latest data
- Enable `extraTopRightButtonsForViewRecord()` - gets passed args.actions, an array of button actions, which we can add to or modify
- (similar method `getTopRightButtonsForViewRecord()` will let you completely override the actions with your own logic)
- Notice the link build command - `operation="refreshLeagueTable"`. Preside doesn't know how to build this link, so we need to tell it
- `build{operation}Link` - in this case `buildRefreshLeagueTableLink()` - build a link to the public method which does the action
- calls the service method then redirects back to the record page with a confirmation message

## Custom data manager page
- as above, but use `initializeDataManagerPage()` to set up all the default page requirements
	- prc.recordId: id of the current record being viewed
	- prc.record: current record being viewed
	- prc.recordLabel: rendered label field for the current record
	- prc.objectName: current object name
	- prc.objectTitle: translated title of the current object
	- prc.objectTitlePlural: translated plural title of the current object
- set title etc. in prc scope

## Custom grid listing action
- We could also add this action into the record listing actions
- Enable `extraRecordActionsForGridListing()`. Works the same way as the previous, but is passed each individual record to work with

## preLayoutRender()
- gives access to the page content just before it is rendered
- can change things on the fly like page title, pageicon etc - all in the `prc` scope
- target specific pages with e.g. `preLayoutRenderForEditRecord()`

## Custom permissions
- Enable `checkPermission()` to add custom permission checking for operations
- Can check against Preside's general permissioning system
- Can also include complex permissioning logic based on other factors - for example, data contained in the record itself, or some other logic completely
- The example given will prevent add, edit, clone or delete on a Wednesday

- related is `isOperationAllowed()`. This defines whether an operation is allowed on an object, whereas `checkPermission()` checks whether the _current user_ has permission to do something
- you _could_ set either @dataManagerAllowedOperations or @dataManagerDisallowedOperations on the object for simple settings; but this method allows extra logic
- Example prevents delete at all times, and prevents add, edit, clone on a Wednesday
- Note that any logic in `isOperationAllowed()` will _completely_ replace settings made in the annotations

## Global customisations
- Allows default customisations for all data manager objects - `GlobalCustomisations.cfc`
- Works in exactly the same way as the object-specific ones
- Note the customisation hierarchy: if a customisation is set up at an object level, it will be used; otherwise, the global one is used, if defined. They do not merge or combine - only one is ever run.

## Create your own customisation
- Useful if, for instance, building an extension with a custom page
- Would allow developers to tap into Data Manager customisation for that page when implementing in an app
