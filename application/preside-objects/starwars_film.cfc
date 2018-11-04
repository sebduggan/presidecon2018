/**
 // * @minimalGridFields title,episode_id,release_date
 */

component {
	property name="poster_art" relationship="many-to-one" relatedTo="asset" allowedTypes="image"; // adminrenderer="PosterArt" adminViewGroup="poster";

	// property name="swapi_id"   adminViewGroup="system";
	// property name="species"    adminViewGroup="related";
	// property name="starships"  adminViewGroup="related";
	// property name="vehicles"   adminViewGroup="related";
	// property name="characters" adminViewGroup="related";
	// property name="planets"    adminViewGroup="related";
}