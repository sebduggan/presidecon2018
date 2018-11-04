<cfscript>
	poster_art = args.poster_art ?: "";
</cfscript>

<cfif poster_art.len()>
	<cfoutput>
		<div class="widget-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
					Movie poster
				</h4>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-20">
					#renderAsset( assetId=poster_art )#
				</div>
			</div>
		</div>
	</cfoutput>
</cfif>