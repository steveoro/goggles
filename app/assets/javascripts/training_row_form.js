var maxSeq = Number( $('#maxPartOrder').attr('data-value') );


function updateAutoSeq() {
  var fieldList = $('#sortable').first().find('input.autosequence');
  fieldList.each( function(index, element) {
    element.value = index + 1;
  });
};


function setupAutocomplete() {
  $( ".exercise-autocomplete" ).autocomplete({
    source: function( request, response ) {
      // Get to the parent of the current row to find the select component:
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
            query: request.term,
            limit: 20
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
// WIP / TODO use attribute selector 'data-ref' instead of this junk:
      this.parentElement.firstElementChild.firstElementChild.value = ui.item.value;
// DEBUG:
      console.log( ui );
      return false; // this will stop further event handlers
    },
    minLength: 2
  });
};


$(document).ready( function(obj) {
  $('.spinner').spinner();
  setupAutocomplete();
  $( "#sortable" ).sortable({
    placeholder: "ui-state-highlight",
    beforeStop: updateAutoSeq
  });

  // TODO set value for each exercise_desc, according to exercise_id

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
