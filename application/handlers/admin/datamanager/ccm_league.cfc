component {

	property name="leagueTablesService" inject="CcmLeagueTablesService";
	property name="messageBox"          inject="messagebox@cbmessagebox";

	private void function rootBreadcrumb() {
		// no crumb
	}

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

}