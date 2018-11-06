component extends="preside.system.base.AdminHandler" {

	property name="leagueTablesService" inject="CcmLeagueTablesService";
	property name="messageBox"          inject="messagebox@cbmessagebox";

	private void function rootBreadcrumb() {
		// no crumb
	}



	// private void function preLayoutRender( event, rc, prc, args={} ) {
	// 	prc.pageTitle = "Custom page title";
	// 	prc.pageIcon  = "fa-glass";
	// }
	// private void function preLayoutRenderForEditRecord( event, rc, prc, args={} ) {
	// 	prc.pageTitle = "Custom edit page title";
	// 	prc.pageIcon  = "fa-beer";
	// }



	// private boolean function checkPermission( event, rc, prc, args={} ){
	// 	var key           = args.key          ?: "";
	// 	var throwOnError  = args.throwOnError ?: "";
	// 	var isPermitted   = true;
	// 	var record        = prc.record ?: "";

	// 	if ( listFindNoCase( "add,edit,clone,delete", key ) && dayOfWeek( now() ) == 4 ) {
	// 		// don't allow adding or editing on a Wednesday!
	// 		isPermitted = false;
	// 	}

	// 	if ( isPermitted ) {
	// 		isPermitted = hasCmsPermission( permissionKey="datamanager.#key#" );
	// 	}

	// 	if ( throwOnError && !isPermitted ) {
	// 		event.adminAccessDenied();
	// 	}

	// 	return isPermitted;
	// }



	// private boolean function isOperationAllowed( event, rc, prc, args={} ) {
	// 	var operation = args.operation ?: "";

	// 	if ( listFindNoCase( "add,edit,clone", operation ) && dayOfWeek( now() ) == 1 ) {
	// 		// don't allow adding or editing on a Wednesday!
	// 		return false;
	// 	}
	// 	return operation != "delete";
	// }




	// private string function preRenderListing( event, rc, prc, args={} ) {
	// 	return '<p class="alert alert-danger">You can put a warning here.</p>';
	// }

	// private string function listingViewlet( event, rc, prc, args={} ) {
	// 	return '<p class="alert alert-danger">Listing has been completely overridden!</p>';
	// }



	// private void function preAddRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.validateUrlAndSelector( args.validationResult, args.formData );
	// }
	// private void function preCloneRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.validateUrlAndSelector( args.validationResult, args.formData );
	// }
	// private void function preEditRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.validateUrlAndSelector( args.validationResult, args.formData );
	// }



	// private void function postAddRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.updateLeagueTable( args.newId );
	// }
	// private void function postCloneRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.updateLeagueTable( args.newId );
	// }
	// private void function postEditRecordAction( event, rc, prc, args={} ) {
	// 	leagueTablesService.updateLeagueTable( args.formData.id );
	// }



	// private string function renderRecord( event, rc, prc, args={} ) {
	// 	args.league      = leagueTablesService.getLeague( args.recordId );
	// 	args.leagueTable = leagueTablesService.getLeagueTable( args.recordId );

	// 	return renderView( view="/admin/league/leagueTable", args=args );
	// }

	// private string function preRenderRecord( event, rc, prc, args={} ) {
	// 	args.league      = leagueTablesService.getLeague( args.recordId );
	// 	args.leagueTable = leagueTablesService.getLeagueTable( args.recordId );

	// 	return renderView( view="/admin/league/leagueTableWidget", args=args );
	// }



	// private void function extraRecordActionsForGridListing( event, rc, prc, args={} ) {
	// 	var objectName = args.objectName ?: "";
	// 	var record     = args.record     ?: {};
	// 	var recordId   = record.id       ?: "";

	// 	args.actions = args.actions ?: [];
	// 	args.actions.insertAt( 2, {
	// 		  link  = event.buildAdminLink( objectName=objectName, operation="refreshLeagueTable", recordid=recordId )
	// 		, icon  = "fa-refresh"
	// 		, title = "Refresh table"
	// 	} );
	// }



	// private void function extraTopRightButtonsForViewRecord( event, rc, prc, args={} ) {
	// 	var objectName = args.objectName ?: "";
	// 	var recordId   = prc.recordId    ?: "";

	// 	args.actions = args.actions ?: [];
	// 	args.actions.prepend( {
	// 		  link      = event.buildAdminLink( objectName=objectName, operation="refreshLeagueTable", recordId=recordId )
	// 		, btnClass  = "btn-info"
	// 		, iconClass = "fa-refresh"
	// 		, title     = "Refresh table"
	// 	} );
	// }

	// private string function buildRefreshLeagueTableLink( event, rc, prc, args={} ) {
	// 	var qs = "id=#( args.recordId ?: "" )#";

	// 	if ( Len( Trim( args.queryString ?: "" ) ) ) {
	// 		qs &= "&#args.queryString#";
	// 	}

	// 	return event.buildAdminLink( linkto="datamanager.ccm_league.refreshLeagueTable", querystring=qs );
	// }

	// public void function refreshLeagueTable( event, rc, prc, args={} ) {
	// 	var id = rc.id ?: "";

	// 	leagueTablesService.updateLeagueTable( id );
	// 	messageBox.info( "League table successfully updated." );
	// 	setNextEvent( url=event.buildAdminLink( objectName="ccm_league", recordId=id ) );
	// }



	// private void function extraTopRightButtonsForViewRecord( event, rc, prc, args={} ) {
	// 	var objectName = args.objectName ?: "";
	// 	var recordId   = prc.recordId    ?: "";

	// 	args.actions = args.actions ?: [];
	// 	args.actions.prepend( {
	// 		  link      = event.buildAdminLink( objectName=objectName, operation="viewLeagueTableSource", recordId=recordId )
	// 		, btnClass  = "btn-info"
	// 		, iconClass = "fa-globe"
	// 		, title     = "Table source"
	// 	} );
	// }

	// private string function buildViewLeagueTableSourceLink( event, rc, prc, args={} ) {
	// 	var qs = "id=#( args.recordId ?: "" )#";

	// 	if ( Len( Trim( args.queryString ?: "" ) ) ) {
	// 		qs &= "&#args.queryString#";
	// 	}

	// 	return event.buildAdminLink( linkto="datamanager.ccm_league.viewLeagueTableSource", querystring=qs );
	// }

	// public void function viewLeagueTableSource( event, rc, prc, args={} ) {
	// 	event.initializeDatamanagerPage(
	// 		  objectName = "ccm_league"
	// 		, recordId   = rc.id ?: ""
	// 	);
	// 	event.addAdminBreadCrumb(
	// 		  title = "League table source page"
	// 		, link  = ""
	// 	);

	// 	prc.leagueSourceUrl = prc.record.source_url;
	// 	prc.pageTitle       = "League table source";
	// 	prc.pageSubTitle    = prc.recordLabel;
	// 	prc.pageIcon        = "fa-globe";
	// }

}