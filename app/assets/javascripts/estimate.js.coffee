# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('input#add_bulb').click ->
		bulb_data = {
			quantity: $('input#quantity').val(),
			current_bulb_name: $('input#current_bulb_name').val(),
			current_bulb_wattage: $('input#current_bulb_wattage').val(),
			replacement_bulb_id: $('select#replacement_bulb_id').val(),
		}
		$.post(
			'/estimate/'+$('input#estimate_id').val()+'/replacement',
			bulb_data,
			(results) ->
				if results["error"]
					display_replacement_error_messages(results["messages"])
				if results["new_total_estimate"]
					add_replacement_to_estimate(results["replacement"])
					update_estimate(results["new_total_estimate"])
		)

	$('button.remove_replacement').click ->
		remove_replacement($(this).parent().data('id'))
		

add_replacement_to_estimate = (replacement) -> 
	replacement_html = $("<li id='replacement"+replacement["id"]+"' data-id='"+replacement["id"]+"'>")
		.append("<div class='quantity'>"+replacement["quantity"]+"</div>")
		.append("<div class='current_bulb_name'>"+replacement["current_bulb_name"]+"</div>")
		.append("<div class='current_bulb_wattage'>"+replacement["current_bulb_wattage"]+"</div>")
		.append("<div class='replacement_bulb_name'>"+replacement["replacement_bulb_name"]+"</div>")
		.append("<div class='replacement_bulb_wattage'>"+replacement["replacement_bulb_wattage"]+"</div>")
		.append("<div class='percent_reduction'>"+replacement["percent_reduction"]+"</div>")
		.append("<button class='remove_replacement'>X</button>")
		.on 'click', ->
			remove_replacement(replacement["id"])
		.append("</li><br>")

	$("ul#replacements")
	.append(replacement_html)

remove_replacement = (replacement_id) ->
	$.ajax(
		type: 'DELETE',
		url: '/estimate/' + 
			$('input#estimate_id').val() + 
			'/replacement/' +
			replacement_id,
		success: (response) ->
			update_estimate(response["new_total_estimate"])
			$("div#replacement"+response["replacement_id"]).remove()
	)

display_replacement_error_messages = (messages) ->
	$.each(messages, (message, value) ->
		add_error_to_input(message, value)
	)

update_estimate = (new_estimate) ->
	$("div#total_reduction").html(new_estimate)

add_error_to_input = (input_id, message) ->
	$("input#" + input_id).after("<span class='error'>" + message[0] + "</span>")
	$("input#" + input_id).addClass("error")