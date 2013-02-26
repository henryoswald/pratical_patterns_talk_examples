async = require('async')

user_ids = [
	"111"
	"222"
	"333"
	"444"
]

#this could be a db call or http request
someSlowAsyncFunction = (user_id, cb)->
	setTimeout cb, (Math.random()*100)


jobs = user_ids.map (user_id)->
	return (cb)->
		someSlowAsyncFunction user_id, ->
			console.log "processing user : #{user_id}"
			cb()

async.series jobs, ->
	console.log "finished processing all users in series"

#async.parallel jobs, ->
#	console.log "finished processing all users in parraell"

#async.parallelLimit jobs, 2, ->
#	console.log "finished processing all users in parraell with a limit of 2"
