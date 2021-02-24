# memory_game

The game of Memory, implemented in Flutter.

This is a bare-bones implementation of the game of Memory:
- The home page allows the player to start a new game.
- The game page displays a fixed 2x3 card layout (3x2 in landscape mode).
- There are 20 different card images of which 3 are randomly selected for each game.
- Two copies of each card are included in the layout in random order.
- The game displays all cards face-up for 5 seconds, then flips the cards face-down and starts a game timer scaled to the number of cards. 
- Selecting a card turns it face-up. 
- Matching pairs of cards are left face-up and highlighted with a border and a point is scored.
- Non-matching pairs of cards are flipped over after two seconds.
- Matching all cards within the time limit wins the game; otherwise, it is lost.

Screen reader support is included. When accessibility navigation is enabled, the game timer is disabled.
The code is able to handle other even-numbered rectangular layouts, up to 20 card pairs, but only 2x2, 2x3, and 3x4 layouts are presently supported.

## Code structure
- main.dart - the main() method.
- memory_app.dart - the application container widget.
- home_page.dart - the HomePage widget with a button to route to a GamePage for a new game.
- game_page.dart - the GamePage widget which scaffolds a GameBoardView.
- game_board_view.dart - a stateful widget that displays the game board from a GameModel and handles all user interactions. Delegates to ScoreDisplayView, TimerDisplayView, and a GridView of CardViews.
- card_view.dart - a stateless widget that displays a CardModel. Calls back to a method in GameBoardView to update game state on card selection.
- models/card_faces.dart - contains card face asset paths and helper methods to pick a random selection of them for each game.
- models/default_game_settings.dart - contains default game values for layout and timer delays.
- models/card_model.dart - immutably represents the state of a card.
- models/game_model.dart - immutably represents the state of a game.
- models/game_state.dart - enumerates the allowed game states.
- logic/game_state_machine.dart - state machine the controls game play: given the current game model and a player move or timer state change, produces a new game model.

## Basic game TO DO list
- DONE: Create skeleton app from starter project: HomePage and "New game" button
- DONE: Create card and game model classes
- DONE: Create game state machine class
- DONE: Add card image assets: SVG icons from <a href="https://uxwing.com/">uxwing</a>.
- DONE: Randomize which images are used in each game.
- DONE: Add flutter_svg package.
- DONE: Extract game settings to a single class; use a constant 2x3 game grid for now.
- DONE: Create GamePage widget (stateful, holding game state)
- DONE: Implement routing from HomePage to GamePage
- DONE: Create Card widget - stateless simple version, no click handling
- DONE: Implement initial game state: card generation and display all cards face-up
- DONE: Implement timed transition to in-play game state: all cards face-down
- DONE: Implement card click handling: transition to 1-card up state
- DONE: Implement transition to 2-card up state and set matched-card indicators (if cards match)
- DONE: Display matched card indicator (colored border) on card widgets
- DONE: Implement timed transition to unmatched cards face-down state
- DONE: Implement transition to "wonGame" state 
- DONE: Implement "wonGame" state display and routing back to HomePage
- DONE: Implement game timer, timer display, and "lostGame" state
- DONE: Implement "lostGame" state display and routing back to HomePage
- DONE: Think through game accessibility - non-trivial, since this is a visual game with a timed element
- DONE: Fix card face semantic labels; add state change announcements; disable game timer when screen reader in use
- DONE: Accessibility test/fix: TalkBack
- DONE: Accessibility test/fix: keyboard access
- DONE: Accessibility test/fix: text scale factor
- DONE: Accessibility Scanner testing
- DONE: Game state machine unit tests
- DONE: Refactor GameSettings singleton for testability
- DONE: Adjustable card layout / card count - improve HomePage, so it's not so bare-bones; refactor GamePage and GameBoardView for testability
- DONE: Refactor CardFaces singleton for testability (allow access to non-randomized card face list for testing)
- DONE: Widget tests for CardView widget
- GameModel unit tests
- Widget tests for ScoreDisplayView
- Widget tests for TimerDisplayView
- Widget tests for GameBoardView
- Flutter driver tests / use new integration_test package?
- Add custom app icon

## Potential refactorings / design decisions TBD
- Make game state machine a BLoC?
- Adopt Provider to distribute state?
- Make Card widget stateful?
- Use bdd_widget_tests package for widget testing in Gherkin?
- Performance: will card model state transitions that don't effect visibility cost too much to rebuild?

## Additional features TBD
- Improve win/loss notification UI
- Adjustable play difficulty (by adjusting game time and face-up display time)
- Add Golden tests?
- Animate card flipping (consider leveraging the flip_card package)
- Internationalization
- Persistent application state
- Transition to Null Safety
- Mute the white/black color contrast slightly

## Known issues
- GameBoardView doesn't scale properly to the display without scrolling.
- GameModel isn't as immutable as I'd like; I don't see a clean way to default a computed value into _durationSeconds.
- GameModel doesn't validate that card count hasn't changed.
- The app structure is not idiomatic Flutter. For example, the GameStateMachine draws more on my experience from Elm.
