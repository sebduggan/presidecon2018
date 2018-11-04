/**
 * @versioned                   false
 * @dataManagerEnabled          true
 * @dataManagerGridFields       season,team,name
 * @dataManagerDefaultSortOrder season desc,team
 */

component {
	property name="label"                 type="string"  formula="concat( ${prefix}season, ': ', ${prefix}name )" required=false;
	property name="name"                  type="string"  dbtype="varchar" maxlength=50  required=true;
	property name="season"                type="numeric" dbtype="int"                   required=true;
	property name="team"                  type="string"  dbtype="varchar" maxlength=50  required=true;

	property name="source_url"            type="string"  dbtype="varchar" maxlength=200 required=true;
	property name="table_rows_selector"   type="string"  dbtype="varchar" maxlength=200 required=true;
	property name="team_name_subselector" type="string"  dbtype="varchar" maxlength=200;
	property name="team_name_col"         type="numeric" dbtype="int";
	property name="played_col"            type="numeric" dbtype="int";
	property name="won_col"               type="numeric" dbtype="int";
	property name="lost_col"              type="numeric" dbtype="int";
	property name="tied_col"              type="numeric" dbtype="int";
	property name="bonus_col"             type="numeric" dbtype="int";
	property name="bat_points_col"        type="numeric" dbtype="int";
	property name="bowl_points_col"       type="numeric" dbtype="int";
	property name="pen_points_col"        type="numeric" dbtype="int";
	property name="total_col"             type="numeric" dbtype="int";
	property name="average_col"           type="numeric" dbtype="int";

}