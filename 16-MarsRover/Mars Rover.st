!classDefinition: #MarsRoverTests category: #'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverFacingNorth marsRoverFacingWest marsRoverFacingEast marsRoverFacingSouth marsRoverToTest marsRoverToTestCoordinate marsRoverToTestOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:25:03'!
testNorthFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	
	marsRoverFacingNorth executeCommands: 'ffff'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@4)).
	self assert: (marsRoverFacingNorth orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:25:34'!
testNorthFacingMarsRoverProcessingMultipleBOrdersShouldMoveMultipleTimesBackwards
	
	marsRoverFacingNorth executeCommands: 'bbbb'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@-4)).
	self assert: (marsRoverFacingNorth orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:25:47'!
testNorthFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	marsRoverFacingNorth executeCommands: 'b'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@-1)).
	self assert: (marsRoverFacingNorth orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:25:59'!
testNorthFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	marsRoverFacingNorth executeCommands: 'f'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@1)).
	self assert: (marsRoverFacingNorth orientation = #N)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:26:09'!
testNorthFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToWest
	
	marsRoverFacingNorth executeCommands: 'l'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@0)).
	self assert: (marsRoverFacingNorth orientation = #W)! !

!MarsRoverTests methodsFor: 'NorthFacingMarsRover' stamp: 'LR 6/7/2020 18:26:17'!
testNorthFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToEast
	
	marsRoverFacingNorth executeCommands: 'r'.
	
	self assert: (marsRoverFacingNorth coordinate = (0@0)).
	self assert: (marsRoverFacingNorth orientation = #E)! !


!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:39:16'!
testProcessingEmptyOrderDoNothing
	
	marsRoverToTest executeCommands: ''.
	
	self assert: (marsRoverToTest coordinate = marsRoverToTestCoordinate ).
	self assert: (marsRoverToTest orientation = marsRoverToTestOrientation ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:40:26'!
testProcessingFourLOrdersShouldHasSameOrientation
	
	marsRoverToTest executeCommands: 'llll'.
	
	self assert: (marsRoverToTest coordinate = marsRoverToTestCoordinate ).
	self assert: (marsRoverToTest orientation = marsRoverToTestOrientation ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:40:34'!
testProcessingFourROrdersShouldHasSameOrientation
	marsRoverToTest executeCommands: 'rrrr'.
	
	self assert: (marsRoverToTest coordinate = marsRoverToTestCoordinate ).
	self assert: (marsRoverToTest orientation = marsRoverToTestOrientation ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:39:25'!
testProcessingInvalidOrderDoNothing
	marsRoverToTest executeCommands: 'x'.
	
	self assert: (marsRoverToTest coordinate = marsRoverToTestCoordinate ).
	self assert: (marsRoverToTest orientation = marsRoverToTestOrientation ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:42:04'!
testProcessingLBOrderShouldChangeOrientationAndMoveBackward
	marsRoverFacingWest executeCommands: 'lb'.
	
	self assert: (marsRoverFacingWest coordinate = (0@1)).
	self assert: (marsRoverFacingWest orientation = #S)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:41:56'!
testProcessingLFOrderShouldChangeOrientationAndMoveForward
	marsRoverFacingWest executeCommands: 'lf'.
	
	self assert: (marsRoverFacingWest coordinate = (0@-1)).
	self assert: (marsRoverFacingWest orientation = #S)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:41:32'!
testProcessingRBOrderShouldChangeOrientationAndMoveBackward
	marsRoverFacingWest executeCommands: 'rb'.
	
	self assert: (marsRoverFacingWest coordinate = (0@-1)).
	self assert: (marsRoverFacingWest orientation = #N)! !

!MarsRoverTests methodsFor: 'testing' stamp: 'LR 6/7/2020 18:41:39'!
testProcessingRFOrderShouldChangeOrientationAndMoveForward
	marsRoverFacingWest executeCommands: 'rf'.
	
	self assert: (marsRoverFacingWest coordinate = (0@1)).
	self assert: (marsRoverFacingWest orientation = #N)! !


!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:29:32'!
testWestFacingMarsRoverProcessMultipleBOrdersShouldMoveMultipleTimesBackward
	marsRoverFacingWest executeCommands: 'bbbb'.
	
	self assert: (marsRoverFacingWest coordinate = (4@0)).
	self assert: (marsRoverFacingWest orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:29:41'!
testWestFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	marsRoverFacingWest executeCommands: 'ffff'.
	
	self assert: (marsRoverFacingWest coordinate = (-4@0)).
	self assert: (marsRoverFacingWest orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:29:53'!
testWestFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	marsRoverFacingWest executeCommands: 'b'.
	
	self assert: (marsRoverFacingWest coordinate = (1@0)).
	self assert: (marsRoverFacingWest orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:30:01'!
testWestFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	marsRoverFacingWest executeCommands: 'f'.
	
	self assert: (marsRoverFacingWest coordinate = (-1@0)).
	self assert: (marsRoverFacingWest orientation = #W)! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:30:13'!
testWestFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToSouth
	marsRoverFacingWest executeCommands: 'l'.
	
	self assert: (marsRoverFacingWest coordinate = (0@0)).
	self assert: (marsRoverFacingWest orientation = #S).! !

!MarsRoverTests methodsFor: 'WestFacingMarsRover' stamp: 'LR 6/7/2020 18:30:24'!
testWestFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToNorth
	marsRoverFacingWest executeCommands: 'r'.
	
	self assert: (marsRoverFacingWest coordinate = (0@0)).
	self assert: (marsRoverFacingWest orientation = #N)! !


!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:31:27'!
testEastFacingMarsRoverProcessMultipleBOrdersShouldMoveMultipleTimesBackward
	marsRoverFacingEast executeCommands: 'bbbb'.
	
	self assert: (marsRoverFacingEast coordinate = (-4@0)).
	self assert: (marsRoverFacingEast orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:31:34'!
testEastFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	marsRoverFacingEast executeCommands: 'ffff'.
	
	self assert: (marsRoverFacingEast coordinate = (4@0)).
	self assert: (marsRoverFacingEast orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:31:42'!
testEastFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	marsRoverFacingEast executeCommands: 'b'.
	
	self assert: (marsRoverFacingEast coordinate = (-1@0)).
	self assert: (marsRoverFacingEast orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:31:49'!
testEastFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	marsRoverFacingEast executeCommands: 'f'.
	
	self assert: (marsRoverFacingEast coordinate = (1@0)).
	self assert: (marsRoverFacingEast orientation = #E)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:31:57'!
testEastFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToNorth
	marsRoverFacingEast executeCommands: 'l'.
	
	self assert: (marsRoverFacingEast coordinate = (0@0)).
	self assert: (marsRoverFacingEast orientation = #N)! !

!MarsRoverTests methodsFor: 'EastFacingMarsRover' stamp: 'LR 6/7/2020 18:32:08'!
testEastFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToSouth
	marsRoverFacingEast executeCommands: 'r'.
	
	self assert: (marsRoverFacingEast coordinate = (0@0)).
	self assert: (marsRoverFacingEast orientation = #S)! !


!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:32:23'!
testSouthFacingMarsRoverProcessMultipleFOrdersShouldMoveMultipleTimesForward
	marsRoverFacingSouth executeCommands: 'ffff'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@-4)).
	self assert: (marsRoverFacingSouth orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:32:33'!
testSouthFacingMarsRoverProcessingMultipleBOrdersShouldMoveMultipleTimesBackwards
	marsRoverFacingSouth executeCommands: 'bbbb'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@4)).
	self assert: (marsRoverFacingSouth orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:32:40'!
testSouthFacingMarsRoverProcessingSingleBOrderMovesAPositionBackwards
	marsRoverFacingSouth executeCommands: 'b'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@1)).
	self assert: (marsRoverFacingSouth orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:32:48'!
testSouthFacingMarsRoverProcessingSingleFOrderMovesAPositionForwards
	marsRoverFacingSouth executeCommands: 'f'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@-1)).
	self assert: (marsRoverFacingSouth orientation = #S)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:33:01'!
testSouthFacingMarsRoverProcessingSingleLOrderShouldChangeOrientationToEast
	marsRoverFacingSouth executeCommands: 'l'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@0)).
	self assert: (marsRoverFacingSouth orientation = #E)! !

!MarsRoverTests methodsFor: 'SouthFacingMarsRover' stamp: 'LR 6/7/2020 18:33:08'!
testSouthFacingMarsRoverProcessingSingleROrderShouldChangeOrientationToWest
	marsRoverFacingSouth executeCommands: 'r'.
	
	self assert: (marsRoverFacingSouth coordinate = (0@0)).
	self assert: (marsRoverFacingSouth orientation = #W)! !


!MarsRoverTests methodsFor: 'setUp/tearDown' stamp: 'LR 6/7/2020 18:38:59'!
setUp

	marsRoverFacingNorth := MarsRover facingNorthWithCoordinate: 0@0.
	marsRoverFacingWest := MarsRover facingWestWithCoordinate: 0@0.
	marsRoverFacingEast := MarsRover facingEastWithCoordinate: 0@0.	
	marsRoverFacingSouth := MarsRover facingSouthWithCoordinate: 0@0.
	
	marsRoverToTest := MarsRover facingWestWithCoordinate: 4@5.
	marsRoverToTestCoordinate := marsRoverToTest coordinate.
	marsRoverToTestOrientation := marsRoverToTest orientation.! !


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

!NullCommand methodsFor: 'execution' stamp: 'LR 6/7/2020 18:42:57'!
execute
	marsRover nullCommand! !

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
	instanceVariableNames: 'position'
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

!MarsRover methodsFor: 'commands' stamp: 'LR 6/7/2020 18:43:09'!
nullCommand
! !

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
