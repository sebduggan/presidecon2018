<cfscript>
	league      = args.league      ?: queryNew("");
	leagueTable = args.leagueTable ?: queryNew("");
</cfscript>

<cfoutput>
	<cfif leagueTable.recordCount>
		<table class="table">
			<thead>
				<tr>
					<th>Team</th>
					<cfif val( league.played_col )><th>P</th></cfif>
					<cfif val( league.won_col )><th>W</th></cfif>
					<cfif val( league.lost_col )><th>L</th></cfif>
					<cfif val( league.tied_col )><th>T</th></cfif>
					<cfif val( league.bonus_col )><th>Bon</th></cfif>
					<cfif val( league.bat_points_col )><th>Bat</th></cfif>
					<cfif val( league.bowl_points_col )><th>Bowl</th></cfif>
					<cfif val( league.pen_points_col )><th>Pen</th></cfif>
					<cfif val( league.total_col )><th>Total</th></cfif>
					<cfif val( league.average_col )><th>Ave</th></cfif>
				</tr>
			</thead>
			<tbody>
			<cfloop query="leagueTable">
				<tr>
					<td>#leagueTable.team_name#</td>
					<cfif val( league.played_col )><td>#leagueTable.played#</td></cfif>
					<cfif val( league.won_col )><td>#leagueTable.won#</td></cfif>
					<cfif val( league.lost_col )><td>#leagueTable.lost#</td></cfif>
					<cfif val( league.tied_col )><td>#leagueTable.tied#</td></cfif>
					<cfif val( league.bonus_col )><td>#leagueTable.bonus#</td></cfif>
					<cfif val( league.bat_points_col )><td>#leagueTable.bat_points#</td></cfif>
					<cfif val( league.bowl_points_col )><td>#leagueTable.bowl_points#</td></cfif>
					<cfif val( league.pen_points_col )><td>#leagueTable.pen_points#</td></cfif>
					<cfif val( league.total_col )><td>#leagueTable.total#</td></cfif>
					<cfif val( league.average_col )><td>#decimalFormat( leagueTable.average )#</td></cfif>
				</tr>
			</cfloop>
			</tbody>
		</table>

		<p><em>Last updated: #dateTimeFormat( leagueTable.last_updated )#</em></p>
	<cfelse>
		<p>There is currently no league table data for this league.</p>
	</cfif>
</cfoutput>