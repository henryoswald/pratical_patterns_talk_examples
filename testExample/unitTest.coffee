require('coffee-script')
sandboxedModule = require('sandboxed-module')
sinon = require('sinon')
require('chai').should()
modulePath = require('path').join __dirname, './moduleToTest'


describe 'user handler', ->

	beforeEach ->
		@stubbedRequest = 
			get: sinon.stub().callsArgWith(1)
		@handler = sandboxedModule.require modulePath, requires:
			'request':@stubbedRequest

	describe 'getting user details', ->

		it 'should make a http request to api for details', (done)->
			user_id = "123432"
			expectedUrl = "http://www.site.com/user/#{user_id}"

			@handler.getDetails user_id, (err)=>
				@stubbedRequest.get.calledWith(expectedUrl).should.equal true
				done()

		it 'should return the user details from the api', (done)->
			user_id = "123432"
			expectedUrl = "http://www.site.com/user/#{user_id}"
			stubbedDetails = first_name:"Bobby", last_name:"brown"

			@stubbedRequest.get.withArgs(expectedUrl).callsArgWith(1, null, null, stubbedDetails)

			@handler.getDetails user_id, (err, user_details)=>
				user_details.should.equal(stubbedDetails)
				done()


