#define BASE_BLUEPRINT_SPEED			0.3
#define BASE_BLUEPRINT_EFFICIENCY		0.3
#define BASE_BLUEPRINT_COMPRESSION		1
#define BASE_BLUEPRINT_INSTABILITY		0
#define BASE_BLUEPRINT_POWER			0.1

/decl/modpack/persistence/post_initialize()
	. = ..()
	GLOB.all_mainframe_roles += MF_ROLE_DESIGN