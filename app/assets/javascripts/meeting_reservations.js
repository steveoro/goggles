/**
 * Formats the current value as a timing.
 */
function _formatTiming( currentValue, targetNode ) {
  // Remove formatting:
  var newValue = currentValue.replace( /[\'\.\:\"\,]/g, "" );
  // Enforce formatting:
  newValue = newValue.replace( /(?=(\d{2})$)/g, "\"" );
  newValue = newValue.replace( /(?=\B(\d{2})\D\d{2}$)/g, "\'" );
  targetNode.value = newValue;

  return true;
};
// --------------------------------------------------------------------------



/**
 * Enables or disables (and clears) a whole row of edit and checkbox controls,
 * depending on the value of the 'skip' switch identified by the badge_id.
 * The values are cleared in case 'skip' is checked.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 */
function toggleSkipRowControls( badge_id ) {
  var isNotComing = !!$( "#skip" + badge_id ).prop('checked');
  $( ".resRow" + badge_id ).prop( 'disabled', isNotComing );
  // Clear the fields:
  if ( isNotComing ) {
    $( '.timing.resRow' + badge_id ).val(null);
    $( '.timing.resRow' + badge_id ).data('value', null);
    $( 'textarea.resRow' + badge_id ).val(null);
    $( 'textarea.resRow' + badge_id ).data('value', null);
    $( '.switch-box-input.resRow' + badge_id ).prop('checked', false);
  }

  handleEditReservation( badge_id, null );
};



/**
 * Enables/disabled the whole row whenever the confirm switch label is toggled.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 */
function toggleConfirmSwitchValue( badge_id ) {
  var isConfirmed = !!$( "#confirm" + badge_id ).prop('checked');
  $( ".resRow" + badge_id ).prop( 'disabled', isConfirmed );

  handleEditReservation( badge_id, null );
};
// --------------------------------------------------------------------------



/**
 * Sets (or resets) the value of the text edit field for the registration timing
 * according to the boolean value of the boolean registration checkbox.
 * The value of timingText should typically come from a default value stored elsewhere.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 * - event_id:   the event_id used to identify the column
 * - timingText: text value to be set in the edit box if the checkbox is toggled on
 */
function toggleEventSwitchValue( badge_id, event_id, timingText ) {
  var textEdit   = $( "#time" + badge_id + "_" + event_id );
  var isChecked  = !!$( "#chk" + badge_id + "_" + event_id ).prop('checked');

  // Toggle the field value accordingly:
  if ( isChecked ) {
    textEdit.val( timingText );
    textEdit.data('value', timingText);
  }
  else {
    textEdit.val( null );
    textEdit.data('value', null);
  }

  handleEditReservation( badge_id, event_id );
};
// --------------------------------------------------------------------------



/**
 * After the reservation timing is done, auto-toggles the 'on' switch and
 * invokes the remote AJAX action.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 * - event_id:   the event_id used to identify the column
 */
function updateReservationTiming( badge_id, event_id ) {
  // DEBUG
  //console.log("updateReservationTiming(" + badge_id + ", " + event_id + ")");
  var textEdit  = $( "#time" + badge_id + "_" + event_id );
  var chkBox    = $( "#chk" + badge_id + "_" + event_id );
  // DEBUG
  //console.log( textEdit.data('value') );
  //console.log( textEdit.val() );

  // Auto-toggle checkbox accordingly:
  if ( textEdit.val() != null && textEdit.val() != '' ) {
    chkBox.prop('checked', true);
  }
  else {
    chkBox.prop('checked', false);
  }

  if ( textEdit.data('value') != textEdit.val() ) {
    // DEBUG
    //console.log('Changed!');
    $('#spinner').removeClass('hide');
    textEdit.data( 'value', textEdit.val() );

    handleEditReservation( badge_id, event_id );
  }
  //else {
    // DEBUG
    //console.log('No change detected: skipping.');
  //}

  return true;
};
// --------------------------------------------------------------------------



/**
 * Resets the value of the edit fields for the relay reservation if the toggle switch
 * is off and updates anyway the reservation.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 * - event_id:   the event_id used to identify the column
 */
function toggleRelaySwitchValue( badge_id, event_id ) {
  // DEBUG
  //console.log("toggleRelaySwitchValue(" + badge_id + ", " + event_id + ")");
  var objCode   = $( "#code" + badge_id + "_" + event_id );
  var objNum    = $( "#num" + badge_id + "_" + event_id );
  var isChecked = !!$( "#chk" + badge_id + "_" + event_id ).prop('checked');
  // DEBUG
  //console.log( objCode.data('value') +' / ' + objCode.val() );
  //console.log( objNum.data('value') +' / ' + objNum.val() );

  // Clear the fields when not set:
  if ( !isChecked ) {
    objCode.val( null );
    objCode.data('value', null);
    objNum.val( null );
    objNum.data('value', null);
  }

  handleEditReservation( badge_id, event_id );
};
// --------------------------------------------------------------------------



/**
 * Updates the relay reservation notes value for the current relay event
 * (identified by badge & event ID), depending upon the value of the 2 separate
 * edit fields for the Relay name and relay order.
 *
 * Params:
 * - badge_id:   the badge_id used to identify the row
 * - event_id:   the event_id used to identify the column
 */
function updateRelayNoteValues( badge_id, event_id ) {
  // DEBUG
  //console.log("updateRelayNoteValues(" + badge_id + ", " + event_id + ")");
  var objCode  = $( "#code" + badge_id + "_" + event_id );
  var objNum   = $( "#num" + badge_id + "_" + event_id );
  var chkBox   = $( "#chk" + badge_id + "_" + event_id );
  // DEBUG
  //console.log( objCode.data('value') +' / ' + objCode.val() );
  //console.log( objNum.data('value') +' / ' + objNum.val() );

  // Auto-toggle checkbox accordingly:
  if ( (objCode.val() != null && objCode.val() != '') ||
       (objNum.val() != null && objNum.val() != '') ) {
    chkBox.prop('checked', true);
  }
  else {
    chkBox.prop('checked', false);
  }

  // Any change?
  if ( (objCode.data('value') != objCode.val()) ||
       (objNum.data('value') != objNum.val()) ) {
    // DEBUG
    //console.log('Changed!');
    $('#spinner').removeClass('hide');
    objCode.data( 'value', objCode.val() );
    objNum.data( 'value', objNum.val() );
    var isNotComing = !!$( "#skip" + badge_id ).prop('checked');
    var isConfirmed = !!$( "#confirm" + badge_id ).prop('checked');

    handleEditReservation( badge_id, event_id );
  }
  //else {
    // DEBUG
    //console.log('No change detected: skipping.');
  //}

  return true;
};
// --------------------------------------------------------------------------
