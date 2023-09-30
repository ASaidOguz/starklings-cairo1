// enums3.cairo
// Address all the TODOs to make the tests pass!
// Execute `starklings hint enums3` or use the `hint` watch subcommand for a hint.



use debug::PrintTrait;

#[derive(Drop, Copy)]
enum Message { // TODO: implement the message variant types based on their usage below
     Echo:felt252,
     ChangeColor:(u8,u8,u8),
     Move:Point,
     Quit,
}

#[derive(Drop, Copy)]
struct Point {
    x: u8,
    y: u8,
}

#[derive(Drop, Copy)]
struct State {
    color: (u8, u8, u8),
    position: Point,
    quit: bool,
}

trait StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8));
    fn quit(ref self: State);
    fn echo(ref self: State, s: felt252);
    fn move_position(ref self: State, p: Point);
    fn process(ref self: State, message: Message);
}
impl StateImpl of StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8)) {
        let State{color, position, quit, } = self;
        self = State { color: new_color, position: position, quit: quit,  };
    }
    fn quit(ref self: State) {
        let State{color, position, quit, } = self;
        self = State { color: color, position: position, quit: true,  };
    }

    fn echo(ref self: State, s: felt252) {
        s.print();
    }

    fn move_position(ref self: State, p: Point) {
        let State{color, position, quit, } = self;
        self = State { color: color, position: p, quit: quit,  };
    }

    fn process(
        ref self: State, message: Message
    ) { // TODO: create a match expression to process the different message variants
 match message{
               Message::Echo(felt_value) => {
                // Handle the Echo message
                // You can use felt_value here as needed
                // For example, you can print it
                felt_value.print();
            },
            Message::ChangeColor(new_color) => {
                // Handle the ChangeColor message
                // new_color is a tuple (u8, u8, u8)
                // You can use new_color here to change the state's color
                let (r, g, b) = new_color;
                self.change_color((r, g, b));
            },
            Message::Move(new_position) => {
                // Handle the Move message
                // new_position is a tuple (u8, u8)
                // You can use new_position here to change the state's position
                
                self.move_position(Point { x:new_position.x, y:new_position.y });
            },
                        Message::Quit => {
                // Handle the Quit message
                // You can set the quit flag to true
                self.quit();
            }
 }
    }
    
}


#[test]
fn test_match_message_call() {
    let mut state = State { quit: false, position: Point { x: 0, y: 0 }, color: (0, 0, 0),  };
    state.process(Message::ChangeColor((255, 0, 255)));
    state.process(Message::Echo('hello world'));
    state.process(Message::Move(Point { x: 10, y: 15 }));
    state.process(Message::Quit(()));

    assert(state.color == (255, 0, 255), 'wrong color');
    assert(state.position.x == 10, 'wrong x position');
    assert(state.position.y == 15, 'wrong y position');
    assert(state.quit == true, 'quit should be true');
}