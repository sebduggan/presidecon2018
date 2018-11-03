<cfscript>
	if ( hasCmsPermission( "leagues.read" ) ) {
		WriteOutput( renderView(
			  view = "/admin/layout/sidebar/_menuItem"
			, args = {
				  active  = event.getCurrentEvent().reFindNoCase( "^admin\.datamanager\." ) && ( prc.objectName ?: "" ) == "ccm_league"
				, link    = event.buildAdminLink( objectName="ccm_league" )
				, icon    = "fa-list-ol"
				, title   = "Leagues"
			  }
		) );
	}
</cfscript>