exports.generateFootnotes = (bookData) ->
	for book in bookData.items
		volume = book.volumeInfo

		"#{volume.authors.map(exports.transformAuthor).join ', '}, <i>#{volume.title}</i>, #{volume.publisher}, #{volume.publishedDate}"

exports.transformAuthor = (author) ->
	[parts..., lastName] = author.split /\s+/
	"#{("#{name.charAt 0}." for name in parts).join ''} #{lastName}"