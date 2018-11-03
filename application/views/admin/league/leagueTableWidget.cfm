<cfoutput>
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="widget-title lighter smaller">
				Latest league table
			</h4>
		</div>

		<div class="widget-body">
			<div class="widget-main padding-20">
				#renderView( view="/admin/league/leagueTable", args=args )#
			</div>
		</div>
	</div>
	<br>
</cfoutput>