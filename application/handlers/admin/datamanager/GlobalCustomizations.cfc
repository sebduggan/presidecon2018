component {

	// private boolean function checkPermission( event, rc, prc, args={} ){
	// 	var key           = args.key          ?: "";
	// 	var throwOnError  = args.throwOnError ?: "";
	// 	var isPermitted   = true;
	// 	var record        = prc.record ?: "";

	// 	if ( listFindNoCase( "add,edit,clone,delete", key ) && dayOfWeek( now() ) == 4 ) {
	// 		// don't allow adding or editing on a Wednesday!
	// 		isPermitted = false;
	// 	}

	// 	if ( isPermitted ) {
	// 		isPermitted = hasCmsPermission( permissionKey="datamanager.#key#" );
	// 	}

	// 	if ( throwOnError && !isPermitted ) {
	// 		event.adminAccessDenied();
	// 	}

	// 	return isPermitted;
	// }

}