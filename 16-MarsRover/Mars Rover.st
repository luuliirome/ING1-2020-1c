!classDefinition: #MarsRoverTests category: #'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:12'!
test01
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:16'!
test02
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: ''.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:20'!
test03
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'x'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:25'!
test04
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'f'.
	
	self assert: (marsRover coordinate = (0@1)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:29'!
test05
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'b'.
	
	self assert: (marsRover coordinate = (0@-1)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:33'!
test06
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'bb'.
	
	self assert: (marsRover coordinate = (0@-2)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:38'!
test07
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'ff'.
	
	self assert: (marsRover coordinate = (0@2)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:02:36'!
test08
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'r'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:42'!
test09
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'l'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:03:46'!
test10
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'll'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:28:13'!
test11
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'llll'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:28:24'!
test12
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover processOrder: 'rrrr'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:28:45'!
test13
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover processOrder: 'rrrr'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'orientation position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:23:52'!
initializeFacingEastWithCoordinate: aCoordinate
	position := PositionFacingEast withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:05:38'!
initializeFacingNorthWithCoordinate: aCoordinate
	position := PositionFacingNorth withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:23:45'!
initializeFacingSouthWithCoordinate: aCoordinate
	position := PositionFacingSouth withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:23:58'!
initializeFacingWestWithCoordinate: aCoordinate
	position := PositionFacingWest withCoordinate: aCoordinate.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:15:19'!
processOrder: aString 
	aString do: [ :char |
		char = $f ifTrue: [position forward].
		char = $b ifTrue: [position backward].
		char = $r ifTrue: [ position := position rotateRight].
		char = $l ifTrue: [ position := position rotateLeft ].
	].! !


!MarsRover methodsFor: 'accesing' stamp: 'LR 6/7/2020 13:10:49'!
coordinate
	^position coordinate! !

!MarsRover methodsFor: 'accesing' stamp: 'LR 6/7/2020 12:50:39'!
orientation
	^position orientation! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:29:39'!
facingEastWithCoordinate: aCoordinate
	^self new initializeFacingEastWithCoordinate: aCoordinate.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:48:30'!
facingNorthWithCoordinate: aCoordinate
	^self new initializeFacingNorthWithCoordinate: aCoordinate.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:29:22'!
facingSouthWithCoordinate: aCoordinate
	^self new initializeFacingSouthWithCoordinate: aCoordinate.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:29:32'!
facingWestWithCoordinate: aCoordinate
	^self new initializeFacingWestWithCoordinate: aCoordinate.! !


!classDefinition: #Position category: #'Mars Rover'!
Object subclass: #Position
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:43:23'!
backward
	self subclassResponsibility ! !

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:10:49'!
coordinate
	self subclassResponsibility ! !

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:43:17'!
forward
	self subclassResponsibility ! !

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:51:09'!
orientation
	self subclassResponsibility ! !

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:43:31'!
rotateLeft
	self subclassResponsibility ! !

!Position methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:43:35'!
rotateRight
	self subclassResponsibility ! !


!classDefinition: #PositionFacingEast category: #'Mars Rover'!
Position subclass: #PositionFacingEast
	instanceVariableNames: 'coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:20:10'!
backward
	coordinate := coordinate - (1@0).! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:14:10'!
coordinate
	^coordinate! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:20:21'!
forward
	coordinate := coordinate + (1@0).! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:08:02'!
initializeWithCoordinate: aCoordinate
	coordinate := aCoordinate! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:13:18'!
orientation
	^#E! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:22:55'!
rotateLeft
	^PositionFacingNorth withCoordinate: coordinate.! !

!PositionFacingEast methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:23:00'!
rotateRight
	^PositionFacingSouth withCoordinate: coordinate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionFacingEast class' category: #'Mars Rover'!
PositionFacingEast class
	instanceVariableNames: ''!

!PositionFacingEast class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:07:42'!
withCoordinate: aCoordinate
	^self new initializeWithCoordinate: aCoordinate.! !


!classDefinition: #PositionFacingNorth category: #'Mars Rover'!
Position subclass: #PositionFacingNorth
	instanceVariableNames: 'coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:09:35'!
backward
	coordinate := coordinate - (0@1).! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:09:25'!
coordinate
	^coordinate! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:09:21'!
forward
	coordinate := coordinate + (0@1).! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:09:15'!
initializeWithCoordinate: aCoordinate
	coordinate := aCoordinate! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 12:51:51'!
orientation
	^#N! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:11:14'!
rotateLeft
	^PositionFacingWest withCoordinate: coordinate.! !

!PositionFacingNorth methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:09:45'!
rotateRight
	^PositionFacingEast withCoordinate: coordinate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionFacingNorth class' category: #'Mars Rover'!
PositionFacingNorth class
	instanceVariableNames: ''!

!PositionFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:10:22'!
withCoordinate: aCoordinate
	^self new initializeWithCoordinate: aCoordinate.! !


!classDefinition: #PositionFacingSouth category: #'Mars Rover'!
Position subclass: #PositionFacingSouth
	instanceVariableNames: 'position coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:20:44'!
backward
	coordinate := coordinate + (0@1).! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:18:08'!
coordinate
	^coordinate.! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:20:52'!
forward
	coordinate := coordinate - (0@1).! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:17:31'!
initializeWithCoordinate: aCoordinate 
	coordinate := aCoordinate.! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:18:16'!
orientation
	^#S! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:22:23'!
rotateLeft
	^PositionFacingEast withCoordinate: coordinate.! !

!PositionFacingSouth methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:22:29'!
rotateRight
	^PositionFacingWest withCoordinate: coordinate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionFacingSouth class' category: #'Mars Rover'!
PositionFacingSouth class
	instanceVariableNames: ''!

!PositionFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:17:14'!
withCoordinate: aCoordinate
	^self new initializeWithCoordinate: aCoordinate.
	! !


!classDefinition: #PositionFacingWest category: #'Mars Rover'!
Position subclass: #PositionFacingWest
	instanceVariableNames: 'position coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:21:24'!
backward
	coordinate := coordinate + (1@0).! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:12:37'!
coordinate
	^coordinate! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:21:15'!
forward
	coordinate := coordinate - (1@0).! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:12:07'!
initializeWithCoordinate: aCoordinate 
	coordinate := aCoordinate.! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:12:46'!
orientation
	^#W! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:16:40'!
rotateLeft
	^PositionFacingSouth withCoordinate: coordinate.! !

!PositionFacingWest methodsFor: 'initialization' stamp: 'LR 6/7/2020 13:21:44'!
rotateRight
	^PositionFacingNorth withCoordinate: coordinate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionFacingWest class' category: #'Mars Rover'!
PositionFacingWest class
	instanceVariableNames: ''!

!PositionFacingWest class methodsFor: 'as yet unclassified' stamp: 'LR 6/7/2020 13:11:52'!
withCoordinate: aCoordinate
	^self new initializeWithCoordinate: aCoordinate.! !
