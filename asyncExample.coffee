async = require('async')

user_ids = [
	"111"
	"222"
	"333"
	"444"
]

jobs = user_ids.map (user_id)->
	return (cb)->
		console.log "processing user : #{user_id}"
		setTimeout cb, (Math.random()*3)

async.series jobs, ->
	console.log "finished processing all users in series"

#async.parallel jobs, ->
#	console.log "finished processing all users in parraell"

#async.parallelLimit jobs, 2, ->
#	console.log "finished processing all users in parraell with a limit of 2"
