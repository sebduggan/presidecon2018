/**
 * @noLabel
 * @dataManagerGroup            CCM
 * @dataManagerGridFields       league,team_name,sort_order
 * @dataManagerDefaultSortOrder league.team, sort_order
 */

component {
	property name="league"      relationship="many-to-one" relatedTo="ccm_league" required=true onDelete="cascade";
	property name="team_name"   type="string"  dbtype="varchar" maxlength=50  required=true;
	property name="sort_order"  type="numeric" dbtype="int";
	property name="played"      type="numeric" dbtype="int";
	property name="won"         type="numeric" dbtype="int";
	property name="lost"        type="numeric" dbtype="int";
	property name="tied"        type="numeric" dbtype="int";
	property name="bonus"       type="numeric" dbtype="int";
	property name="bat_points"  type="numeric" dbtype="int";
	property name="bowl_points" type="numeric" dbtype="int";
	property name="pen_points"  type="numeric" dbtype="int";
	property name="total"       type="numeric" dbtype="int";
	property name="average"     type="numeric" dbtype="float";
}