component {

	property name="dao" inject="presidecms:object:starwars_species";

	// private string function postRenderRecordRightCol( event, rc, prc, args={} ) {
	// 	args.films = dao.selectData(
	// 		  id           = args.recordId
	// 		, selectFields = [ "films.id", "films.title", "films.poster_art" ]
	// 		, orderBy      = "films.episode_id"
	// 	);

	// 	return renderView( view="/admin/starwars/films", args=args );
	// }

}