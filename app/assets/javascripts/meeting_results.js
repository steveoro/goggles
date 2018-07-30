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
 * AJAX response buffer.
 * Stores the actual array of objects returned by the AJAX request.
 */
var responseSwimmerNamesBuffer = [];

/**
 * Datum tokenizer for the Bloodhound suggestion engine.
 * Returns the datum tokenized into a comparable string.
 */
function tokenizeRelaySwimmerName( datum ) {
  // Extract just the name part:
  // DEBUG
  //console.log( "tokenizeRelaySwimmerName datum splitted: ", detokenizeRelaySwimmerName(datum) );
  return Bloodhound.tokenizers.obj.whitespace( detokenizeRelaySwimmerName(datum)[0] );
}



/**
 * De-tokenizer for composed results.
 * Splits a specified datum using '|' as separator.
 * Returns an array of string tokens, in which, allegedly, the order should be:
 * 1. Swimmer#complete_name
 * 2. Swimmer#year_of_birth (as a string number)
 * 3. Swimmer#gender_type_id (as a string number)
 * 4. remote Swimmer ID (as a string number)
 */
function detokenizeRelaySwimmerName( datum ) {
  return datum.split("|");
}



/**
 * Remote response adapter for the Bloodhound suggestion engine.
 * It is expected to return a list of tokenized names, ready to be compared/matched.
 */
function transformRelaySwimmerNamesResponse( data ) {
  // DEBUG
  //console.log( "transformRelaySwimmerNamesResponse response:" );
  //console.log( data );

  // Clear & rebuild the result list and the list of searchable names:
  var responseSwimmerNamesBuffer = [];

  // Since we're bound to return a list of tokenized & comparable strings,
  // we'll store the additional data to display into the same result row,
  // concatenated with an underscore (which is surely not used for a name).
  for ( idx = 0; idx < data.length; idx++ ) {
    var composedName = data[idx].complete_name  + "|" +
                       data[idx].year_of_birth + "|" +
                       data[idx].gender_type_id + "|" + data[idx].id;
    responseSwimmerNamesBuffer.push( composedName );
  };
  // DEBUG
  //console.log( "responseSwimmerNamesBuffer:" );
  //console.log( responseSwimmerNamesBuffer );
  return responseSwimmerNamesBuffer;
}
// --------------------------------------------------------------------------



/**
 * Initializes the TypeAhead bundle for the Relay-Swimmers names request
 */
function initTypeAheadForRelaySwimmers() {
  // DEBUG
  console.log('Destroying Typeahead');
  $('.typeahead').typeahead('destroy');

  // DEBUG
  console.log('Initializing Typeahead');
  // Define the typeahead callback handlers:
  $(".relay_swimmer").typeahead(
    { minLength: 3, highlight: true },
    typeAheadRelaySwimmerOptions
  ).bind( 'typeahead:select',
    function( ev, suggestion ) {
      // DEBUG
      //console.log('Selection: ', suggestion);
      // Extract the ID part from the combined string:
      var remote_id = detokenizeRelaySwimmerName( suggestion )[3];
      // DEBUG
      //console.log( "remote_id: ", remote_id );
      //console.log( "ev.target: ", ev.target );

      // Call the remote editing action only if there's an actual change:
      if ( ev.target.dataset['swimmer'] != remote_id ) {
        ev.target.dataset['swimmer'] = remote_id;
        performEditRelaySwimmer( ev.target );
      }
    }
  );
}
// --------------------------------------------------------------------------


/**
 * Detects a change in the values and calls the remote editing action.
 * This can only be used by the text edits for the timing and the reaction time.
 *
 * [Steve, 20180730] As of the Bootstrap 3.x version that we are currently using
 * seems that:
 *
 * - onchange event: fired correctly in Firefox, yields an error (for Bootstrap) in Chrome
 * - onfocusout event: fired correctly in Chrome, seems not firing in Firefox
 *
 * Thus, we will use both events to in order to support both browsers.
 */
function handleEditRelaySwimmer( currNode ) {
  // DEBUG
  console.log('handleEditRelaySwimmer: called.');
  //console.log( currNode.dataset['value'] );
  //console.log( currNode.value );

  if ( currNode.dataset['value'] != currNode.value ) {
    // DEBUG
    console.log('Changed! => ' + currNode.value);
    performEditRelaySwimmer( currNode );
  }

  return true;
};
// --------------------------------------------------------------------------


// DEBUG
/*
$(document).on('page:partial-load', function() {
  console.log('page:partial-load');
});
$(document).on('DOMContentLoaded', function() {
  console.log('DOMContentLoaded');
});
$(document).on('page:load', function() {
  console.log('page:load');
});
$(document).on('page:fetch', function() {
  console.log('page:fetch');
});
$(document).on('page:restore', function() {
  console.log('page:restore');
});
$(document).on('ready', function() {
  console.log('ready');
});
document.addEventListener("turbolinks:before-cache", function() {
  console.log('turbolinks:before-cache');
});
*/
// --------------------------------------------------------------------------


document.addEventListener("turbolinks:load", function() {
  // DEBUG
  //console.log('turbolinks:load');
  if ( $(".typeahead").size() > 0 ) {
    initTypeAheadForRelaySwimmers();
  }
});
// --------------------------------------------------------------------------
