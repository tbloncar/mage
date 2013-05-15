// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Show form help tips on corresponding input click
$('.form-text-input').focus(function() {
	if($(this).attr('id') != "panel") {
		$(this).next().removeClass('no').addClass('form-help');
	}
});
$('.form-text-input').blur(function() {
	if($(this).attr('id') != "panel") {
		$(this).next().removeClass('form-help').addClass('no');
	}
});
// Remove messages on span 'x' click
$('.message span').click(function() {
	$(this).parent().parent().fadeOut(1500);
})
$('#delete').keyup(function() {
	v = $(this).val();
	$(this).val(v.toUpperCase());
	if (v.toUpperCase() == "DELETE") {
		$(".delete-button").removeAttr('disabled');
	}
	else {
		$(".delete-button").attr('disabled','disabled');
	}
});
// Confirm deletion of account
function confirm_delete() {
	$('#delete').val('');
	r = confirm('Are you sure you want to delete your account permanently?');
	if(r == true) {
		return r;
	}
	else {
		$('.delete-button').attr('disabled','disabled');
		return r;
	}
};
// Validate password confirmation
$('#password_confirmation').blur(function() {
	c = $(this).val();
	console.log(c);
	p = $('#password').val();
	console.log(p);
	if(c != p) {
		$(this).attr('style','border-color: #ff3030 !important;');
	}
	else if(c == p)
		$(this).attr('style','border-color: #bbb');
});
// Change value of edit checkbox on change
$('#panel').change(function() {
	if($(this).is(':checked')) {
		$(this).attr('checked', true);
	}
	else {
		$(this).attr('checked', false);
	}
});
$('.unfollow-button').hover(function() {
	$(this).text('Unfollow');
},
	function() {
		$(this).text('Following');
});
// Drag and drop for bundles
$('.bundle-choose-image').draggable( {
	cursor: 'move',
	containment: '.bundle-choose',
	start: handleDragStart,
	revert: function(event, ui) {
            $(this).data("uiDraggable").originalPosition = {
                top : 0,
                left : 0
            };
       			return !event;
       		}
});
$('.bundle-choose-drop-spot').droppable( {
	accept: '.bundle-choose-image',
	drop: handleDropEvent,
	out: handleOutEvent,
	hoverClass: 'can-drop'
});
function handleDropEvent( event, ui ) {
	var draggable = ui.draggable;
	$(this).droppable('option', 'accept', ui.draggable);
	ui.draggable.position( { of: $(this), my: 'left top', at: 'left top' } );
	ui.draggable.addClass('dropped');
	$('#add-resources').val($('#add-resources').val() + '|' + ui.draggable.data('resource'));
}
function handleOutEvent( event, ui ) {
  $(this).droppable('option', 'accept', '.bundle-choose-image'); 
}
function handleDragStart( event, ui ) {
	if($(this).hasClass('dropped')) {
		value = $('#add-resources').val();
		id = $(this).data('resource');
		value_array = value.split('|');
		value_array[value_array.indexOf(id.toString())] = '';
		new_value = value_array.join('|');
		while (new_value[0] == '|') {
			new_value = new_value.substr(1);
		}
		console.log(new_value);
		$('#add-resources').val(new_value);
	}
	$(this).removeClass('dropped');
}