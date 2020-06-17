!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:38'!
test01GameIsNotOverIfNeverStarted
	|game|
	
	game := TerniLapilli new.
	self deny: (game isOver)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:58'!
test02XStartsTheGame
	|game|
	
	game := TerniLapilli new.
	self assert: (game isPlayingX)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:53:06'!
test03ODoesNotStartTheGame
	|game|
	
	game := TerniLapilli new.
	self deny: (game isPlayingO)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:26'!
test04PutXInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	[game putXAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:32'!
test05PutOInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:48'!
test06OCantPlayIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	[game putOAt: 1@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:57'!
test07XCantPlayIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putXAt: 2@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:05'!
test08AfterXIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	self deny: (game isPlayingX).
	self assert: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:14'!
test09AfterOIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1.
	game putOAt: 1@1.
	self assert: (game isPlayingX).
	self deny: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:25'!
test10CantPutAChipInATakenSpace
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 1@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:52'!
test11AfterAll6ChipsInTheBoardOnlyCanMovePreviousChips
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game putXAt: 3@2. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:46'!
test12CantMoveXChipIfSourcePositionIsFilledByAnOChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveXAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:13'!
test13CantMoveOChipIfSourcePositionIsFilledByAnXChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@2.
	[game moveOAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:53'!
test14CantMoveOChipIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveOAt: 2@1 to: 3@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:14'!
test15CantMoveXChipIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3. 
	
	game moveXAt: 2@2 to: 3@2.
	[game moveXAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:33:20'!
test16CanNotMoveXChipToATakenPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveXAt: 1@1 to: 1@2. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:34:22'!
test17CanNotMoveOChipToATakenPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@3.
	[game moveOAt: 2@1 to: 1@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:50:10'!
test18CanNotMoveXChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1. 
	game putOAt: 1@1.
	
	game putXAt: 1@3.
	game putOAt: 1@2.

	game putXAt: 2@3.
	game putOAt: 2@2.
	
	[game moveXAt: 2@3 to: 3@2. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:27:15'!
test19CanNotMoveOChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1. 
	game putOAt: 1@1.
	
	game putXAt: 1@3.
	game putOAt: 1@2.

	game putXAt: 2@3.
	game putOAt: 2@2.
	
	game moveXAt: 2@3 to: 3@3.
	[game moveOAt: 1@2 to: 2@3. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:45:13'!
testIfAPlayerHasThreeOnARowTheGameIsOver
	|game|
	
	"game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game isOver."
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:45:34'!
testIfXHasThreeOnARowXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game hasPlayerXWon.
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'player winner board playedChips validMoves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:29:04'!
hasPlayerXWon
	^true.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:24:18'!
initialize
	player := #X.
	board := Array2D height: 3 width: 3.
	playedChips := 0.
	validMoves := Dictionary new.
	validMoves at: 1@1 put: (Set withAll: {2@1. 2@2. 1@2.}).
	validMoves at: 2@1 put: (Set withAll: {1@1. 2@2. 3@1.}).
	validMoves at: 3@1 put: (Set withAll: {2@1. 3@2. 2@2.}).
	
	validMoves at: 1@2 put: (Set withAll: {1@1. 2@2. 1@3.}).
	validMoves at: 2@2 put: (Set withAll: {1@1. 1@2. 1@3. 2@1. 2@3. 3@1. 3@2. 3@3.}).
	validMoves at: 3@2 put: (Set withAll: {3@1. 3@3. 2@2.}).
	
	validMoves at: 1@3 put: (Set withAll: {1@2. 2@2. 2@3.}).
	validMoves at: 2@3 put: (Set withAll: {1@3. 2@2. 3@3.}).
	validMoves at: 3@3 put: (Set withAll: {2@3. 2@2. 3@2.}).! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 19:43:03'!
isEmpty
	^true! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:31:58'!
isOver
	^winner ~= nil! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:16:12'!
isPlayingO
	^player = #O! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:03:05'!
isPlayingX
	^player = #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:10:35'!
isValidMove: sourcePoint to: destinationPoint 
	^(validMoves at: sourcePoint) includes: destinationPoint.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:02'!
moveOAt: sourcePosition to: destinationPosition
	self isPlayingO ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: sourcePosition) = #O ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: destinationPosition) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: self class invalidMovementErrorMessageDescription].
	
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #O.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:35:22'!
moveXAt: sourcePosition to: destinationPosition
	self isPlayingX ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: sourcePosition) = #X ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: destinationPosition) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: self class invalidMovementErrorMessageDescription].
	
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #X.
	player := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:36:53'!
putOAt: aPoint 
	(player = #O) ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(self validPoint: aPoint)  ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(playedChips  = 6) ifTrue: [self error: self class moveExistingChipsErrorMessageDescription].
	playedChips := playedChips +1 .
	board at: aPoint put: #O.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:37:23'!
putXAt: aPoint 
	(player = #X) ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(self validPoint: aPoint)  ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(playedChips  = 6) ifTrue: [self error: self class moveExistingChipsErrorMessageDescription].
	playedChips := playedChips+1.
	board at: aPoint put: #X.
	player := #O! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 19:59:04'!
validPoint: aPoint 
	^(board at: aPoint) = nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:19'!
invalidMovementErrorMessageDescription
	^'invalid movement'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:37:08'!
moveExistingChipsErrorMessageDescription
	^'should move existing chips'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:24'!
notYourTurnErrorMessageDescription
	^'its not your turn'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:46'!
takenPositionErrorMessageDescription
	^'taken position'! !
