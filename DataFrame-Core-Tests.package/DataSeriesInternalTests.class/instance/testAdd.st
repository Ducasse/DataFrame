initialization
testAdd

	| expected |
	
	expected := DataSeriesInternal fromArray:
		#(10 20 30 40 50 60 70 80 90 100 -1).
		
	series add: -1.
		
	self assert: series equals: expected.