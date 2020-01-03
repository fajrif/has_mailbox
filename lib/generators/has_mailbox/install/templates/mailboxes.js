$(function() {
	// Check all the checkboxes when the head one is selected
	$(document).on('click', 'input.checkall', function() {
	  $("input[type='checkbox']").attr('checked', $(this).is(':checked'));
	});

	// change current active tabs styles
	$(document).on('click', '.ui-state-default a', function() {
		$('.ui-state-default').removeClass("ui-tabs-selected");
		$('.ui-state-default').removeClass("ui-state-active");
		$(this).parent().addClass("ui-tabs-selected");
		$(this).parent().addClass("ui-state-active");
		history.pushState(null, document.title, this.href);
	});

	// handle pagination through ajax
	$(document).on("click", '#tabs-messages .pagination a', function(e) {
		e.preventDefault();
		$.getScript(this.href);
		history.pushState(null, document.title, this.href);
	});

	//bind window for postate
	$(window).bind("popstate", function() {
		$.getScript(location.href);
	});

});
