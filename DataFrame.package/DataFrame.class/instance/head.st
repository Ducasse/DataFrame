accessing
head

	| n |
	
	( self size > 5 )
		ifTrue: [ n := 5 ]
		ifFalse: [ n := self size ].
		
	^ self class rows:
		((1 to: n) collect: [ :i | self at: i ]).