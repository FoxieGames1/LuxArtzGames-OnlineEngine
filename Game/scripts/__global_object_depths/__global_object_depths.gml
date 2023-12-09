function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -10; // objPlayer
	global.__objectDepths[1] = -1000; // objCamera
	global.__objectDepths[2] = 0; // objCameraCentered
	global.__objectDepths[3] = 0; // objPlayerCam
	global.__objectDepths[4] = 0; // objScreen
	global.__objectDepths[5] = 0; // objStartPo
	global.__objectDepths[6] = 0; // objVars


	global.__objectNames[0] = "objPlayer";
	global.__objectNames[1] = "objCamera";
	global.__objectNames[2] = "objCameraCentered";
	global.__objectNames[3] = "objPlayerCam";
	global.__objectNames[4] = "objScreen";
	global.__objectNames[5] = "objStartPo";
	global.__objectNames[6] = "objVars";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
