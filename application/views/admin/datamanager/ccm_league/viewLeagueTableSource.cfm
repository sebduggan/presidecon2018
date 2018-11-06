<cfscript>
	leagueSourceUrl           = prc.leagueSourceUrl           ?: "";
	// postViewLeagueTableSource = prc.postViewLeagueTableSource ?: "";
</cfscript>

<cfoutput>
	<cfif len( leagueSourceUrl )>
		<iframe src="#leagueSourceUrl#" width="100%" height="600"></iframe>
	</cfif>

	<!--- #postViewLeagueTableSource# --->
</cfoutput>