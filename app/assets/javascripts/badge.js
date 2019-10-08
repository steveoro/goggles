// Returns the custom-formatted DOM node to represent a single Swimmer JSON row result
function formatSwimmerRow(swimmer) {
  if (swimmer.loading) {
    return swimmer.text;
  }

  var $container = $(
    "<div class='select2-result-swimmer clearfix'>" +
      "<span class='select2-result-swimmer__name'></span>" +
      "&nbsp;<span class='select2-result-swimmer__birthyear small text-muted'><i class='fa fa-birthday-cake'></i>&nbsp;</span>" +
    "</div>"
  );
  $container.find(".select2-result-swimmer__name").text(swimmer.last_name + ' ' + swimmer.first_name);
  $container.find(".select2-result-swimmer__birthyear").append(swimmer.year_of_birth);

  return $container;
}
//------------------------------------------------------------------------------

// Returns the selection or the placeholder:
function formatSwimmerRowSelection(selection) {
  console.log('formatSwimmerRowSelection:');
  console.log(selection);
  return (selection.last_name + ' ' + selection.first_name) || selection.text;
}
//------------------------------------------------------------------------------


/*
 * Setup Select2 widgets:
 */
$(document).ready(function() {
  // $("#select2_season_id").select2({ theme: "bootstrap" });
  $("#select2_swimmer_id").select2({
    theme: "bootstrap",
    ajax: {
      url: "/api/v1/swimmers/unbadged",
      dataType: 'json',
      delay: 200,
      data: function (params) {
        return {
          s: $('#season_id').val(), // filtering season ID (all except this one)
          q: params.term            // search term for complete name
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;
        console.log('processResults:');
        console.log(data);

        return {
          results: data // data.items //,
          // pagination: {
          //   more: (params.page * 30) < data.total_count
          // }
        };
      },
      cache: true
    },
    placeholder: 'Search for a swimmer',
    minimumInputLength: 2,
    templateResult: formatSwimmerRow,
    templateSelection: formatSwimmerRowSelection
  })
});
