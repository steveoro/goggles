// Global variable (taken from a data attribute) to retrieve the maximum number of detail rows read by the controller.
// (instead of counting the actual HTML rows rendered -- which could be different, if any kind of pagination was used.)
var maxSeq = Number( $('#maxPartOrder').attr('data-value') );


/* Rebuild the auto-numbering sequence of the detail rows:
 */
function updateAutoSeq() {
  var fieldList = $('#sortable').first().find('input.autosequence');
  fieldList.each( function(index, element) {
    element.value = index + 1;
  });
};


/* Set-up the autocomplete widget on each element which has the right class type.
 *
 * The autocomplete AJAX call will be using the path
 * specified by the global variable exerciseAutocompleteURL.
 */
function setupAutocomplete() {
  $( ".exercise-autocomplete" ).autocomplete({
    source: function( request, response ) {
      // Get to the parent of the current row to find the select component:
// FIXME use a better selector instead of this junk:
      var selectTrainingEl = this.element.parent().parent().parent().find('.training_step_type');
      var idSelected = selectTrainingEl.val();
// DEBUG:
//      console.log( 'Selected: ID=' + idSelected );
      $.ajax(
        {
          url: exerciseAutocompleteURL,
          dataType: "json",
          data: {
            training_step_type_id: idSelected,
            query: request.term
//            limit: 20
          }
        }
      ).done(
        function( data ) {
          response( data );
        }
      );
    },
    select: function( event, ui ) {
      this.value = ui.item.label;
// FIXME use a better selector instead of this junk:
      this.parentElement.firstElementChild.firstElementChild.value = ui.item.value;
// DEBUG:
//      console.log( ui );
      return false; // this will stop further event handlers
    },
    minLength: 1
  });
};


/* Retrieve and set a single Exercise description via AJAX, using the path
 * specified by the global variable exerciseAutocompleteURL.
 *
 * Checkout the actual Rails exercises_controller.rb for the API specifications.
 */
function prepareSingleExerciseDescByAjax( exerciseId, textInputHTMLElem ) {
  $.ajax(
    {
      url: exerciseAutocompleteURL, // This URL will return in this case a single JSON object
      dataType: "json",
      data: {
        exercise_id: exerciseId
      }
    }
  ).done(
    function( data ) {
      textInputHTMLElem.value = data.label;
    }
  );
};


/*
 * Drop target implementation. --- WIP ---
 */
function dropOnRow( event, ui ) {
  console.log( event );
  console.log( ui );
};


/* Document OnReady: initialization
 */
$(document).ready( function(obj) {
  $('.spinner').spinner();
  setupAutocomplete();
  $( "#sortable" ).sortable({
    placeholder: "ui-state-highlight",
    beforeStop: updateAutoSeq
  });
  $( "li.goggles-sortable" ).droppable({
    accept: "li.goggles-sortable",
//    activeClass: "custom-state-active",
    drop: function( event, ui ) {
      dropOnRow( event, ui );
    }
  });

  // Set value for each exercise_desc, according to exercise_id
  $('input.numeric.exercise_id[type=hidden]').each( function(index, elem) {
    prepareSingleExerciseDescByAjax( elem.value, $('input.exercise-autocomplete').get(index) );
  });

  $('#training_rows').on( "cocoon:before-remove", function(e, training_row) {
      $(this).data('remove-timeout', 1000);
      training_row.fadeOut('slow');
    }
  ).on( "cocoon:after-insert", function(e, training_row_to_be_added) {
      $('.spinner').spinner();
      updateAutoSeq();
      setupAutocomplete();
    }
  ).on( "cocoon:after-remove", function() {
      updateAutoSeq();
  });


} );
