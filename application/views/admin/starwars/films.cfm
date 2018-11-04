<cfscript>
	films = args.films ?: "";
</cfscript>

<style>
	.widget-films {
		display: flex;
		flex-wrap: wrap;
	}
	.film-block {
		padding: 10px;
		text-align: center;
		flex: 0 1 170px;
	}
</style>

<cfoutput>
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="widget-title lighter smaller">
				<i class="fa fa-fw fa-film"></i>
				Films
			</h4>
		</div>

		<div class="widget-body">
			<div class="widget-main padding-20 widget-films">
				<cfloop query="films">
					<cfset link = event.buildAdminLink( objectName="starwars_film", recordId=films.id )>
					<div class="film-block">
						<a href="#link#">
							#trim( renderAsset( assetId=films.poster_art, args={ derivative="film_poster_medium" } ) )#
							<br>
							#films.title#
						</a>
					</div>
				</cfloop>
			</div>
		</div>
	</div>
</cfoutput>
