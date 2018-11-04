/**
 * @singleton
 * @presideService
 */

component {

	public any function init() {
		_setJSoup( "/app/lib/jsoup/jsoup-1.10.3.jar" );
		_setOffline( false );
		return this;
	}

// PUBLIC API
	public query function getLeague( required string id ) {
		return $getPresideObject( "ccm_league" ).selectData( id=arguments.id );
	}

	public query function getLeagueTable( required string id ) {
		return $getPresideObject( "ccm_league_table" ).selectData(
			  filter       = { league=arguments.id }
			, orderBy      = "sort_order"
			, selectFields = [
				  "sort_order"
				, "team_name"
				, "played"
				, "won"
				, "lost"
				, "tied"
				, "bonus"
				, "bat_points"
				, "bowl_points"
				, "pen_points"
				, "total"
				, "average"
				, "datemodified as last_updated"
			  ]
		);
	}

	public any function updateLeagueTable( required string id ) {
		var league     = $getPresideObject( "ccm_league" ).selectData( id=arguments.id );

		if ( _isOffline() ) {
			var doc = _getJSoup().parse( _getLocalFile( league.source_url ), "UTF-8", league.source_url );
		} else {
			var doc = _getJSoup().connect( league.source_url ).userAgent( "Mozilla" ).timeout( 10000 ).get();
		}
		var rows       = doc.select( league.table_rows_selector );
		var currentRow = 1;

		for( var row in rows ) {
			var teamName       = _getCellValue( row, league.team_name_col, league.team_name_subselector );
			var leagueTableRow = $getPresideObject( "ccm_league_table" ).selectData(
				  filter       = { league=league.id, team_name=teamName }
				, selectFields = [ "id" ]
			);
			var data           = {
				  league      = league.id
				, team_name   = teamName
				, sort_order  = currentRow
				, played      = _getCellValue( row, league.played_col )
				, won         = _getCellValue( row, league.won_col )
				, lost        = _getCellValue( row, league.lost_col )
				, tied        = _getCellValue( row, league.tied_col )
				, bonus       = _getCellValue( row, league.bonus_col )
				, bat_points  = _getCellValue( row, league.bat_points_col )
				, bowl_points = _getCellValue( row, league.bowl_points_col )
				, pen_points  = _getCellValue( row, league.pen_points_col )
				, total       = _getCellValue( row, league.total_col )
				, average     = _getCellValue( row, league.average_col )
			};

			if ( leagueTableRow.recordCount ) {
				$getPresideObject( "ccm_league_table" ).updateData( id=leagueTableRow.id, data=data );
			} else {
				$getPresideObject( "ccm_league_table" ).insertData( data=data );
			}

			currentRow++;
		}

		return true;
	}

	public void function validateUrlAndSelector( required any validationResult, required struct formData ) {
		var sourceUrl = arguments.formData.source_url          ?: "";
		var selector  = arguments.formData.table_rows_selector ?: "";

		if ( sourceUrl == "" || selector == "" ) {
			return;
		}

		try {
			if ( _isOffline() ) {
				var doc = _getJSoup().parse( _getLocalFile( sourceUrl ), "UTF-8", sourceUrl );
			} else {
				var doc = _getJSoup().connect( sourceUrl ).userAgent( "Mozilla" ).timeout( 10000 ).get();
			}
		}
		catch( any e ) {
			arguments.validationResult.addError( "source_url", "Source URL could not be reached" );
			return;
		}

		var rows = doc.select( selector );
		if ( !rows.len() || rows[ 1 ].nodeName() != "tr" ) {
			arguments.validationResult.addError( "table_rows_selector", "Table rows selector did not return any rows" );
		}
	}

// PRIVATE HELPERS
	private string function _getCellValue( required any row, required any col, string subselector="" ) {
		if ( val( arguments.col ) == 0 ) {
			return "";
		}
		return arguments.row.select( "td:eq(#arguments.col-1#) #arguments.subselector#" ).text();
	}

	private any function _getLocalFile( required string sourceUrl ) {
		var filename = reReplaceNoCase( lcase( arguments.sourceUrl ), "[^a-z0-9]+", "-", "all" );
		    filename = reReplace( filename, "-$", "" );
		var javaFile = createObject( "java", "java.io.File" );

		return javaFile.init( "/Developer/pixl8/presidecon-2018/assets/jsoup-offline/#filename#.html" );
	}

// GETTERS & SETTERS
	private void function _setJSoup( required string jarFile ) {
		_jSoup = createObject( "java", "org.jsoup.Jsoup", arguments.jarFile );
	}
	private any function _getJSoup() {
		return _jSoup;
	}

	private void function _setOffline( required boolean offline ) {
		_offline = arguments.offline;
	}
	private boolean function _isOffline() {
		return _offline;
	}

}