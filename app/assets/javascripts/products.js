$(document).ready(function(){
  Search.init();
})

Search = {
  init: function() {
		$("#lookup_options").autocomplete({
			source: $('#lookup_options').data('autocomplete-source'),
      select: function(event, ui) {
        $(this).val(ui.item.value);
        $("#search_form").submit();
      }
    });
  }
}
