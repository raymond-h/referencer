$ ->
	class ViewModel
		constructor: ->
			@isbn = ko.observable ''
			@footnote = ko.observable ''

			@lookUp = () =>
				$.getJSON "/footnote/#{@isbn()}", (data) =>
					console.log "Got data", data
					@footnote data[0]

	ko.applyBindings new ViewModel