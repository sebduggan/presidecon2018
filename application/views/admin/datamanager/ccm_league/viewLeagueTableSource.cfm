<cfscript>
	leagueSourceUrl = prc.leagueSourceUrl ?: "";
</cfscript>

<cfif len( leagueSourceUrl )>
	<cfoutput>
		<iframe src="#leagueSourceUrl#" width="100%" height="600">
	</cfoutput>
</cfif>