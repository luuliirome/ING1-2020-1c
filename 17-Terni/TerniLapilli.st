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

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:10:13'!
test20IfXHasThreeOnAColumnAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:10:23'!
test21IfOHasThreeOnAColumnAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 3@3.
	game putOAt: 2@3.	
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:11:20'!
test22IfXHasThreeOnARowAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 3@3.
	game putXAt: 2@1.
	game putOAt: 2@2.	
	game putXAt: 3@1.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:12:31'!
test23IfOHasThreeOnARowAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@2.
	game putOAt: 3@3.
	game putXAt: 2@1.
	game putOAt: 2@3.	
	game putXAt: 3@1.
	game putOAt: 1@3.
	
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:23:12'!
test24IfXHasThreeOnADiagonalAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 3@1.
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 2@3.	
	game putXAt: 1@3.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:18:43'!
test25IfOHasThreeOnADiagonalAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 2@3.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	game putOAt: 3@3.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:20:33'!
test26IfAPlayerHasThreeOnARowTheGameIsOver
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game isOver.
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:23:35'!
test27IfTheGameIsOverNobodyCanPutAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	[game putOAt: 3@3. self fail.]
	on: Error
	do: [self success: true].
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:27:50'!
test28IfXHasThreeOnARowInAnyPositionAfterMoreThan3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 1@2 to: 2@2.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:29:29'!
test29IfOHasThreeOnARowInAnyPositionAfterMoreThan3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 3@3 to: 2@2.
	game moveOAt: 2@3 to: 3@3.
		
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:31:52'!
test30IfTheGameIsOverXCanNotMoveAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 3@3 to: 2@2.
	game moveOAt: 2@3 to: 3@3.

	[game moveXAt: 2@2 to: 1@3. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:32:35'!
test31IfTheGameIsOverOCanNotMoveAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 1@2 to: 2@2.
	[game moveOAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [self success:true].! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'player winner board playedChips validMoves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:58:22'!
checkAllColumns
	|index|
	index := 1.
	
	3 timesRepeat: [
		self checkColumnNumber: index.
		index := index + 1.
	]! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:17:48'!
checkAllDiagonals
	
	| downLeftCorner downRightCorner medium upperLeftCorner upperRightCorner |
	
	upperLeftCorner := board at: 1@1.
	upperRightCorner := board at: 3@1.
	medium := board at: 2@2.
	downLeftCorner := board at: 1@3.
	downRightCorner := board at: 3@3.
	
	(medium = nil) ifTrue: [^self].
	
	(((upperLeftCorner = downRightCorner) and: (upperLeftCorner = medium)) or:
	((upperRightCorner = downLeftCorner) and: (upperRightCorner = medium) )) ifTrue: [winner := medium].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:04:49'!
checkAllRows
	|index|
	index := 1.
	
	3 timesRepeat: [
		self checkRowNumber: index.
		index := index + 1.
	]! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:09:17'!
checkColumnNumber: columnNumber 
	| firstElement secondElement thirdElement |
	
	firstElement := board at: columnNumber@1.
	secondElement := board at: columnNumber@2.	
	thirdElement := board at: columnNumber@3.

	((firstElement = secondElement) and: (secondElement = thirdElement) and: (thirdElement ~= nil))
	ifTrue: [winner := firstElement].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:04:30'!
checkRowNumber: rowNumber 
	| firstElement secondElement thirdElement |
	
	firstElement := board at: 1@rowNumber.
	secondElement := board at: 2@rowNumber.	
	thirdElement := board at: 3@rowNumber.

	((firstElement = secondElement) and: (secondElement = thirdElement) and: (thirdElement ~= nil))
	ifTrue: [winner := firstElement].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:52:05'!
checkThreeOnARow
	self checkAllColumns.
	self checkAllRows.
	self checkAllDiagonals.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:06:33'!
hasPlayerOWon
	^winner = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:06:25'!
hasPlayerXWon
	^winner = #X.! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:29:48'!
moveOAt: sourcePosition to: destinationPosition
	(self isOver) ifTrue: [self error: self class gameOverErrorMessageDescription].
	self isPlayingO ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: sourcePosition) = #O ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: destinationPosition) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: self class invalidMovementErrorMessageDescription].
	
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #O.
	self checkThreeOnARow.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:26:53'!
moveXAt: sourcePosition to: destinationPosition
	(self isOver) ifTrue: [self error: self class gameOverErrorMessageDescription].
	self isPlayingX ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: sourcePosition) = #X ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: destinationPosition) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: self class invalidMovementErrorMessageDescription].
	
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #X.
	
	self checkThreeOnARow.
	player := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:38:11'!
putOAt: aPoint 
	(self isOver) ifTrue: [self error: self class gameOverErrorMessageDescription].
	self isPlayingO ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: aPoint) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(playedChips  = 6) ifTrue: [self error: self class moveExistingChipsErrorMessageDescription].
	
	playedChips := playedChips +1 .
	board at: aPoint put: #O.
	self checkThreeOnARow.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:38:05'!
putXAt: aPoint 
	(self isOver) ifTrue: [self error: self class gameOverErrorMessageDescription].
	self isPlayingX ifFalse: [self error: self class notYourTurnErrorMessageDescription].
	(board at: aPoint) = nil ifFalse: [self error: self class takenPositionErrorMessageDescription].
	(playedChips  = 6) ifTrue: [self error: self class moveExistingChipsErrorMessageDescription].
	
	playedChips := playedChips+1.
	board at: aPoint put: #X.
	self checkThreeOnARow.
	player := #O! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:22:38'!
gameOverErrorMessageDescription
	^'game is over'! !

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
