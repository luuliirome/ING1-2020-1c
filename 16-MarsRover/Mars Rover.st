!classDefinition: #MarsRoverTests category: #'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'ffff'.
	
	self assert: (marsRover coordinate = (0@4)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessingMultipleBOrdersShouldMoveMultipleTimesBackwards
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'bbbb'.
	
	self assert: (marsRover coordinate = (0@-4)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'b'.
	
	self assert: (marsRover coordinate = (0@-1)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'f'.
	
	self assert: (marsRover coordinate = (0@1)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToWest
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'l'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testNorthFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToEast
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'r'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #E)! !


!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 17:05:01'!
testProcessingEmptyOrderDoNothing
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: ''.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 17:05:01'!
testProcessingFourLOrdersShouldHasSameOrientation
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'llll'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 17:05:01'!
testProcessingFourROrdersShouldHasSameOrientation
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'rrrr'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 17:05:01'!
testProcessingInvalidOrderDoNothing
	| marsRover |
	marsRover := MarsRover facingNorthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'x'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:10:22'!
testProcessingLBOrderShouldChangeOrientationAndMoveBackward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'lb'.
	
	self assert: (marsRover coordinate = (0@1)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:09:37'!
testProcessingLFOrderShouldChangeOrientationAndMoveForward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'lf'.
	
	self assert: (marsRover coordinate = (0@-1)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:10:30'!
testProcessingRBOrderShouldChangeOrientationAndMoveBackward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'rb'.
	
	self assert: (marsRover coordinate = (0@-1)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:10:08'!
testProcessingRFOrderShouldChangeOrientationAndMoveForward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'rf'.
	
	self assert: (marsRover coordinate = (0@1)).
	self assert: (marsRover orientation = #N)! !


!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testWestFacingMarsRoverProcessMultipleBOrdersShouldMoveMultipleTimesBackward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'bbbb'.
	
	self assert: (marsRover coordinate = (4@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testWestFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'ffff'.
	
	self assert: (marsRover coordinate = (-4@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testWestFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'b'.
	
	self assert: (marsRover coordinate = (1@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testWestFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'f'.
	
	self assert: (marsRover coordinate = (-1@0)).
	self assert: (marsRover orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:06:35'!
testWestFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToSouth
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'l'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #S).! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testWestFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToNorth
	| marsRover |
	marsRover := MarsRover facingWestWithCoordinate: 0@0.
	
	marsRover executeCommands: 'r'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !


!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessMultipleBOrdersShouldMoveMultipleTimesBackward
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'bbbb'.
	
	self assert: (marsRover coordinate = (-4@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'ffff'.
	
	self assert: (marsRover coordinate = (4@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'b'.
	
	self assert: (marsRover coordinate = (-1@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'f'.
	
	self assert: (marsRover coordinate = (1@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToNorth
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'l'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #N)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testEastFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToSouth
	| marsRover |
	marsRover := MarsRover facingEastWithCoordinate: 0@0.
	
	marsRover executeCommands: 'r'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #S)! !


!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'ffff'.
	
	self assert: (marsRover coordinate = (0@-4)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessingMultipleBOrdersShouldMoveMultipleTimesBackwards
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'bbbb'.
	
	self assert: (marsRover coordinate = (0@4)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'b'.
	
	self assert: (marsRover coordinate = (0@1)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'f'.
	
	self assert: (marsRover coordinate = (0@-1)).
	self assert: (marsRover orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToEast
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'l'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #E)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 17:05:01'!
testSouthFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToWest
	| marsRover |
	marsRover := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRover executeCommands: 'r'.
	
	self assert: (marsRover coordinate = (0@0)).
	self assert: (marsRover orientation = #W)! !


!classDefinition: #Command category: #'Mars Rover'!
Object subclass: #Command
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Command methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:52:12'!
initializeFor: aMarsRover
	marsRover _ aMarsRover ! !


!Command methodsFor: 'execution' stamp: 'LR 6/7/2020 17:40:41'!
execute
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: #'Mars Rover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'LR 6/7/2020 17:51:36'!
for: aMarsRover
	^self new initializeFor: aMarsRover.! !


!Command class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:35:42'!
canExecuteCommand: aChar
	self subclassResponsibility ! !

!Command class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:51:47'!
command: aChar for: aMarsRover
	^(self subclasses detect: [:subClass | subClass canExecuteCommand: aChar] ifNone: NullCommand) for: aMarsRover.! !


!classDefinition: #Backward category: #'Mars Rover'!
Command subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Backward methodsFor: 'execution' stamp: 'LR 6/7/2020 17:52:17'!
execute
	marsRover backward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: #'Mars Rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:25:12'!
canExecuteCommand: aChar
	^aChar = $b! !


!classDefinition: #Forward category: #'Mars Rover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Forward methodsFor: 'execution' stamp: 'LR 6/7/2020 17:52:23'!
execute
	marsRover forward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: #'Mars Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:25:17'!
canExecuteCommand: aChar
	^aChar = $f! !


!classDefinition: #NullCommand category: #'Mars Rover'!
Command subclass: #NullCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!NullCommand methodsFor: 'execution' stamp: 'LR 6/7/2020 17:40:07'!
execute! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullCommand class' category: #'Mars Rover'!
NullCommand class
	instanceVariableNames: ''!

!NullCommand class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:35:08'!
canExecuteCommand: aChar
	^false! !


!classDefinition: #RotateLeft category: #'Mars Rover'!
Command subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!RotateLeft methodsFor: 'execution' stamp: 'LR 6/7/2020 17:52:30'!
execute
	marsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: #'Mars Rover'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:25:22'!
canExecuteCommand: aChar
	^aChar = $l! !


!classDefinition: #RotateRight category: #'Mars Rover'!
Command subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!RotateRight methodsFor: 'execution' stamp: 'LR 6/7/2020 17:52:34'!
execute
	marsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: #'Mars Rover'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'command selection' stamp: 'LR 6/7/2020 17:25:27'!
canExecuteCommand: aChar
	^aChar = $r! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'orientation position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:20:31'!
initializeFacingEastWithCoordinate: aCoordinate
	position := MarsRoverPositionFacingEast withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:20:46'!
initializeFacingNorthWithCoordinate: aCoordinate
	position := MarsRoverPositionFacingNorth withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:21:05'!
initializeFacingSouthWithCoordinate: aCoordinate
	position := MarsRoverPositionFacingSouth withCoordinate: aCoordinate.! !

!MarsRover methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:21:12'!
initializeFacingWestWithCoordinate: aCoordinate
	position := MarsRoverPositionFacingWest withCoordinate: aCoordinate.! !


!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 17:28:29'!
backward
	position backward.! !

!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 17:46:17'!
executeCommands: aString 
	aString do: [ :aChar |
		(Command command: aChar for: self) execute.
	].! !

!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 17:28:20'!
forward
	position forward.! !

!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 17:28:44'!
rotateLeft
	position := position rotateLeft.! !

!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 17:28:50'!
rotateRight
	position := position rotateRight.! !


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


!classDefinition: #MarsRoverPosition category: #'Mars Rover'!
Object subclass: #MarsRoverPosition
	instanceVariableNames: 'coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverPosition methodsFor: 'initialization' stamp: 'LR 6/7/2020 17:58:07'!
initializeWithCoordinate: aCoordinate
	coordinate := aCoordinate! !


!MarsRoverPosition methodsFor: 'displacement' stamp: 'LR 6/7/2020 12:43:23'!
backward
	self subclassResponsibility ! !

!MarsRoverPosition methodsFor: 'displacement' stamp: 'LR 6/7/2020 12:43:17'!
forward
	self subclassResponsibility ! !


!MarsRoverPosition methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:10:49'!
coordinate
	self subclassResponsibility ! !

!MarsRoverPosition methodsFor: 'accessing' stamp: 'LR 6/7/2020 12:51:09'!
orientation
	self subclassResponsibility ! !


!MarsRoverPosition methodsFor: 'rotations' stamp: 'LR 6/7/2020 12:43:31'!
rotateLeft
	self subclassResponsibility ! !

!MarsRoverPosition methodsFor: 'rotations' stamp: 'LR 6/7/2020 12:43:35'!
rotateRight
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPosition class' category: #'Mars Rover'!
MarsRoverPosition class
	instanceVariableNames: ''!

!MarsRoverPosition class methodsFor: 'instance creation' stamp: 'LR 6/7/2020 17:56:53'!
withCoordinate: aCoordinate
	^self new initializeWithCoordinate: aCoordinate.! !


!classDefinition: #MarsRoverPositionFacingEast category: #'Mars Rover'!
MarsRoverPosition subclass: #MarsRoverPositionFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverPositionFacingEast methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:20:46'!
rotateLeft
	^MarsRoverPositionFacingNorth withCoordinate: coordinate.! !

!MarsRoverPositionFacingEast methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:21:05'!
rotateRight
	^MarsRoverPositionFacingSouth withCoordinate: coordinate.! !


!MarsRoverPositionFacingEast methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:14:10'!
coordinate
	^coordinate! !

!MarsRoverPositionFacingEast methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:13:18'!
orientation
	^#E! !


!MarsRoverPositionFacingEast methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:20:10'!
backward
	coordinate := coordinate - (1@0).! !

!MarsRoverPositionFacingEast methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:20:21'!
forward
	coordinate := coordinate + (1@0).! !


!classDefinition: #MarsRoverPositionFacingNorth category: #'Mars Rover'!
MarsRoverPosition subclass: #MarsRoverPositionFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverPositionFacingNorth methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:21:12'!
rotateLeft
	^MarsRoverPositionFacingWest withCoordinate: coordinate.! !

!MarsRoverPositionFacingNorth methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:20:31'!
rotateRight
	^MarsRoverPositionFacingEast withCoordinate: coordinate.! !


!MarsRoverPositionFacingNorth methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:09:35'!
backward
	coordinate := coordinate - (0@1).! !

!MarsRoverPositionFacingNorth methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:09:21'!
forward
	coordinate := coordinate + (0@1).! !


!MarsRoverPositionFacingNorth methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:09:25'!
coordinate
	^coordinate! !

!MarsRoverPositionFacingNorth methodsFor: 'accessing' stamp: 'LR 6/7/2020 12:51:51'!
orientation
	^#N! !


!classDefinition: #MarsRoverPositionFacingSouth category: #'Mars Rover'!
MarsRoverPosition subclass: #MarsRoverPositionFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverPositionFacingSouth methodsFor: 'rotations' stamp: 'LR 6/7/2020 18:02:21'!
rotateLeft
	^MarsRoverPositionFacingEast withCoordinate: coordinate.! !

!MarsRoverPositionFacingSouth methodsFor: 'rotations' stamp: 'LR 6/7/2020 18:02:32'!
rotateRight
	^MarsRoverPositionFacingWest withCoordinate: coordinate.! !


!MarsRoverPositionFacingSouth methodsFor: 'displacement' stamp: 'LR 6/7/2020 18:01:48'!
backward
	coordinate := coordinate + (0@1).! !

!MarsRoverPositionFacingSouth methodsFor: 'displacement' stamp: 'LR 6/7/2020 18:02:02'!
forward
	coordinate := coordinate - (0@1).! !


!MarsRoverPositionFacingSouth methodsFor: 'accessing' stamp: 'LR 6/7/2020 18:01:55'!
coordinate
	^coordinate! !

!MarsRoverPositionFacingSouth methodsFor: 'accessing' stamp: 'LR 6/7/2020 18:02:09'!
orientation
	^#S! !


!classDefinition: #MarsRoverPositionFacingWest category: #'Mars Rover'!
MarsRoverPosition subclass: #MarsRoverPositionFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverPositionFacingWest methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:21:05'!
rotateLeft
	^MarsRoverPositionFacingSouth withCoordinate: coordinate.! !

!MarsRoverPositionFacingWest methodsFor: 'rotations' stamp: 'LR 6/7/2020 17:20:46'!
rotateRight
	^MarsRoverPositionFacingNorth withCoordinate: coordinate.! !


!MarsRoverPositionFacingWest methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:21:24'!
backward
	coordinate := coordinate + (1@0).! !

!MarsRoverPositionFacingWest methodsFor: 'displacement' stamp: 'LR 6/7/2020 13:21:15'!
forward
	coordinate := coordinate - (1@0).! !


!MarsRoverPositionFacingWest methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:12:37'!
coordinate
	^coordinate! !

!MarsRoverPositionFacingWest methodsFor: 'accessing' stamp: 'LR 6/7/2020 13:12:46'!
orientation
	^#W! !
