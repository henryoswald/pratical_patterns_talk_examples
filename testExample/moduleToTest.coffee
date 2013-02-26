request = require('request')

module.exports = 

	getDetails: (user_id, callback)->
		request.get "http://www.site.com/user/#{user_id}", (err, res, body)->
			callback null, body