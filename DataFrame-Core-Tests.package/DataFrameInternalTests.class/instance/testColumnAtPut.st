tests
testColumnAtPut

	| actual expected |

	expected := DataFrameInternal fromRows: #(
		('X' 1.609 0)
   		('Y' 2.789 1)
   		('Z' 8.788 0)).
	
	actual := df.
	actual columnAt: 1 put: #(X Y Z).
	actual columnAt: 3 put: #(0 1 0).
	
	self assert: actual equals: expected.