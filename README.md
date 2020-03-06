# Configuration files for the Smart Plug's Exec Binding on OpenHAB2

These files must be placed into $OPENHAB_CONF folder, replacing/merging the already existing content.

## System Requirements

- OpenHAB 2.5.2;
- cURL;
- JQ;

## Instructions

1. After clean install, select *Standard* visualization;
2. Select *PAPER UI*;
3. Install Exec and Networks Bindings;
4. In *Add-ons* -> *Transformations*, select *Exec Transformation* and *RegEx Transformation*;
5. Create a visualization for the Smart Plug (in *HABPANEL*, for instance).

Observation: make sure `plug.sh` script has execution permission and the files in $OPENHAB_CONF is owned by the *openhab*.


